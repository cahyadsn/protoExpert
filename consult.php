<?php
/*********************************
FILENAME    : consult.php
CREATE BY   : cahya dsn
PURPOSE     : expert system engine
CREATE DATE : 2014-04-08
UPDATE DATE : 2015-12-31
**********************************/
session_start();
if(!isset($_SESSION['id'])){
  header('location:login.php');
}else{
  include 'config.php';
  if(!isset($_GET['process'])){
    $sql="SELECT disease_code 
          FROM tmp_diseases 
          WHERE user_id='{$_SESSION['id']}' 
          GROUP BY disease_code";
    $result=$db->query($sql);
    if($result->num_rows==1){
      $sql="SELECT a.* 
            FROM tbl_diseases a
            JOIN tmp_analyzes b ON b.disease_code=a.code
            WHERE b.user_id='{$_SESSION['id']}'";
      $result=$db->query($sql);
      $solution=$result->fetch_assoc();
      foreach($solution as $k=>$v){
        echo "<b>$k</b> : $v<br>";
      }
      $sql="TRUNCATE TABLE tmp_analyzes;
            TRUNCATE TABLE tmp_diseases;
            TRUNCATE TABLE tmp_symptoms;";
      $db->multi_query($sql);
      while ($db->more_results() && $db->next_result());
      echo "<a href='consult.php'>Start Over</a> | <a href='logout.php'>Logout</a>";
      die();
    }else{
      $result->free();
      $sql="SELECT COUNT(1) AS jml
            FROM tmp_analyzes 
            WHERE user_id='{$_SESSION['id']}'";
      $result=$db->query($sql);
      $data=$result->fetch_object();
      $result->free();
      if($data->jml>0){
        $sql="SELECT a.code,a.symptom
              FROM tbl_symptoms a
                JOIN tmp_analyzes b ON b.symptom_code=a.code
              WHERE b.user_id='{$_SESSION['id']}'
                AND NOT b.symptom_code IN (
                  SELECT symptom_code 
                  FROM tmp_symptoms
                  WHERE user_id='{$_SESSION['id']}')
              ORDER BY a.code LIMIT 1";
      }else{
        $sql="SELECT code,symptom
              FROM tbl_symptoms
              ORDER BY code
              LIMIT 1";
      }
      $result=$db->query($sql);
      $data=$result->fetch_object();
    }
  }else{
    $sql="SELECT COUNT(1) AS jml
          FROM tmp_analyzes 
          WHERE user_id='{$_SESSION['id']}'";
    $result=$db->query($sql);
    $data=$result->fetch_object();
    if($data->jml>1){
      if($_POST['answer']=='Y'){
        $sql="DELETE FROM tmp_diseases
              WHERE user_id='{$_SESSION['id']}';"
              //- --
            ."INSERT INTO tmp_diseases (user_id,disease_code)
              SELECT '{$_SESSION['id']}',a.disease_code
              FROM tbl_relations a
              JOIN tmp_analyzes b USING(disease_code)
              WHERE b.symptom_code='{$_POST['symptom']}'
              GROUP BY a.disease_code
              ORDER BY a.disease_code;"
              //- --
            ."DELETE FROM tmp_analyzes 
              WHERE user_id='{$_SESSION['id']}';"
              //- --
            ."INSERT INTO tmp_analyzes (user_id, disease_code,symptom_code)
              SELECT b.user_id,a.disease_code,a.symptom_code
              FROM tbl_relations a
              JOIN tmp_diseases b USING(disease_code)
              WHERE b.user_id='{$_SESSION['id']}'
              ORDER BY a.disease_code,a.symptom_code;"
              //- --
            ."INSERT INTO tmp_symptoms (user_id,symptom_code) 
              VALUES ('{$_SESSION['id']}','{$_POST['symptom']}')";
      }else{
        $sql="DELETE tmp_analyzes FROM tmp_analyzes
              JOIN tbl_relations a USING(disease_code)
              WHERE a.symptom_code='{$_POST['symptom']}'
              AND user_id='{$_SESSION['id']}';"
              //- --
            ."DELETE tmp_diseases FROM tmp_diseases
              JOIN tbl_relations a USING(disease_code)
              WHERE a.symptom_code='{$_POST['symptom']}'
              AND user_id='{$_SESSION['id']}';";
      }
    }else{
      if($_POST['answer']=='Y'){
        $sql="INSERT INTO tmp_diseases(user_id,disease_code)
              SELECT '{$_SESSION['id']}',disease_code
              FROM tbl_relations 
              WHERE symptom_code='{$_POST['symptom']}';"
              //- --
            ."INSERT INTO tmp_analyzes (user_id, disease_code,symptom_code)
              SELECT b.user_id,a.disease_code,a.symptom_code
              FROM tbl_relations a
              JOIN tmp_diseases b USING(disease_code)
              WHERE b.user_id='{$_SESSION['id']}'
              ORDER BY a.disease_code,a.symptom_code;"
              //- --
            ."INSERT INTO tmp_symptoms (user_id,symptom_code) 
              VALUES ('{$_SESSION['id']}','{$_POST['symptom']}')";
      }else{
        $sql="INSERT INTO tmp_analyzes(user_id,disease_code,symptom_code)
              SELECT '{$_SESSION['id']}',a.disease_code,a.symptom_code
              FROM tbl_relations a
              LEFT JOIN tbl_relations b ON (a.disease_code=b.disease_code AND b.symptom_code = '{$_POST['symptom']}')
              WHERE b.disease_code IS NULL
              ORDER BY a.disease_code,a.symptom_code;"
              //- --
            ."INSERT INTO tmp_diseases(user_id,disease_code)
              SELECT '{$_SESSION['id']}',a.disease_code
              FROM tbl_relations a
              LEFT JOIN tbl_relations b ON (a.disease_code=b.disease_code AND b.symptom_code = '{$_POST['symptom']}')
              WHERE b.disease_code IS NULL
              GROUP BY a.disease_code;"
              //- --
             ."DELETE tmp_analyzes FROM tmp_analyzes
              JOIN tbl_relations a USING(disease_code)
              WHERE a.symptom_code='{$_POST['symptom']}'
              AND user_id='{$_SESSION['id']}';"
              //- --
            ."DELETE tmp_diseases FROM tmp_diseases
              JOIN tbl_relations a USING(disease_code)
              WHERE a.symptom_code='{$_POST['symptom']}'
              AND user_id='{$_SESSION['id']}';";
            //
      }
    }
    $db->multi_query($sql);
    while ($db->more_results() && $db->next_result());
    header('location:consult.php');
  }
}
if(isset($data)){
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Consultations</title>
  </head>
  <body>
    <form action="consult.php?process=1" method="post" name="form1">
      <table width="100%" border="0" cellpadding="2" cellspacing="1" >
      <tr>
        <td>Answer this question</td>
      </tr>
      <tr>
        <td width="312">
        Do you <?php echo "[{$data->code}] $data->symptom";?> ?
        <input name="symptom" type="hidden" value="<?php echo $data->code; ?>"></td>
      </tr>
      <tr>
        <td>
          <input type='radio' name='answer' value='Y' checked='checked' />
          True (YES)
          <input type='radio' name='answer' value="N" />
          False (NO)
        </td>
      </tr>
      <tr>
        <td>
          <input type="submit" name="Submit" value="Process" />
        </td>
      </tr>
      </table>
    </form>
  </body>
</html>
<?php
}

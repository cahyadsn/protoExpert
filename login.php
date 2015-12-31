<?php
/*********************************
FILENAME    : login.php
CREATE BY   : cahya dsn
PURPOSE     : login form
CREATE DATE : 2014-04-08
UPDATE DATE : 2015-12-31
**********************************/
if(isset($_POST['login'])){
  include 'config.php';
  $sql="SELECT id 
        FROM tbl_users
        WHERE 
          username='{$_POST['lname']}'
          AND password=SHA1(CONCAT('{$_POST['lpass']}',salt))";
  if($result=$db->query($sql)){
    if($result->num_rows>0){
      session_start();
      $data=$result->fetch_object();
      $_SESSION['id']=$data->id;
      header('location:consult.php');
    }else{
      $msg='fail to login';
    }
  }
}
?>
<!DOCTYPE html>
<html>
  <head>
    <title>ProtoExpert</title>
  </head>
  <body>
    <div id='container'>
      <form id='login' method='post'>
        <table>
          <tr>
            <th colspan='2'>LOGIN</th>
          </tr>
          <?php
          if(isset($msg)){
            echo "<tr><td>{$msg}</td></tr>";
          }
          ?>
          <tr>
            <td>Username</td>
            <td><input type='text' name='lname' id='lname' /></td>
          </tr>
          <tr>
            <td>Password</td>
            <td><input type='password' name='lpass' id='lpass' /></td>
          </tr>
          <tr>
            <td colspan='2'><input type='submit' name='login' id='login' /></td> 
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>

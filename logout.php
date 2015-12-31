<?php
/*********************************
FILENAME    : logout.php
CREATE BY   : cahya dsn
PURPOSE     : logout apps
CREATE DATE : 2014-04-08
UPDATE DATE : 2015-12-31
**********************************/
session_start();
unset($_SESSION['id']);
header('location:login.php');

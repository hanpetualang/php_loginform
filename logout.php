<?php
  //destroy session and redirecting to login page
  session_start();
  $_SESSION['userweb']="";
  session_destroy();
  header("location:index.php");
?>

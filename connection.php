<?php
  //Creating connection to database
  //please change following your database setting

  $DB_Location = "localhost";
  $DB_Username = "root";
  $DB_Password = "";
  $DB_DBName   = "epark";
  $connect = mysqli_connect($DB_Location, $DB_Username, $DB_Password, $DB_DBName);
  if(!$connect)
    echo "database connection failed";
?>

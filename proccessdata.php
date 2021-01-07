<?php
  include_once "connection.php";
  $form = $_POST['username'];
  //echo "TEST : ".$form;
  $res = "SELECT id_user FROM users WHERE username LIKE '$form';";
  $result = $connect->query($res);
  $username;
    if ($result->num_rows > 0){
      $row = $result->fetch_assoc();
      $username =  $row["id_user"];
    }

  $licenseplate = $_POST['licenseplate'];
  $vehiclebrand = $_POST['vehiclebrand'];
  $vehicletype = $_POST['vehicletype'];
  $parkinglocation = $_POST['parkinglocation'];
  $duration = $_POST['duration'];
  $produced = $_POST['produced'];
  $totalPrice = 2000 + ($duration-1)*1000;
  $parkingCode = rand(99, 999);
  $randEmploye = rand(1,10);

  mysqli_query($connect, "INSERT INTO vehicle (licenseplate, type, brand, produced)
  VALUES ('$licenseplate', '$vehicletype', '$vehiclebrand', '$produced');");

  mysqli_query($connect, "INSERT INTO reserveparking (parkingCode, id_user, licensePlate, locationCode, Duration) VALUES
  ('$parkingCode', '$username', '$licenseplate', '$parkinglocation', '$duration');");

  mysqli_query($connect,"INSERT INTO transaction (id_employee, id_parkingCode, totalPrice)
  VALUES('$randEmploye', '$parkingCode', '$totalPrice');");

  $connect->close();
  header(location:"transaction.php");
?>

<?php
  session_start();
  include "connection.php";
  $username = "";
  $password = "";
  if(isset($_POST['signup'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
  }
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <title>Sign Up</title>
  </head>
  <body class="bg-info">
  <div class="container position-absolute top-50 start-50 translate-middle bg-white" style="padding:40px">
  <div class="mx-auto text-muted text-center" style="width:250px">
      <h1>Sign Up<h1>
  </div>
  <form class="login" method="post">
  <input class="form-control form-control-lg" type="text" name="username" placeholder="Username"><br>
  <input class="form-control form-control-lg" type="password" name="password" placeholder="Password"><br>
  <div class="d-grid">
  <button class="btn btn-info btn-lg" type="submit" name="signup" >Sign Up</button>
  </div>
  <br>
  </form>


    <?php
    //Check if submit button is active
      if(isset($_POST['signup'])) {
        //check is there has empty form
        if($username==""||$password==""){
          echo "<div class='alert alert-secondary'>";
          echo "Username and/or password cannot be empty";
          echo "</div>";
        } else {
          //check account availability
          $insert = "INSERT INTO users(username, password) VALUES ('$username', MD5('$password'));";
          $qry = mysqli_query($connect, "SELECT * FROM users where username = '$username';");
          $check = mysqli_num_rows($qry);
          if($check){
            echo "<div class='alert alert-secondary'>";
            echo "Username already used";
            echo "</div>";
          } else {
            //adding new data to database
            mysqli_query($connect, $insert);
            echo "<div class='alert alert-success'> Account created successfully,  &nbsp;";
            echo "<a href=welcome.php>Go to site</a>";
            echo "</div>";
            exit;
          }
        }
      }
    ?>
    <div class="text-center">
    Already have an account ?&nbsp;<a href="index.php" style="color:black">Login</a>
    </div>
    </div>
  </body>
</html>

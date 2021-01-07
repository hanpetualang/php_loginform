
<!-- Redirect to login page if not logged in-->
<?php
  include_once "connection.php";
  $username = $_POST['uname'];
  if(!isset($username))
    header("location:index.php");
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Order</title>
    <!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
      <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.php">Logout</a>
            </li>
        </div>
      </div>
    </nav>
    <div class="jumbotron bg-dark text-light text-center">
      <h1 class="display-4 text-info">W e l c o m e !</h1>
      <p class="lead">Safe, efficient, trusted.</p>
    </div>

    <div class="container">
      <div class="container mx-auto text-center">
        <br><br>
        <b style="font-size:21px"> Reserve a place </b>
        <br><br>
      </div>
      <form action="proccessdata.php" method="POST">
        <input type="text" name="username" value="<?php echo $username?>" hidden>
        <div class="form-group">
          <label for="exampleInputEmail1">License Plate</label>
          <input type="text" name="licenseplate" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
          <br>
        </div>
        <div class="form-group">
          <label for="exampleInputEmail1">Vehicle Brand</label>
          <input type="text" name="vehiclebrand" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
          <br>
        </div>
        <div class="form-group">
          <label for="exampleInputEmail1">Vehicle Type</label>
          <input type="text" name="vehicletype" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
          <br>
        </div>
        <div class="form-group">
          <label for="exampleInputEmail1">Vehicle Production Year</label>
          <input type="text" name="produced" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
          <br>
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Parking Location (Select ID)</label>
          <input type="number" name="parkinglocation" min="0" class="form-control" id="exampleInputPassword1">
          <br>
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Duration(Hour)</label>
          <input type="number" name="duration" min="0" class="form-control" id="exampleInputPassword1">
          <br>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
  </body>
</html>

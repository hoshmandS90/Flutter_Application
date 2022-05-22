<?php

include 'includes/config.php';

header('Content-Type: application/json');

$name=$_POST['name'];
$email=$_POST['email'];
$password=$_POST['password'];

$adduser=mysqli_query($db,"INSERT INTO `users` (`name`, `email`, `password`) VALUES ('$name', '$email', '$password')");


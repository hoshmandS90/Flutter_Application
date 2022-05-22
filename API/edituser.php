<?php 
 include 'includes/config.php';
 header('Content-Type: application/json');


        $id=$_POST['id'];
        $name=$_POST['name'];
        $email=$_POST['email'];
        $password=$_POST['password'];
        $query=mysqli_query($db,"UPDATE `users` SET `name`='$name',`email`='$email',`password`='$password' WHERE `id`='$id'");
    
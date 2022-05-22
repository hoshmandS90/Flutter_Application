<?php

include 'includes/config.php';

header('Content-Type: application/json');
if(isset($_POST['id'])){
    $id=$_POST['id'];
    $query=mysqli_query($db,"DELETE FROM `users` WHERE `id`='$id'");

}

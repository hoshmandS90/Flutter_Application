<?php

$db=mysqli_connect("localhost","root","","api");

if(!$db){
    die("Connection failed: ".mysqli_connect_error());
}



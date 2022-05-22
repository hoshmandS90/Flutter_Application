<?php

include 'includes/config.php';

header('Content-Type: application/json');
$query=mysqli_query($db,'SELECT * FROM `users`');
$json=[];

foreach ($query as $row) {
    $json[]=$row;
}
echo json_encode($json);


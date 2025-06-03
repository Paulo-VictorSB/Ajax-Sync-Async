<?php

require_once('../config.php');
require_once('../../libs/Database.php');

$mysql_options = [
    'host' => MYSQL_HOST,
    'database' => MYSQL_DATABASE,
    'username' => MYSQL_USERNAME,
    'password' => MYSQL_PASSWORD,
];

$params = [
    ':id' => $_GET['id']
];

$db = new Database($mysql_options);
$results = $db->execute_query("SELECT * FROM users WHERE id = :id", $params);
if($results->affected_rows != 0){
    echo json_encode($results->results[0], 128);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'error'
    ], 128);
}


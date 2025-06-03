<?php

require_once('../config.php');
require_once('../../libs/Database.php');

$mysql_options = [
   'host' => MYSQL_HOST,
   'database' => MYSQL_DATABASE,
   'username' => MYSQL_USERNAME,
   'password' => MYSQL_PASSWORD,
];

$data = json_decode(file_get_contents("php://input"), true);

$db = new Database($mysql_options);
$params = [
   ':username' => $data['username'],
   ':email' => $data['email']
];
$results = $db->execute_non_query("INSERT INTO users VALUES(0, :username, :email, NOW())", $params);

echo json_encode($results, 128);

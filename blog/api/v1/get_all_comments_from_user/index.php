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
$results = $db->execute_query("SELECT users.username, comments.id, comments.comment, comments.created_at FROM users RIGHT JOIN comments ON users.id = comments.id_user WHERE users.id = :id", $params);

echo json_encode($results, 128);

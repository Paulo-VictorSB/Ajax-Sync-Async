<?php

require_once('../config.php');
require_once('../../libs/Database.php');

$mysql_options = [
    'host' => MYSQL_HOST,
    'database' => MYSQL_DATABASE,
    'username' => MYSQL_USERNAME,
    'password' => MYSQL_PASSWORD,
];

$db = new Database($mysql_options);
$results = $db->execute_query("SELECT users.username, comments.comment, comments.created_at FROM users RIGHT JOIN comments ON users.id = comments.id_user ORDER BY comments.created_at ASC");

echo json_encode($results, 128);

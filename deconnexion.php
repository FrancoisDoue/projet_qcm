<?php
$javalink = 'script/deconnexion.js';
$title = 'deconnexion';
include_once('modules/head.php');

echo "<h2>Au revoir</h2>";

include_once('modules/footer.php');
session_destroy();

?>
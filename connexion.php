<?php
$javalink = 'script\connexion.js';

require_once("modules/head.php");

?>
<div id="formulaire" ></div>
<form action="accueil.php" method="post">
    <p>Utilisateur</p>
    <input name="utilisateur" type="text">
    <p>Mot de passe</p>
    <input name="pass" type="text">
    <button class="btnRetour" id="retour" type="bouton">Retour à l'accueil</button>
    <button class="btnGo" type="submit">Go !</button>
</form>
</div>
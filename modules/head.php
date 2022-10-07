<?php 
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/main.css" media="only screen"/>
    <link rel="stylesheet" href="css/small.css" media="only screen and (max-width: 768px)" />

    <!-- <script src="script/slider.js"></script> -->
    <script defer src="script/connexion.js"></script>
    <!-- <script defer src="script/deconnexion.js"></script> -->
    <script defer src="<?= $javalink ?>"></script>
    <title><?= $title ?></title>
</head>
<body>
    <div id="container">
        <header>
    <?php
        $currentPage = explode('/',$_SERVER['PHP_SELF']);
        $currentPage = end($currentPage);
        if($currentPage != 'index.php'){
    ?>
            <div class="containLogo">
                <a href="index">
                    <img src="src/imgsite/Logo_no_text.png" alt="">
                    <img id="logo1" src="src/imgsite/logo_txt_only" alt="">
                </a>
            </div>
    <?php } else { ?>
            <div class="containLogo">
                <img src="src/imgsite/Logo_no_text.png" alt="">
                <img id="logo1" src="src/imgsite/logo_txt_only" alt="">
            </div>
    <?php } ?>
            <div class="center-vert">
                <?php if(!(isset($_SESSION['hash'])) && $currentPage == 'index.php' ){?>
                    <a class="button" id="connexion" href="#">CONNEXION</a>
                <?php if(isset($_POST) && count($_POST)>0){
                        include_once('modules/fonct.php');
                        $requete = 'SELECT login_admin, psw_admin FROM `ADMINISTRATEUR`';
                        $datas = connectDb($requete,true);
                        foreach($datas as $dat){
                            if($_POST['utilisateur'] == $dat['login_admin']
                            && password_verify($_POST['pass'],$dat['psw_admin'])){
                                $_SESSION['nom'] = $_dat['login_admin'];
                                $_SESSION['psw'] = $_POST['pass'];
                                $_SESSION['hash'] = $dat['psw_admin'];
                                header('Location: adminAccueil');
                            }
                        }
                    }
                }else if(isset($_SESSION['hash']) && password_verify($_SESSION['psw'],$_SESSION['hash']) && !($currentPage == 'deconnexion')){?>
                    <a class="button" id="deconnexion" href="deconnexion">DECONNEXION</a>
                <?php 
                    if($currentPage != 'adminAccueil'){ ?>
                        <a class="button" id="btnGoAdm" href="adminAccueil">Administration</a>
                        <?php
                    }
                } 
            ?>
            </div>

        </header>
        <?php if($currentPage == 'index.php'){?>
        <div id="formconnect">
            <form id="form" action="" method="post">
                <p>Utilisateur</p>
                <input name="utilisateur" type="text">
                <p>Mot de passe</p>
                <input name="pass" type="text">
                <div class="center">
                    <button class="btnGo" id="retour" type="bouton">Retour à l'accueil</button>
                    <button class="btnRetour" type="submit">Go !</button>
                </div>
            </form>
        </div>
        <?php } ?>
            
        <main>

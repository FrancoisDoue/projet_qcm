<?php
$title = 'Encoder - Inscription';
require_once('modules/head.php');
require_once ("modules/fonct.php");
?>
<div class="center-container">
    <div class="text-center">
        <H1 class="text-center" id="inscription">Inscription</h1>
        <form action="#" method="post">
            <label class="label-cnx">NOM</label>
            <input class="input-cnx" name="CnxNom" type="text" placeholder="..."
                value="<?php if (isset($_POST["CnxNom"])) echo $_POST["CnxNom"];?>">
            </br>
            <label class="label-cnx">PRENOM</label>
            <input class="input-cnx" name="CnxPrenom" type="text" placeholder="..."
                value="<?php if (isset($_POST["CnxPrenom"])) echo $_POST["CnxPrenom"];?>">
            </br>
            <label class="label-cnx">MAIL</label>
            <input class="input-cnx" name="CnxMail" type="text" placeholder="..."
                value="<?php if (isset($_POST["CnxMail"])) echo $_POST["CnxMail"];?>">
            </br>
            <label class="label-cnx">TELEPHONE</label>
            <input class="input-cnx" name="CnxPhone" type="text" placeholder="..."
                value="<?php if (isset($_POST["CnxPhone"])) echo $_POST["CnxPhone"];?>">
            </br>
            <input name="BtnCnx" class="btnInscription" type="submit" value="S'inscrire">
        </form>
    </div>
</div>
<?php


$ChkChamps = "/./";
$ChkNP = "/^([a-zA-ZéèÉÈç' ]{3,20}+)$/";
$ChkPhone = "/^[0-9][0-9]{9}$/";

$ChampsOK = false;
$NPOK = false;
$MailOK= false;
$PhoneOK = false;
$CoordsOK = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $Nom = $_POST["CnxNom"];
        $Prenom = $_POST["CnxPrenom"];
        $Mail = $_POST["CnxMail"];
        $Phone = $_POST["CnxPhone"];
        $requete_IdExist = 'SELECT * FROM candidat WHERE nom_cand = "'.$Nom.'" AND prenom_cand = "'.$Prenom.'"';
        $reponse_IdExist = connectDb($requete_IdExist, true);
        if(!preg_match($ChkChamps, $Nom) || !preg_match($ChkChamps, $Prenom) || !preg_match($ChkChamps, $Mail) || !preg_match($ChkChamps, $Phone)){
            echo "<h2 class=infoErreur>Veuillez remplir tous les champs</h2></br>";
            $ChampsOK = false;
        }
        else{
            $ChampsOK = true;
        }
        if(!preg_match($ChkNP, $Nom) || !preg_match($ChkNP, $Prenom)){
            echo "<h2 class=infoErreur>Nom ou prenom incorrect</h2></br>";
            $NPOK = false;
        }
        else{
            $NPOK = true;
        }
        if(filter_var($Mail, FILTER_VALIDATE_EMAIL)){
            $MailOK = true;
        }
        else{
            echo "<h2 class=infoErreur>Email invalide</h2></br>";
            $MailOK = false;
        }
        if(!preg_match($ChkPhone, $Phone)){
            echo "<h2 class=infoErreur>Numéro de téléphone invalide</h2></br>";
            $PhoneOK = false;
        }
        else{
            $PhoneOK = true;
        }
        if($reponse_IdExist && $ChampsOK && $NPOK && $MailOK && $PhoneOK == true){
            echo "<h2 class=infoErreur>Cet utilisateur existe déjà</h2></br>";
            $CoordsOK = false;
        }
        else{
            $CoordsOK = true;
        }
        if($ChampsOK && $NPOK && $MailOK && $PhoneOK && $CoordsOK == true){
        $requete_InfoInscription = 'insert into candidat (nom_cand, prenom_cand, mail_cand, tel_cand)
                     VALUES ("'.$Nom.'", "'.$Prenom.'", "'.$Mail.'", "'.$Phone.'")';
        $reponse_IdCnx = connectDb($requete_InfoInscription, true);
        $requete_test2 = 'SELECT id_cand FROM candidat WHERE nom_cand = "'.$Nom.'" AND prenom_cand = "'.$Prenom.'"';
        $reponse_IdCand = connectDb($requete_test2, true);
        foreach($reponse_IdCand as $idURL){
            header('Location: candidat_qcm?Cand='.$idURL[0]);
        }
    }
}
require_once('modules/footer.php')
?>
</main>
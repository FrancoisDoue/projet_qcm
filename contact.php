<?php
$javalink = 'script/contact.js';
$title = 'Encodeur - Contact';
require_once("modules/head.php");
?>

<h1 class="contact">Contact</h1>


<form method="POST" action="" id="formContact">
    <p id="nContact1">Nom</p>
    <input id="nContact" class="input-contact" type="text" name="postNom">
    <p id="pContact1">Prénom</p>
    <input id="pContact"class="input-contact" type="text" name="postPrenom"> 
    <p id="telContact1">Téléphone</p>
    <input id="telContact"class="input-contact" type="text" name="postTel"> 
    <p id="mailContact1">Mail</p>
    <input id="mailContact" class="input-contact" type="mail" name="postMail">
    <p id="messageContact1">Message</p>
    <textarea id="messageContact" class="input-contact" type="mail" name="postMessage"></textarea></br></br>
    <input id="btnSend" class="btnContact button" type="button" value="Valider">
    <input id="btnReset" class="btnContact button" type="reset" value="Recommencer">
</form>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST"){
        $nom = $_POST["postNom"];
        $prenom = $_POST["postPrenom"];
        $mail = $_POST["postMail"];
        $tel = $_POST["postTel"];
        $messageText = $_POST["postMessage"];

        $to      = 'VladimirPoutine@blyat.ru';
        $subject = 'Contact QCM';
        $message = 'Nom : ' .$nom. ' Prenom : ' .$prenom. ' Tel : ' .$tel. "\n" .$messageText;
        $headers = 'From: '.$mail. "\r\n" .
                  'Reply-To: ' .$mail . "\r\n" .
                  'X-Mailer: PHP/' . phpversion();
 
     mail($to, $subject, $message, $headers);
}
?>
<!-- <p>  
Nous trouver  : ENCODEUR 130 rue Saint THOMAS 59500 DOUAI</br> </br>
Nous joindre  : TELEPHONE: 03.27.00.00.00 FAX :03.27.00.00.00</br> </br>
Nous écrire   : www.encodeur.com 
</p> -->
<!-- <table>
    <td>Adresse</td>
    <td>Téléphone</td>
    <td>Adresse mail</td>
</table> -->

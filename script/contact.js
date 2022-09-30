var NomOK = false,
    PrenomOK = false,
    MailOK = false,
    PhoneOK = false;
    //messageOK = false;

var Nom1 =new RegExp("^[a-zA-Z]{3,20}$");
var Prenom1=new RegExp("^[a-zA-Z]{3,20}$");
var Mail1=new RegExp("^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$");
var Phone1=new RegExp("^[0-9]{10}$");
//var Message1=new RegExp("");


window.addEventListener('load', function () {
    document.getElementById("btnSend").addEventListener("click", ValidationChamps);//validation contrôle de saisie
    document.getElementById("btnReset").addEventListener("click", reset);
    document.getElementById("nContact").addEventListener("input", CNom);
    document.getElementById("pContact").addEventListener("input", CPrenom);
    document.getElementById("mailContact").addEventListener("input", CMail);
    document.getElementById("telContact").addEventListener("input", CPhone);
});
function CNom()
{   
    var verifNom = document.getElementById("nContact").value;
    if (Nom1.test(verifNom)) {
        document.getElementById("nContact1").style.color = "#ffddb8";
    }   
    else {
        document.getElementById("nContact1").style.color = "#FF0000";
    }
}
function CPrenom()
{   
    var verifPrenom = document.getElementById("pContact").value;
    if (Prenom1.test(verifPrenom)) {
        document.getElementById("pContact1").style.color = "#ffddb8";
    }   
    else {
        document.getElementById("pContact1").style.color = "#FF0000";
    }
}
function CMail()
{   
    var verifMail = document.getElementById("mailContact").value;
    if (Mail1.test(verifMail)) {
        document.getElementById("mailContact1").style.color = "#ffddb8";
    }   
    else {
        document.getElementById("mailContact1").style.color = "#FF0000";
    }
}
function CPhone()
{   
    var verifPhone = document.getElementById("telContact").value;
    if (Phone1.test(verifPhone)) {
        document.getElementById("telContact1").style.color = "#ffddb8";
    }   
    else {
        document.getElementById("telContact1").style.color = "#FF0000";
    }
}
function ValidationChamps()
{
    verifNom = document.getElementById("nContact").value;
    verifPrenom = document.getElementById("pContact").value;
    verifMail = document.getElementById("mailContact").value;
    verifPhone = document.getElementById("telContact").value;
    //verifMessage = document.getElementById("messageContact").value;
    if (Nom1.test(verifNom)) {
        NomOK = true;
    } else {
        NomOK = false;
    }
    if (Prenom1.test(verifPrenom)) {
        PrenomOK = true;
    } else {
        PrenomOK = false;
    }
    if (Mail1.test(verifMail)) {
        MailOK = true;
    } else {
        MailOK = false;
    }
    if (Phone1.test(verifPhone)) {
        PhoneOK = true;
    } else {
        PhoneOK = false;
    }
    ValidationForm();
}
function ValidationForm()
{
    if(NomOK && PrenomOK && MailOK && PhoneOK == true){
        document.getElementById("formContact").submit();
        return true; //validation formulaire ok
    }
    else{
        alert("erreur dans le formulaire");
    }
}
function reset()
{
    document.getElementById("nContact1").style.color = "#ffddb8";
    document.getElementById("pContact1").style.color = "#ffddb8";
    document.getElementById("mailContact1").style.color = "#ffddb8";
    document.getElementById("telContact1").style.color = "#ffddb8";
}
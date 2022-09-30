if(document.getElementById('formconnect')){
    var divConnexion = document.getElementById('formconnect')
    document.getElementById('connexion').addEventListener('click',function(){
        console.log('test')
        divConnexion.style.display = 'flex'
        return false;
    })
    document.getElementById('retour').addEventListener('click',function(){
        divConnexion.style.display = 'none'
    })
}
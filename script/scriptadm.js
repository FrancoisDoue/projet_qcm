let divAdm = Array.from(document.querySelectorAll('div.admin-tool')); 
let navAdm = Array.from(document.querySelectorAll('p.btn-nav'));
let validBtn = Array.from(document.querySelectorAll('div.validDiv'));
let resetBtn = Array.from(document.querySelectorAll('div.resetDiv'));
let ajQues = document.getElementById('ajQues');
let ajCat = document.getElementById('ajCat');
let tableAjQues = document.getElementById('tableAjQues');
let tableAjCat = document.getElementById('tableAjCat');
let winHref = document.location.href.split('?')[0];
let toolId = new Array('add','suppr','edit','cons');
let btnBackEdit = document.getElementById('backToEdit');
function hideAj(a,b){ // fonction pour une div et montrer l'autre, ou cacher la div actuelle
    if(a.style.display == 'none'){
        a.style.display = 'block';
        b.style.display = 'none';
    }else{
        a.style.display = 'none';
    }
}
window.addEventListener('load', function(){
    navAdm.forEach(element => {
        element.addEventListener('click',function(){
            window.location.href = winHref+'?toolId='+toolId[navAdm.indexOf(this)]
        })
    })
    validBtn.forEach(div =>{
        div.addEventListener('click', function(){ // bouton d'envoi de form
            document.getElementById('formQuest').submit()
        })
    })
    resetBtn.forEach(div =>{
        div.addEventListener('click', function(){ // bouton de reset de form
            document.getElementById('formQuest').reset()
        })
    })
    if(!(ajQues === null && ajCat === null)){
        tableAjCat.style.display = 'none';
        tableAjQues.style.display = 'none';
        ajQues.addEventListener('click', function(){
            hideAj(tableAjQues,tableAjCat)
        })
        ajCat.addEventListener('click', function(){
            hideAj(tableAjCat,tableAjQues)
        })
    }
    if(btnBackEdit != null){
        btnBackEdit.addEventListener('click', function(){
            window.location.href = winHref+'?toolId='+toolId[2]
        } )
    }
})
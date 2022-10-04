let winHref = window.location.href.split('/')
winHref = winHref.splice(winHref.length-1,1,'index')
setTimeout(function(){
    window.location.href = 'http://localhost/projet_perso_qcm/index'
} , 5000)
// window.addEventListener('load',function(){
// })
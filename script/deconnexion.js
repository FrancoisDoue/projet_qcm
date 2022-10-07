let winHref = window.location.href
winHref = winHref.substring(winHref.lastIndexOf('/'),0)
console.log(winHref)
setTimeout(function(){
    window.location.href = winHref+'/index'
} , 5000)

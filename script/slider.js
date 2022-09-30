let allSlides = Array.from(document.querySelectorAll('#test>div'));
let prevBtn = document.getElementById('previousQ');
let nextBtn = document.getElementById('nextQ');
let cpt = 0;
function sliding(btn){
    if(btn.id == 'nextQ'){
        if(cpt < 9){
            allSlides[cpt].style.display = 'none';
            allSlides[cpt+1].style.display = 'block';
            cpt++
        }
    }else{
        if(cpt > 0){
            allSlides[cpt].style.display = 'none';
            allSlides[cpt-1].style.display = 'block';
            cpt--
        }
    }
}
window.addEventListener('load', function(){

    prevBtn.addEventListener('click',function(){
        sliding(this)
    })
    nextBtn.addEventListener('click',function(){
        sliding(this)
    })
})
<?php
$title = 'Encodeur - Remerciements';
    include("modules/head.php");
    include("modules/fonct.php");

    $recupQ = 'SELECT id_question, id_rep FROM reponse WHERE id_rep =';
    $recupId = $_POST['id_cand'];
    foreach(array_keys($_POST) as $rep){
        if(explode('-',$rep)[0] === 'R'){
            $constrReq = connectDb($recupQ.$_POST[$rep],false);
            connectDb('INSERT INTO `sont_enregistrees` (`id_question`,`id_rep`,`id_cand`) VALUE ('.$constrReq[0].','.$constrReq[1].','.$recupId.')');
        }
    }
// test en cours pour améliorer la notation:

    // var_dump($_POST);
    // $tabQ = array();
    // $prepReq = array();
    // foreach(array_keys($_POST) as $slide){
    //     if(explode('-', $slide)[0] === 'idQ'){
    //         array_push($tabQ, $slide);
    //     }
    // }
    // $cpt = 0;
    // foreach($tabQ as $ques){
    //     $index = explode('-',$ques);
    //     foreach(array_keys($_POST) as $rep){
    //         $tabName = explode('-',$rep);
    //         if($tabName[0] =='R' && $tabName[1] === $index[1]){
    //             // var_dump($ques.' => '.$rep);
    //             array_push($prepReq,[$_POST[$ques],$_POST[$rep],$_POST['id_cand']]);
    //         }
    //     }
    //     $cpt++;
    // }
    // for($i = 0; $i < count(array_keys($_POST)); $i++){
    //     if($i > 0){
    //         $compar = explode('-',array_keys($_POST)[$i-1]);
    //         $compar2 = explode('-',array_keys($_POST)[$i]);
    //         if($compar[0] == $compar2[0] && $compar[0] == 'idQ'){
    //             var_dump('test');
    //         }
    //     }
    // }
?>
        <h2 class="merci">Merci pour votre participation.</h2>
        <h3 class="resul">Vos résultats vous seront communiqués rapidement.</h3>
        <div class="btnAccueil">
            <a href="index" class="button">RETOUR A L'ACCUEIL</a>
        </div>
<?php
    include("modules/footer.php");
?>

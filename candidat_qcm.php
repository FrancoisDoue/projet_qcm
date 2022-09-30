<?php
$javalink = 'script/slider.js';
$title = 'Encodeur - QCM';
include("modules/head.php");
include("modules/fonct.php");
?> 

<form method="POST" action="fin_qcm" id="formQuestion">
<div class="bloc1">
    <div id="test">
        <?php
        $datasQ =connectDb('SELECT `id_question` FROM `question` ORDER BY RAND() LIMIT 10',true);
        $cptQ = 1;
        $cptR = 1;
        foreach($datasQ as $quest){
        $datasB = connectDb(
        'SELECT question.`id_question`,`enonc_quest`,`txt_rep`, `id_rep`
        FROM `reponse`
        NATURAL JOIN `question`
        WHERE question.`id_question` = '.$quest['id_question'].'
        ',true);
        ?>
        <div class="sous-container" id="questionQ<?= $cptQ?>">
            </br>
            <h1 class="test">Question <?= $cptQ?></h1>
            <p id="question1">
                <?= $datasB[0]['enonc_quest']?>
            </p>
            <hr class="txt-color">
            <div class="boutonRep">
                <input type="text" hidden name="idQ-<?= $cptQ ?>" value="<?= $quest['id_question'] ?>">
                <?php
                    // note pour plus tard: insérer name="R-<?=$cptQ? >-<?=$cptR? >  dans le premier input"
                        foreach($datasB as $dat){ ?>
                            <input type="checkbox" name="R-<?=$cptR?>" value="<?= $dat['id_rep']?>">
                            <label class="txt-color" for="R<?=$cptQ?>"><xmp><?= $dat['txt_rep']?></xmp></label>
                        </br>
                            <?php
                            $cptR++;
                            ?>
                <?php
                }
                $cptQ++;
                if($cptQ == count($datasQ)+1){
                    ?>
                    <input type="text" hidden name='id_cand' value="<?= $_GET['Cand']?>">
                <button class="btnInscription" type="submit">Valider le questionnaire</button>
                    <?php
                }
            ?>
            </div>
        </div>
        <?php
                }    
            ?>

        <button type="button" name="precedent" class="boutret" id="previousQ" ><i class="arrow left"></i></button>
        <button type="button" name="suivant" class="boutsui" id="nextQ" ><i class="arrow right"></i></button>
            </br>
        <!-- <button name="BtnValidation" class="btnInscription" type="submit">Valider le questionnaire</button> -->
    </div>
    </form>
    </main>
    <?php
if (isset($_POST["BtnValidation"])){
    echo"?????";

}
include("modules/footer.php");
?>
<?php
$title = 'Encoder - Administration';
$javalink = 'script/scriptadm.js';
require_once('modules/head.php');
require_once('modules/navadmin.php');
require_once('modules/config.php');
require_once('modules/fonct.php')
?>
<h2 id="titreAdmin">Administration</h2>

<?php
if(isset($_GET['toolId'])){
    switch($_GET['toolId']){
        case 'add' :
            $cat = connectDb('SELECT * FROM `categorie`', true);
            if(isset($_POST) && count(array_keys($_POST,true))>3 && array_keys($_POST,true)[0] == 'enonce'){
                connectDb(
                    'INSERT INTO `question` (`enonc_quest`,`id_cat`) 
                    VALUES ("'.$_POST['enonce'].'",'.$_POST['cat'].')');
        
                $idQues = connectDb(
                    'SELECT `id_question` 
                    FROM `question` 
                    ORDER BY `id_question` DESC 
                    LIMIT 1', false);
                $tab = array();
                foreach(array_keys($_POST,true) as $name){
                    $tempTab = explode('-',$name);
                    if(count($tempTab)>1){
                        array_push($tempTab,$name);
                        array_push($tab,$tempTab);
                    }
                }
                $prepTab = array();
                for($i = 0 ; $i < count($tab) ; $i++){
                    $valTab = array();
                    if($tab[$i][0] != 'valid'){
                        $valTab = [$_POST[$tab[$i][2]],$idQues['id_question'],'NULL',$tab[$i][1]];
                        array_push($prepTab,$valTab);
                    }else{
                        for($i2 = 0; $i2 < count($prepTab); $i2++){
                            if($prepTab[$i2][3] === $tab[$i][1]){
                                $prepTab[$i2][2] = $idQues['id_question'];
                            }
                        }
                    }
                }
                foreach($prepTab as $prep){
                    connectDb(' INSERT INTO `reponse`(`txt_rep`,`id_question`,id_question_1)
                                VALUES ("'.$prep[0].'",'.$prep[1].','.$prep[2].')');   
                }
            }else if(isset($_POST) && count(array_keys($_POST,true)) > 1 && array_keys($_POST,true)[1]=='categ'){
                connectDb('INSERT INTO `categorie`(`lib_cat`) VALUES ("'.$_POST['categ'].'")');
            } ?>
    <div id="addQuest" class="admin-tool">
    
    <form id="formQuest" method="post">
        <div class="tier-2">
    
        </div>
        <div class="tier-1">
            <div id="ajQues" class="basicbutton admButton">Ajouter question</div>
            <div id="ajCat" class="basicbutton admButton">Ajouter catégorie</div>
            <table class="table full" id="tableAjQues">
                <tbody class="table body">
                    <tr class="table line">
                        <th class="tdAdm" colspan="2">
                            <h3>Question</h3>
                        </th>
                    </tr>
                    <tr class="table line">
                        <td colspan="2">
                            <textarea class="table input inputEditArea" name="enonce"></textarea>
                        </td>
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <h3>Proposition de réponse</h3>
                        </td>
                        <td class="tdAdm cl-4">
                            <h3>Réponse valide</h3>
                        </td>
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <input class="table inputEdit" type="text" name="rep-1">
                        </td>
                        <td class="tdAdm cl-4">
                            <input class="table" type="checkbox" name="valid-1">
                        </td>
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <input class="table inputEdit" type="text" name="rep-2">
                        </td>
                        <td class="tdAdm cl-4">
                            <input class="table" type="checkbox" name="valid-2">
                        </td>
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <input class="table inputEdit" type="text" name="rep-3">
                        </td>
                        <td class="tdAdm cl-4">
                            <input class="table" type="checkbox" name="valid-3">
                        </td>
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <input class="table inputEdit" type="text" name="rep-4">
                        </td>
                        <td class="tdAdm cl-4">
                            <input class="table" type="checkbox" name="valid-4">
                        </td>
                    </tr>
                    <tr class="table line">
                        <td>
                            <select name="cat" id="">
                                <?php foreach($cat as $opt){?>
                                    <option value="<?= $opt['ID_CAT']?>"><?= $opt['LIB_CAT']?></option>
                                <?php }?>
                            </select>
                        </td>
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <div class="basicbutton validDiv admButton">Valider</div>
                        </td>
                        <td class="tdAdm cl-4">
                            <div class="basicbutton resetDiv admButton">Annuler</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table id="tableAjCat" class="table full">
                <tbody class="table body">
                    <tr class="table line">
                        <th class="tdAdm table">
                            <h3>Catégorie:</h3>
                        </th>
                        <!-- <th class="tdAdm cl-4"></th> -->
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <input class="table inputEdit" type="text" name="categ">
                        </td>
                        <td class="tdAdm cl-4">
                        </td>
                    </tr>
                    <tr class="table line">
                        <td class="tdAdm cl-8">
                            <div class="basicbutton validDiv admButton">Valider</div>
                        </td>
                        <td class="tdAdm cl-4">
                            <div class="basicbutton resetDiv admButton">Annuler</div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
    </div>
            <?php
            break;
        case 'suppr' : ?>
    <div id="delQuest" class="admin-tool">
        <?php
        if(isset($_POST['idsuppr'])){
            connectDb('DELETE FROM `reponse` WHERE `id_question` ='.$_POST['idsuppr']);
            connectDb('DELETE FROM `question` WHERE `id_question` ='.$_POST['idsuppr']);
        }
        $datasA =connectDb('SELECT `id_question` FROM `question`',true);
        foreach($datasA as $quest){
            $datasB = connectDb(
                'SELECT question.`id_question`,`enonc_quest`,`lib_cat`,`txt_rep`,`id_question_1` 
                FROM `reponse`
                NATURAL JOIN `categorie`
                NATURAL JOIN `question`
                WHERE question.`id_question` = '.$quest['id_question'].'
                ',true);
            ?>
            <div class="affichQuest">
                <div class="fgrow">
                    <h3><?= $datasB[0]['enonc_quest']?></h3>
                <?php
                    foreach($datasB as $dat){ ?>
                        <p <?php if(!is_null($dat['id_question_1'])){
                            echo 'class="green"';
                        }else{
                            echo 'class="red"';
                        } ?>
                        ><?= $dat['txt_rep']?></p>
                <?php }
                ?>
                </div>
                <form action="adminAccueil?toolId=suppr" method="post">
                    <input type="text" name="idsuppr" hidden value="<?= $quest['id_question'] ?>">
                    <button type="submit" class="deletebutton"> X </button>
                </form>
            </div>
        <?php

        }
        ?>
    </div>
        
    </div>
            <?php
            break;
        case 'edit' : ?>
    <div id="editQuest" class="admin-tool">
        
        <?php
        $datasA = connectDb('SELECT `id_question` FROM `question`',true);
        foreach($datasA as $quest){
            $datasB = connectDb(
                'SELECT question.`id_question`,`enonc_quest`,`lib_cat`,`txt_rep`,`id_question_1` 
                FROM `reponse`
                NATURAL JOIN `categorie`
                NATURAL JOIN `question`
                WHERE question.`id_question` = '.$quest['id_question'].'
                ',true);
            ?>
            <div class="affichQuest">
                <div class="fgrow">
                    <h3><?= $datasB[0]['enonc_quest']?></h3>
                <?php
                    foreach($datasB as $dat){ ?>
                        <p <?php if(!is_null($dat['id_question_1'])){
                            echo 'class="green"';
                        }else{
                            echo 'class="red"';
                        } ?>
                        ><?= $dat['txt_rep']?></p>
                <?php }
                ?>
                </div>
                <form action="adminAccueil?toolId=editid" method="post">
                    <input type="text" name="idedit" hidden value="<?= $quest['id_question'] ?>">
                    <button type="submit" class="editbutton"> Editer </button>
                </form>
            </div>
        <?php
        }
        ?>

    </div>
        <?php
        break;
        case 'editid':

            if ((isset($_POST['textedit']) && $_POST['textedit'] != '') ||
                (isset($_POST['textrep-1']) && $_POST['textrep-1'] != '') ||
                (isset($_POST['textrep-2']) && $_POST['textrep-2'] != '')){

                $idsecur = explode('OR',$_POST['id_quest'])[0];
                $tabRequest = array('UPDATE `question` SET `enonc_quest` = "'.$_POST['textedit'].'" WHERE `id_question` = '.$idsecur.';');
                array_push($tabRequest,'UPDATE `question` SET `id_cat` = '.$_POST['idcat'].' WHERE `id_question` = '.$idsecur.';');
                foreach(array_keys($_POST, true) as $line){
                    $explName = explode('-',$line);
                    if($explName[0] == 'textrep'){
                        array_push($tabRequest,'UPDATE `reponse` SET `txt_rep` = "'.$_POST[$line].'", `id_question_1` = NULL WHERE `id_rep` = '.$explName[1] );
                    }
                    if($explName[0] == 'idrep'){
                        array_push($tabRequest,'UPDATE `reponse` SET `id_question_1` = '.$_POST[$line].'  WHERE `id_rep` = '.$_POST[$line]);
                    }
                }
                foreach($tabRequest as $execute){
                    connectDb($execute);
                } ?>
                <div id="editQuest3" class="admin-tool">
                    <h2>La fiche a été éditée avec succès!</h2>
                    <div>
                        <button class="editbutton" id="backToEdit">Retour à la page d'édition</button>
                    </div>
                </div>
                <?php
            }else{ ?>
            <div id="editQuest2" class="admin-tool">
                <form id="editQ2" action="adminAccueil?toolId=editid" method="post">
                    <?php
                    $datasB = connectDb(
                        'SELECT question.`id_question`,`enonc_quest`,`id_cat`,`lib_cat`,`id_rep`,`txt_rep`,`id_question_1` 
                        FROM `reponse`
                        NATURAL JOIN `categorie`
                        NATURAL JOIN `question`
                        WHERE question.`id_question` = '.$_POST['idedit'],true);

                    $datasCat = connectDb('SELECT `id_cat`,`lib_cat` FROM `categorie`',true);
                    ?>
                    <input type="text" name="id_quest" value="<?= $datasB[0]['id_question']?>" hidden>
                    </br>
                    <textarea class="inputEdit" name="textedit" cols="30" rows="10"><?= $datasB[0]['enonc_quest']?></textarea>
                    </br>
                    <?php 
                    $cpt = 1;
                    foreach($datasB as $data){ ?>
                        <div>
                            <input class="inputEdit" type="text" name="textrep-<?= $data['id_rep'] ?>" value="<?= $data['txt_rep'] ?>">
                            <input name="idrep-<?= $cpt ?>" value="<?= $data['id_rep']?>" type="checkbox"<?php if(!is_null($data['id_question_1'])){echo 'checked';}?>>
                        </div>
                        <?php
                        $cpt++;
                    }?>
                    <div>
                        <label for="idcat">Catégorie :</label>
                        </br>
                        <select class="inputEdit" name="idcat" id="cat">
                        <?php foreach($datasCat as $cat){ ?>
                            <option value="<?= $cat['id_cat']; ?>" 
                            <?php if($cat['id_cat'] == $datasB[0]['id_cat']){echo 'selected';} ?>
                            ><?= $cat['lib_cat'] ?></option>
                        <?php } ?>
                        </select>
                    </div>
                    <div>
                        <input class="inputEdit" type="text" name="idedit" value="<?= $_POST['idedit']?>" hidden>
                        <button type="submit" class="editbutton"> Editer </button>
                        <button class="editbutton back" id="backToEdit" type="reset">Retour</button>
                    </div>
                </form>

            </div>
        </div>
        <?php
        }
        break;
        case 'cons': ?>
     <div id="consResult" class="admin-tool">
        <table class="table consult">
            <tbody class="table consult">
            <tr class="trConsult">
                <th class="consult">
                    Prénom
                </th>
                <th class="consult">
                    Nom
                </th>
                <th class="consult">
                    Score
                </th>
                <th class="consult">
                    Score /20
                </th>
            </tr>
        <?php
        $cand = connectDb('SELECT `id_cand`,`prenom_cand`,`nom_cand` FROM `candidat` ORDER BY ID_CAND',true);
        foreach($cand as $idcand){
            $verification = array();
            $rep = array();
            $reponses = connectDb(
                'SELECT `id_question`,`id_rep` 
                 FROM `sont_enregistrees` 
                 WHERE ID_CAND = '.$idcand['id_cand'],true);
            foreach($reponses as $el){
                array_push($rep,$el['id_rep']);
            }
            foreach($reponses as $idQ){
                array_push($verification, $a = connectDb(
                    'SELECT `id_rep` 
                     FROM `reponse`
                     WHERE `id_question_1` 
                     IS NOT NULL AND `id_question` ='.$idQ['id_question'],true));
            }
            $cpt1 = 0;
            $cpt2 = 0;
            foreach ($verification as $veri){
                foreach($veri as $idQvalid){
                    foreach($rep as $repD){
                        if($repD == $idQvalid['id_rep']){
                            $cpt2++;
                        }
                    }
                    $cpt1++;
                }
            }?>
            <tr class="trConsult">
                <td class="consult">
                <?= $idcand['nom_cand'] ?>
                </td>
                <td class="consult">
                <?= $idcand['prenom_cand'] ?>
                </td>
                <td class="consult">
                <?= $cpt2.'/'.$cpt1 ?>
                </td>
                <td class="consult">
                <?php if($cpt2 > 0){
                    echo round(20*$cpt2/$cpt1,1);
                }else{
                    echo '0';
                } ?>/20
                </td>
            </tr>
        <?php
        }
        ?>

            </tbody>
        </table>

    </div>
        <?php
            break;
    }
    
}
?>
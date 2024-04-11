<?php
//Get id of logged  in user
$user_id = $_SESSION['user_data']['user_id'];
$User = new User($Conn);
$currentUser = $User->getUser($user_id);

//Get user fines
$Fine = new Fine($Conn);
$fines = $Fine->getFineByUserID($user_id);
$Smarty->assign('fines', $fines);

//Pay fines 
if ($_POST) {
    $fine_id = $_POST['fine_id'];
    $action = $_POST['action'];

    if ($action == 'pay') {
        $fine = new Fine($Conn);
        $fine->markFineAsPaid($fine_id);
        header("Location: /SDDE-assignment/my-fines");
        exit;
    }
}
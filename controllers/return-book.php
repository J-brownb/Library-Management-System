<?php
//Get user transactions 
$Returns = new Lendreturn($Conn);
$returns = $Returns->getAllTransactions();
$Smarty->assign('returns', $returns);

//Return book
if ($_POST) {
    $transaction_id = $_POST['transaction_id'];
    $Returns = new Lendreturn($Conn);
    $fine_amount = $Returns->deleteTransaction($transaction_id);
    if ($fine_amount === false) {
        $error = "Sorry there was an error, try again later.";
        $Smarty->assign('error', $error);
    } else {
        $success = "Book marked as returned successfully! If a fine is due, it will be added to the user's account.";
        $Smarty->assign('success', $success);
    }
}
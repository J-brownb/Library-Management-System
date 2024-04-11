<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL & ~E_NOTICE);
require_once(__DIR__ . '/includes/boot.include.php');

if ($_GET['p']) {
    //secure pages, not accessible unless logged in, 'add user' has been made accessible to all so the application can be reviewed more easily.
    $secure_pages = array('changepassword', 'account', 'account-details', 'my-books', 'my-reviews', 'my-fines', 'my-books');
    //employee pages, not accessible unless logged in as an employee. 
    $employee_only_pages = array('add-book', 'edit-book', 'delete-book', 'add-author', 'edit-author', 'delete-author', 'edit-user', 'delete-user', 'lend-book', 'return-book');

    if (in_array($_GET['p'], $secure_pages)) {
        if (!$_SESSION['is_loggedin']) {
            header("Location: /SDDE-assignment/login");
            exit();
        }
    }

    if (in_array($_GET['p'], $employee_only_pages)) {
        if ($_SESSION['user_type'] != 'Employee') {
            header("Location: /SDDE-assignment/");
            exit();
        }
    }


    $Smarty->assign('view_name', $_GET['p']);
    require_once('controllers/' . $_GET['p'] . '.php');
    $Smarty->display('pages/' . $_GET['p'] . '.tpl');
} else {
    $Smarty->assign('view_name', 'home');
    require_once('controllers/home.php');
    $Smarty->display('pages/home.tpl');
}
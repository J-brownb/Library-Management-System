<?php
//Get all users for user list
$User = new User($Conn);
$users = $User->getAllUsers();
$Smarty->assign('users', $users);

//edit class connection
$Edit = new Edit($Conn);

//Edit user
if ($_POST) {
    $user_id = $_POST['user_id'];
    $new_user_name = $_POST['new_user_name'];
    $new_user_surname = $_POST['new_user_surname'];
    $new_user_email = $_POST['new_user_email'];
    $new_user_type = $_POST['new_user_type'];

    // Create array with user data
    $data = array(
        'user_id' => $user_id,
        'new_user_name' => $new_user_name,
        'new_user_surname' => $new_user_surname,
        'new_user_email' => $new_user_email,
        'new_user_type' => $new_user_type,
    );

    // Update user data
    $result = $Edit->editUser($data);

    // If the user was successfully updated, redirect to the user details page
    if ($result) {
        header("Location: /SDDE-assignment/users");
        exit;
    } else {
        // If there was an error, display an error message
        $Smarty->assign('error', "An error occurred.");
    }
}
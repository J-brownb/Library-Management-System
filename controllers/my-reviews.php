<?php
//Get user by ID
$User = new User($Conn);
$currentUser = $User->getUser($user_id);

//Get user reviews
$Review = new Review($Conn);
$reviews = $Review->getReviewsByUserID($user_id);
$Smarty->assign('reviews', $reviews);
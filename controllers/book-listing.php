<?php

//Bet book for listing page
$book_listing_id = $_GET['id'];
$Book = new Book($Conn);
$book_data = $Book->getBook($book_listing_id);
$Smarty->assign('book', $book_data);

//Get author of book
$Author = new Author($Conn);
$author_data = $Author->getAuthorOfBook($book_listing_id);
$book_data['author_name'] = $author_data['author_name'];
$book_data['author_surname'] = $author_data['author_surname'];
$Smarty->assign('book', $book_data);
$Smarty->assign('author', $author_data);

//Calculate rating of book
$Review = new Review($Conn);
$book_rating = $Review->calculateRating($book_listing_id);
$Smarty->assign('book_rating', round($book_rating['avg_rating'], 1));

//Submit new review
if ($_POST['rating']) {
    $Review = new Review($Conn);
    $result = $Review->createReview([
        "book_listing_id" => (int) $book_listing_id,
        "review_rating" => (int) $_POST['rating'],
        "review_text" => $_POST['review_text']
    ]);
    if ($result) {
        $Smarty->assign(
            "success",
            "Your review has been added."
        );
    } else {
        $Smarty->assign(
            "error",
            "An error occurred, please try again later. Note, you can only leave 1 review per book."
        );
    }
}

//Gets reviews for the book listing 
$review = new Review($Conn);
$reviews = $review->getReviewsByBookListingId($book_listing_id);
$Smarty->assign('reviews', $reviews);

// 
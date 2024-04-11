<?php
class Review
{
    protected $Conn;
    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    //function to create reviews, limit 1 per user per book
    public function createReview($review_data)
    {
        $query = "SELECT review_id FROM book_reviews WHERE user_id = :user_id AND book_listing_id = :book_listing_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(
            array(
                'user_id' => $_SESSION['user_data']['user_id'],
                'book_listing_id' => $review_data['book_listing_id'],
            )
        );
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            // User has already left a review for the book
            return false;
        } else {
            // User has not left a review for the book, insert the new review
            $query = "INSERT INTO book_reviews (user_id, book_listing_id, review_rating, review_text) VALUES (:user_id, :book_listing_id, :review_rating, :review_text)";
            $stmt = $this->Conn->prepare($query);

            return $stmt->execute(
                array(
                    'user_id' => $_SESSION['user_data']['user_id'],
                    'book_listing_id' => $review_data['book_listing_id'],
                    'review_rating' => $review_data['review_rating'],
                    'review_text' => $review_data['review_text'],
                )
            );
        }
    }


    //function to calculate rating
    public function calculateRating($book_listing_id)
    {
        $query = "SELECT AVG(review_rating) AS avg_rating FROM book_reviews WHERE book_listing_id = :book_listing_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(
            array(
                'book_listing_id' => $book_listing_id,
            )
        );
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    //function to get reviews for individual books, displayed on book listing page
    public function getReviewsByBookListingId($book_listing_id)
    {
        $query = "SELECT r.review_rating, r.review_text, u.user_name 
                  FROM book_reviews r 
                  JOIN users u ON r.user_id = u.user_id 
                  WHERE r.book_listing_id = :book_listing_id 
                  ORDER BY r.review_id DESC 
                  LIMIT 5";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(
            array(
                'book_listing_id' => $book_listing_id,
            )
        );
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }



    // function to display user's testimonials
    public function getReviewsByUserID($user_id)
    {
        $query = "SELECT br.*, b.book_title
        FROM book_reviews br
        JOIN book b ON b.book_listing_id = br.book_listing_id
        WHERE br.user_id = :user_id
        ";
        $data['user_id'] = $_SESSION['user_data']['user_id'];

        $stmt = $this->Conn->prepare($query);
        $stmt->bindParam(':user_id', $data['user_id']);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }




}
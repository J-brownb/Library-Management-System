<?php
class Book
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    // function to get books incl author and reviews 
    public function getAllBooks()
    {
        $query = "SELECT b.*, a.author_name, a.author_surname, 
                  ROUND((SELECT AVG(review_rating) FROM book_reviews WHERE book_listing_id = b.book_listing_id), 0) AS avg_rating
                  FROM book b 
                  JOIN author a ON b.author_id = a.author_id
                  ORDER BY b.book_listing_id DESC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    //function to get individual books
    public function getBook($book_listing_id)
    {
        $query = "SELECT * FROM book WHERE book_listing_id = :book_listing_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "book_listing_id" => $book_listing_id
        ]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    //function to 5 books for homepage, joins author and reviews. Rounds review to 0 decimal places.
    public function getFewerBooks()
    {
        $query = "SELECT b.*, a.author_name, a.author_surname, 
                  ROUND((SELECT AVG(review_rating) FROM book_reviews WHERE book_listing_id = b.book_listing_id), 0) AS avg_rating
                  FROM book b 
                  JOIN author a ON b.author_id = a.author_id
                  ORDER BY b.book_listing_id DESC 
                  LIMIT 10";
    
        $stmt = $this->Conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    

    // function to add new books
    public function addBook($data)
    {
        $query = "INSERT INTO book (book_ISBN, book_title, author_id, book_number_available, book_language, book_pages, book_genre, book_series, book_image, user_id, book_description) VALUES (:book_ISBN, :book_title, :author_id, :book_number_available, :book_language, :book_pages, :book_genre, :book_series, :book_image, :user_id, :book_description)";
        $stmt = $this->Conn->prepare($query);
        $data['user_id'] = $_SESSION['user_data']['user_id'];
        return $stmt->execute($data);
    }

    //function to search books
    public function searchBooks($query_string)
    {
        $query = "SELECT * FROM book WHERE book_title LIKE :query_string";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "query_string" => "%" . $query_string . "%"
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    //function to display user's books
    public function getBorrowedBooksByUserId($user_id)
    {
        $query = "SELECT b.book_title, a.author_name, a.author_surname, b.book_description, b.book_image, bt.borrowing_period_days, bt.order_date, bt.transaction_id, bt.return_date, bt.status
        FROM borrowing_transaction bt
        JOIN book b ON bt.book_listing_id = b.book_listing_id
        JOIN author a ON b.author_id = a.author_id
        WHERE bt.user_id = :user_id AND bt.status = 'Borrowed' OR bt.status = 'Returned'";
        $data['user_id'] = $_SESSION['user_data']['user_id'];

        $stmt = $this->Conn->prepare($query);
        $stmt->bindParam(':user_id', $data['user_id']);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}
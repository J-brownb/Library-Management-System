<?php
class Author
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }


    // Function get retrieve all authors
    public function getAllAuthors()
    {
        $query = "SELECT * FROM author ORDER BY author_name ASC";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

//Function to get one author
    public function getAuthor($author_id)
    {
        $query = "SELECT * FROM author WHERE author_id = :author_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "author_id" => $author_id
        ]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    //Function to get featured author for homepage 
    public function getFeaturedAuthor()
    {
        $query = "SELECT * FROM author ORDER BY author_id DESC LIMIT 1";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }



    //Function to add new authors 
    public function addAuthor($data)
    {
        $query = "INSERT INTO author (author_image, author_name, author_surname, author_bio, user_id) VALUES (:author_image, :author_name, :author_surname, :author_bio, :user_id) ";
        $stmt = $this->Conn->prepare($query);
        $data['user_id'] = $_SESSION['user_data']['user_id'];
        return $stmt->execute($data);
    }

    //Function to search authors
    public function searchAuthors($query_string)
    {
        $query = "SELECT * FROM author WHERE author_name LIKE :query_string";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute([
            "query_string" => "%" . $query_string . "%"
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    //Function to show latest books by author 
    public function getLatestBooksByAuthor($author_id)
    {
        $query = "SELECT b.* 
                  FROM book b 
                  JOIN author a ON b.author_id = a.author_id 
                  WHERE b.author_id = :author_id 
                  LIMIT 5";
        $stmt = $this->Conn->prepare($query);
        $stmt->bindParam(':author_id', $author_id);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

//function to get author of book
public function getAuthorOfBook($book_listing_id)
{
    $query = "SELECT author.author_id, author.author_name, author.author_surname FROM book JOIN author ON book.author_id = author.author_id WHERE book.book_listing_id = :book_listing_id";
    $stmt = $this->Conn->prepare($query);
    $stmt->execute([
        "book_listing_id" => $book_listing_id
    ]);

    
    return $stmt->fetch(PDO::FETCH_ASSOC);
}


}
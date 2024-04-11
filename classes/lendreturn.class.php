<?php
class Lendreturn
{
    protected $Conn;
    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }


    //Function to lend book
    public function lendBook($borrow_data)
    {
        // Calculate the return date based on the borrowing date and period
        $return_date = date('Y-m-d', strtotime("+" . $borrow_data['borrowing_period_days'] . " days"));

        $query = "INSERT INTO borrowing_transaction (user_id, book_listing_id, borrowing_period_days, order_date, return_date, status) VALUES (:user_id, :book_listing_id, :borrowing_period_days, :order_date, :return_date, :status)";
        $stmt = $this->Conn->prepare($query);

        return $stmt->execute(
            array(
                'user_id' => $borrow_data['user_id'],
                'book_listing_id' => $borrow_data['book_listing_id'],
                'borrowing_period_days' => $borrow_data['borrowing_period_days'],
                'order_date' => date("Y-m-d"),
                'return_date' => $return_date,
                'status' => 'borrowed'
            )
        );
    }

    // Function to list all active borrowing transactions with book and user info
    public function getAllTransactions()
    {
        $query = "SELECT bt.*, b.book_title, b.book_image, u.user_name, u.user_surname 
        FROM borrowing_transaction bt 
        JOIN book b ON bt.book_listing_id = b.book_listing_id 
        JOIN users u ON bt.user_id = u.user_id 
        WHERE bt.status = 'Borrowed'";
        $stmt = $this->Conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    //function to delete transaction 
    public function deleteTransaction($transaction_id)
    {
        $query = "SELECT user_id, return_date, book_listing_id
                  FROM borrowing_transaction
                  WHERE transaction_id = :transaction_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->bindValue(":transaction_id", $transaction_id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $user_id = $row['user_id'];
        $return_date = $row['return_date'];
        $book_listing_id = $row['book_listing_id'];
        $today = date("Y-m-d");
        // update borrowing transaction status to 'Returned'
        $query = "UPDATE borrowing_transaction
                  SET status = 'Returned'
                  WHERE transaction_id = :transaction_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->bindValue(":transaction_id", $transaction_id);
        $stmt->execute();
        // works out overdue period (todays date - return date) (rounded up)
        $days_late = ceil((strtotime($today) - strtotime($return_date)) / (60 * 60 * 24));
        // calculates fine at £1 per day
        $fine_amount = $days_late * 1;
        // if fine exists, add to fines table 
        if ($fine_amount > 0) {
            $query = "INSERT INTO fine (amount, user_id, book_listing_id, fine_status) 
                      VALUES (:fine_amount, :user_id, :book_listing_id, 'Active')";
            $stmt = $this->Conn->prepare($query);
            $stmt->bindValue(":fine_amount", $fine_amount);
            $stmt->bindValue(":user_id", $user_id);
            $stmt->bindValue(":book_listing_id", $book_listing_id);
            $stmt->execute();
            return array('fine_amount' => $fine_amount, 'book_listing_id' => $book_listing_id);
        } else {
            return array('fine_amount' => 0, 'book_listing_id' => $book_listing_id);
        }
    }
}
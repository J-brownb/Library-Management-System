{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item"><a href="/SDDE-assignment/account">Account</a></li>
                <li class="breadcrumb-item active" aria-current="page">Your Books</li>
            </ol>
        </nav>
        <h1>Your Books</h1>
        <div class="row pt-5 pb-5">
        {if $borrowed_books}
            {foreach from=$borrowed_books item=borrowed_book}
                <div class="col mb-3 mt-3">
                    <img src="/SDDE-assignment/images/books/{$borrowed_book.book_image}" alt="{$borrowed_book.book_title}" width="200px"
                        height="300px"></a>
                    <h3>{$borrowed_book.book_title}</h3>
                    <p>{$borrowed_book.author_name}
                        {$borrowed_book.author_surname}
                    </p>
                    <p><strong>Borrowed On:</strong> {$borrowed_book.order_date}</p>
                    <p><strong>Borrowing Period: </strong>{$borrowed_book.borrowing_period_days} days</p>
                    <p><strong>Due Date: </strong>{$borrowed_book.return_date}</p>
                    <p><strong>Book Status: </strong>{$borrowed_book.status}</p>
                </div>
            {/foreach}
            {else}
                <p>You have not borrowed any books yet.</p>
            {/if}
        </div>
    </div>
{/block}
{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Books</li>
            </ol>
        </nav>
        <h1>Books</h1>
        <div class="row pt-5 pb-5">
            {foreach from=$books item=book}
                <div class="col mb-3 mt-3">
                    <a href='/SDDE-assignment/book-listing/{$book.book_listing_id}'> <img
                            src="/SDDE-assignment/images/books/{$book.book_image}" alt="{$book.book_title}" width="200"
                            height="300"></a>
                    <h3>{$book.book_title}</h3>
                    <p><a href='/SDDE-assignment/author-listing/{$book.author_id}'>{$book.author_name}
                            {$book.author_surname}</a></p>
                    {if $book.avg_rating}
                        <p><i class="fas fa-star"></i> {$book.avg_rating} / 5</p>
                    {else}
                        <p>No rating yet</p>
                    {/if}
                    <a href='/SDDE-assignment/book-listing/{$book.book_listing_id}'> <button>View <i
                                class="fa fa-search"></i></button></a><br>
                </div>
            {/foreach}
        </div>
    </div>
{/block}
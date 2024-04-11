{extends file="layouts/main.tpl"}
{block name ="body"}
    <div class="container pt-5 pb-5">
        <div class="row">
            <h1 class="mt-5 mb-5">Search Results For "{$query}"</h1>
            <h2>Authors</h2>
            {foreach from=$authors item=author}
                <div class="col-sm">
                    <img src="/SDDE-assignment/images/authors/{$author.author_image}" width="200px" height="300px" alt="{$author.author_name} {$author.author_surname}">
                    <h3>{$author.author_name} {$author.author_surname}</h3>
                    <a href='/SDDE-assignment/author-listing/{$author.author_id}'> <button>View Author</button></a>
                </div>
            {/foreach}
            </div>
            <div class="row pt-5">
            <h2>Books</h2>
            {foreach from=$books item=book}
                <div class="col mb-3 mt-3">
                    <img src="/SDDE-assignment/images/books/{$book.book_image}" width="200px" height="300px" alt="{$book.book_title}">
                    <h3>{$book.book_title}</h3>
                    <a href='/SDDE-assignment/book-listing/{$book.book_listing_id}'> <button>View Book</button></a>
                </div>
            {/foreach}
        </div>
    </div>

{/block}
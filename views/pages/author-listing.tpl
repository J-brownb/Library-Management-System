{extends file="layouts/main.tpl"}
{block name ="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item"><a href="/SDDE-assignment/authors">Authors</a></li>
                <li class="breadcrumb-item active" aria-current="page">{$author.author_name} {$author.author_surname}</li>
            </ol>
        </nav>
        <h1>{$author.author_name} {$author.author_surname}</h1>
        <div class="row pt-5 pb-5">
            <div class="col">
                <img src="/SDDE-assignment/images/authors/{$author.author_image}" width="350" height="500"
                    alt="{$author.author_name} {$author.author_surname}">
            </div>
            <div class="col">
                <h3>{$author.author_name} {$author.author_surname}</h3>
                <p><strong> About the Author </strong></p>
                <p>{$author.author_bio}</p>
            </div>
        </div>
        <div class="row pt-3 pb-3">
            <h3>Books By {$author.author_name} {$author.author_surname}</h3>
            {foreach from=$authors item=book}
                <div class="col pb-3">
                    <a href="/SDDE-assignment/book-listing/{$book.book_listing_id}">
                        <img src="/SDDE-assignment/images/books/{$book.book_image}" width="200" height="300"
                            alt="{$book.book_title}">
                    </a>
                </div>
            {/foreach}
        </div>
    </div>

{/block}
{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit Book</li>
            </ol>
        </nav>
        <h1>Edit Book</h1>
        <div class="row">

            {if $error}
                <div class="alert alert-danger mb-3" role="alert">
                    {$error}
                </div>
            {else if $success}
                <div class="alert alert-success mb-3" role="alert">
                    {$success}
                </div>
            {/if}
            <form method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label" for="book_listing_id">Book</label><br>
                    <select class="form-control" id="book_listing_id" name="book_listing_id" required>
                        {foreach from=$books item=book}
                            <option value="{$book.book_listing_id}">{$book.book_title}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_ISBN">Update Book ISBN</label>
                    <input type="text" class="form-control" id="new_book_ISBN" name="new_book_ISBN" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_title">Update Book Title</label>
                    <input type="text" class="form-control" id="new_book_title" name="new_book_title" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_author_id">Update Author</label><br>
                    <label> Don't see the author? Add a new one <a href="/SDDE-assignment/add-author">here</a>. </label> <br>
                    <select class="form-control" id="new_author_id" name="new_author_id" required>
                        {foreach from=$authors item=author}
                            <option value="{$author.author_id}">{$author.author_name} {$author.author_surname}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_number_available">Update Number Available</label>
                    <input type="text" class="form-control" id="new_book_number_available" name="new_book_number_available"
                        required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_language">Update Language</label>
                    <input type="text" class="form-control" id="new_book_language" name="new_book_language" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_pages">Update Pages</label>
                    <input type="text" class="form-control" id="new_book_pages" name="new_book_pages" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_genre">Update Genre</label>
                    <input type="text" class="form-control" id="new_book_genre" name="new_book_genre" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_series">Update Series</label>
                    <select class="form-control" id="new_book_series" name="new_book_series" required>
                        <option value="y">Yes</option>
                        <option value="n">No</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_book_description">Update Description</label>
                    <input type="text" class="form-control" id="new_book_description" name="new_book_description" required>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label">Update Book Image</label>
                    <input class="form-control" type="file" id="formFile" name="new_book_image" required>
                </div>
                <button type="submit">Update Book</button>
            </form>
        </div>
    </div>
{/block}
{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add Book</li>
            </ol>
        </nav>
        <h1>Add New Book</h1>
        {if $error}
            <div class="alert alert-danger mb-3" role="alert">
                {$error}
            </div>
        {else if $success}
            <div class="alert alert-success mb-3" role="alert">
                {$success}
            </div>
        {/if} <form method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label" for="book_ISBN">Book ISBN</label>
                <input type="text" class="form-control" id="book_ISBN" name="book_ISBN" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="book_title">Book Title</label>
                <input type="text" class="form-control" id="book_title" name="book_title" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="author_id">Author</label><br>
                <label> Don't see the author? Add a new one <a href="/SDDE-assignment/add-author">here</a>. </label> <br>
                <select class="form-control" id="author_id" name="author_id" required>
                    {foreach from=$authors item=author}
                        <option value="{$author.author_id}">{$author.author_name} {$author.author_surname}</option>
                    {/foreach}
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label" for="book_number_available">Number Available</label>
                <input type="text" class="form-control" id="book_number_available" name="book_number_available" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="book_language">Language</label>
                <input type="text" class="form-control" id="book_language" name="book_language" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="book_pages">Pages</label>
                <input type="text" class="form-control" id="book_pages" name="book_pages" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="book_genre">Genre</label>
                <input type="text" class="form-control" id="book_genre" name="book_genre" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="book_series">Series?</label>
                <select class="form-control" id="book_series" name="book_series" required>
                    <option value="y">Yes</option>
                    <option value="n">No</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label" for="book_description">Description</label>
                <input type="text" class="form-control" id="book_description" name="book_description" required>
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">Book Image</label>
                <input class="form-control" type="file" id="formFile" name="book_image" required>
            </div>
            <button type="submit">Add Book</button>
        </form>
    </div>
{/block}
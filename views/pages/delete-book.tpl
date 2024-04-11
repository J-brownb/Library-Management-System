{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Delete Book</li>
            </ol>
        </nav>
        <h1>Delete Book</h1>
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
            <form method="post">
                <div class=" mb-3">
                    <label class="form-label" for="book_listing_id">Book</label><br>
                    <select class="form-control" id="book_listing_id" name="book_listing_id" required>
                        {foreach from=$books item=book}
                            <option value="{$book.book_listing_id}">{$book.book_title}</option>
                        {/foreach}
                    </select>
                </div>
                <button type="submit" name="delete-book" value="1" class="delete">Delete Book <i
                        class="fa fa-trash"></i></button>
            </form>
        </div>
    </div>
{/block}
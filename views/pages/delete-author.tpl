{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Delete Author</li>
            </ol>
        </nav>
        <h1>Delete Author</h1>
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
                    <label class="form-label" for="author_id">Author</label><br>
                    <select class="form-control" id="author_id" name="author_id" required>
                        {foreach from=$authors item=author}
                            <option value="{$author.author_id}">{$author.author_name} {$author.author_surname}</option>
                        {/foreach}
                    </select>
                </div>
                <button type="submit" name="delete-author" value="1" class="delete">Delete Author <i
                        class="fa fa-trash"></i></button>
            </form>
        </div>
    </div>
{/block}
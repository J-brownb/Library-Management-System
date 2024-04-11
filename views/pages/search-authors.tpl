{extends file="layouts/main.tpl"}
{block name ="body"}
    <div class="container pt-5 pb-5">
        <div class="row">
            <h1 class="mt-5 mb-5">Search Results For "{$authorQuery}"</h1>
            {foreach from=$authors item=author}
                <div class="col-sm">
                    <img src="/SDDE-assignment/images/authors/{$author.author_image}" width="200px" height="300px" alt="{$author.author_name} {$author.author_surname}">
                    <h3>{$author.author_name} {$author.author_surname}</h3>
                    <a href='/SDDE-assignment/author-listing/{$author.author_id}'> <button>View Author</button></a>
                </div>
            {/foreach}
        </div>
    </div>

{/block}
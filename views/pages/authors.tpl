{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Authors</li>
            </ol>
        </nav>
        <h1>Authors</h1>
        <div class="row pt-5 pb-5">
            {foreach from=$authors item=author}
                <div class="col-sm">
                    <a href='/SDDE-assignment/author-listing/{$author.author_id}'> <img
                            src="/SDDE-assignment/images/authors/{$author.author_image}" width="200" height="300"
                            alt="{$author.author_name} {$author.author_surname}">
                    </a>
                    <h3>{$author.author_name} {$author.author_surname}</h3>
                    <a href='/SDDE-assignment/author-listing/{$author.author_id}'> <button>View <i
                                class="fa fa-search"></i></button></a><br>
                </div>
            {/foreach}
        </div>
    </div>
{/block}
{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Return Book</li>
            </ol>
        </nav>
        <h1>Return Book</h1>
        {if $error}
            <div class="alert alert-danger mb-3" role="alert">
                {$error}
            </div>
        {elseif $success}
            <div class="alert alert-success mb-3" role="alert">
                {$success}
            </div>
        {/if}
        <div class="row pt-3 pb-5">
            <h3>Books to Return</h3>
            {foreach from=$returns item=transaction}
                <div class="col-sm pb-5 pt-5">
                    <img src="/SDDE-assignment/images/books/{$transaction.book_image}" alt="{$transaction.book_title}" width="200px"
                        height="300px"></a>
                    <h3>{$transaction.book_title}</h3>
                    <p><strong>Lent to: </strong>{$transaction.user_name} {$transaction.user_surname}</p>
                    <p><strong>Borrowing Period: </strong>{$transaction.borrowing_period_days} days</p>
                    <p><strong>Order Date: </strong>{$transaction.order_date}</p>
                    <p><strong>Due Date: </strong>{$transaction.return_date}</p>
                    <form method="post">
                        <input type="hidden" name="transaction_id" value="{$transaction.transaction_id}">
                        <button class="success" type="submit">Mark as Returned <i class="fa fa-check"></i></button>
                    </form>
                </div>
            {/foreach}
        </div>
    </div>
{/block}
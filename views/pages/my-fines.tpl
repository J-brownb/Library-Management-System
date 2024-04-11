{extends file="layouts/main.tpl"}

{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item"><a href="/SDDE-assignment/account">Account</a></li>
                <li class="breadcrumb-item active" aria-current="page">Your Fines</li>
            </ol>
        </nav>
        <h1>Your Fines</h1>
        <div class="row pt-5 pb-5">
            {if $fines}
                <table class="table">
                    <thead>
                        <tr>
                        <th>Book Borrowed</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$fines item=fine}
                        <tr>
                        <td>{$fine.book_title}</td>
                            <td>£{$fine.amount}</td>
                            <td>{$fine.fine_status}</td>
                            <td>
                            {*if fine unpaid *}
                                {if $fine.fine_status != 'Paid'}
                                    <form method="POST">
                                        <input type="hidden" name="fine_id" value="{$fine.fine_id}">
                                        <input type="hidden" name="action" value="pay">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-credit-card"></i> Pay Now</button>
                                    </form>
                                {* if fine paid *}
                                {else}
                                    <span class="text-success">Paid</span>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                    
                    </tbody>
                </table>
            {else}
                <p>You have no fines at the moment.</p>
            {/if}
        </div>
    </div>
{/block}
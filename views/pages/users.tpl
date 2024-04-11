{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Users</li>
            </ol>
        </nav>
        <h1>Users</h1>
        <div class="row pt-5 pb-5">
            {foreach from=$users item=user}
                <h3>{$user.user_name} {$user.user_surname}</h3>
                <p>{$user.user_email}</p>
                <p>{$user.user_type}</p>
                <p>Member Since {$user.user_reg_date}</p>
                <hr>
            {/foreach}
        </div>
    </div>
{/block}
{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item"><a href="/SDDE-assignment/account">Account</a></li>
                <li class="breadcrumb-item active" aria-current="page">Account Details</li>
            </ol>
        </nav>
        <h1>{$user_data['user_name']}'s Account Details</h1>
    <div class="row pb-5">
        <p>View your account details here.</p>
        <p> <strong> First Name: </strong>{$user_data['user_name']}</p>
        <p> <strong> Surname: </strong>{$user_data['user_surname']}</p>
        <p> <strong> Registered Email Address: </strong>{$user_data['user_email']}</p>
        <p> <strong> Account Type: </strong>{$user_data['user_type']}</p>
        <p> <strong> Member Since: </strong>{$user_data['user_reg_date']}</p>
        </div>
    </div>
{/block}
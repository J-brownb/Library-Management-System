<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="/SDDE-assignment/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Russo+One&Open+Sans:wght@400;500;700&display=swap"
        rel="stylesheet">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Library Management System</title>
</head>

<body id="page-{$view_name}">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a href="/SDDE-assignment/">
                <img src="/SDDE-assignment/images/Fic Logo.PNG" width="200" height="70" alt="Library Site Logo" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            {* Visible if user is logged in *}
            {if $user_data}
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/SDDE-assignment/">Home</a>
                        </li>
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Books</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <li><a class="dropdown-item" href="/SDDE-assignment/books">View Books</a></li>
                                    {* Visible if account type is employee *}
                                    {if in_array('Employee', $user_data)}
                                        <li><a class=" dropdown-item" href="/SDDE-assignment/add-book">Add Book</a></li>
                                        <li><a class="dropdown-item" href="/SDDE-assignment/edit-book">Edit Book</a></li>
                                        <li><a class="dropdown-item" href="/SDDE-assignment/delete-book">Delete Book</a></li>
                                    {/if}
                                </ul>
                            </li>
                        </ul>
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Authors</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <li><a class="dropdown-item" href="/SDDE-assignment/authors">View Authors</a></li>
                                    {if in_array('Employee', $user_data)}
                                        <li><a class=" dropdown-item" href="/SDDE-assignment/add-author">Add Author</a></li>
                                        <li><a class="dropdown-item" href="/SDDE-assignment/edit-author">Edit Author</a></li>
                                        <li><a class="dropdown-item" href="/SDDE-assignment/delete-author">Delete Author</a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        </ul>
                        {if in_array('Employee', $user_data)}
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">Users</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="/SDDE-assignment/users">View Users</a></li>
                                        <li><a class=" dropdown-item" href="/SDDE-assignment/add-user">Add User</a></li>
                                        <li><a class="dropdown-item" href="/SDDE-assignment/edit-user">Edit User</a></li>
                                        <li><a class="dropdown-item" href="/SDDE-assignment/delete-user">Delete User</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">Lending / Returns</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="/SDDE-assignment/lend-book">Lend Book</a></li>
                                        <li><a class=" dropdown-item" href="/SDDE-assignment/return-book">Return Book</a></li>
                                    </ul>
                                </li>
                            </ul>
                        {/if}
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                            <li class="nav-item">
                                <a class="nav-link orange" href="/SDDE-assignment/account">Account</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link purple" href="/SDDE-assignment/logout">Logout</a>
                            </li>
                            </li>

                        </ul>
                    </ul>
                    <form action="/SDDE-assignment/search" method="post" class="d-flex mx-2 ms-auto">
                        <input class="form-control me-2" name="query" type="search" placeholder="Search the library.."
                            aria-label="Search">
                        <button class="btn btn-outline-success" name="top nav search bar" aria-label="search bar"
                            image.pngtype="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            {else}
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/SDDE-assignment/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/SDDE-assignment/books">View Books</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/SDDE-assignment/authors">View Authors</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link orange" href="/SDDE-assignment/login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link purple" href="/SDDE-assignment/register">Register</a>
                        </li>
                    </ul>
                    <form action="/SDDE-assignment/search" method="post" class="d-flex mx-2 ms-auto">
                        <input class="form-control me-2" name="query" type="search" placeholder="Search the library.."
                            aria-label="Search">
                        <button class="btn btn-outline-success" name="top nav search bar" aria-label="search bar"
                            type="submit"><i class="fa fa-search"></i></button></button>
                    </form>
                </div>
            {/if}
        </div>
    </nav>
    {block name="body"}
    {/block}
    {* report a problem modal*}
    <button type="button" class="btn btn-primary modal-button" data-bs-toggle="modal" data-bs-target="#problemModal">
        Report a Problem <i class="fa-solid fa-circle-exclamation"></i>
    </button>
    <div class="modal fade" id="problemModal" tabindex="-1" aria-labelledby="problemModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel">Report a Problem</h5>
                </div>
                <div class="modal-body">
                    Noticed a problem or looking for help? Fill out the form below to contact the library administration
                    team.
                    <form method="post">
                        <div class="mb-3 mt-3">
                            <label class="form-label"><strong>Your Name</strong></label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><strong>Explain The Problem</strong></label>
                            <input type="text" class="form-control" required>
                            <br>
                            <button type="submit">Submit</button>
                            <button type="button" data-bs-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="container pt-5 pb-5">
            <div class="row">
                <div class="col-sm">
                    <p class="footerhead">Quick Links <i class="fa-solid fa-bolt"></i></p>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/SDDE-assignment/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/SDDE-assignment/books">View Books</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/SDDE-assignment/authors">View Authors</a>
                    </ul>
                </div>
                <div class="col-sm">
                    <p class="footerhead">Find Us <i class="fa-solid fa-location-dot"></i></p>
                    <p>University of Suffolk <br> Waterfront Building <br> 19 Neptune Quay <br> Ipswich, IP4 1QJ</p>
                </div>
                <div class="col-sm">
                    <p class="footerhead">Follow Us <i class="fa-solid fa-thumbs-up"></i></p>
                    <div class="social-icons">
                        <ul>
                            <li>
                                <a href="/SDDE-assignment/" aria-label="Facebook link"><i
                                        class="fa-brands fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="/SDDE-assignment/" aria-label="Twitter link"><i
                                        class="fa-brands fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="/SDDE-assignment/" aria-label="Reddit link"><i
                                        class="fa-brands fa-reddit"></i></a>
                            </li>
                            <li>
                                <a href="/SDDE-assignment/" aria-label="Instagram link"><i
                                        class="fa-brands fa-instagram"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script src="/SDDE-assignment/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/fd9a509bf6.js" crossorigin="anonymous"></script>
</body>

</html>
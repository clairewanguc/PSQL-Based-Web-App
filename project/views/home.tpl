<html>
    <head>
        <title>Find My Future Advisor</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    </head>
    <body>
        <!-- Nav Bar-->
        <div id="navbar" class="collapse navbar-collapse navbar-inverse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="\home">Home</a></li>
             <li class="active"><a href="\addprofa">Register A New Professor</a></li>
        </ul>
        </div><!--/.nav-collapse -->
       

        <div class="container">
            <div class="starter-template">
                <!-- Main content should go here-->
                <h1>Professor Search</h1>
                <p>Here is an easy way to find your future research advisor if you are considering a PhD program. Start with search!</p>
                <form action="/search">
                    <input type="submit" value="Go to Search" />
                </form>
                <p>You can do more after searching! Are you a new faculty? Join here!</p>
                <form action="/addprofa/a">
                    <input type="submit" value="Add Me" />
                </form>
            </div>
        </div>
    </body>
</html>

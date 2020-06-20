<html>
    <head>
        <title>mpcs 53001 example</title>
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
                <h1>Professor View/Edit</h1>
                <p>Edit the professor with email = {{email}}</p>
                <form action="/view/{{email}}" method="get">
                    Email:<br> <input type="text" name="email" value="{{old[0]}}" readonly="readonly"> <Br>
                    Name:<br> <input type="text" name="profname" value="{{old[1]}}"><Br>
                    Sex:<br> <select name="sex"> 
                        <option>Male</option>
                        <option>Female</option>
                    </select><Br>
                    Publications:<br> <input type="int" name="npaper" value="{{old[3]}}"><Br>
                    Birthdate:<br> <input type="date" name="birthdate" value="{{old[4]}}"><Br>
                    Focus:<br> <input type="text" name="focus" value="{{old[5]}}"><Br>
                    Department:<br> <input type="text" name="profdept" value="{{old[6]}}"><Br>
                    Lab:<br> <input type="text" name="pilab" value="{{old[7]}}"><Br>
                    <br>
                    <input type="submit" name="save" value="save">
                </form>
            </div>
        </div>
    </body>
</html>
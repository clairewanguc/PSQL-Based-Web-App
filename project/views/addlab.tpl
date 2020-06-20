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
                <h1>Add a lab</h1>
                <form action="/addlab" method="POST">
                    Lab name:<br><input type="text" size="40" name="labname"><Br>
                    Number of students in the lab:<br><input type="int" size="40" name="size_student"><Br>
                    Number of staff in the lab:<br><input type="int" size="40" name="size_staff"><Br>
                    Department name:<br><input type="text" size="50" name="labdept"><Br>
                    <br>
                    <input type="submit" name="add" value="Add to the list">
                </form>
            </div>
        </div>
    </body>
</html>
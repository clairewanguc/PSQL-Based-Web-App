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
                <h1>Professor's labs View/Edit</h1>
                <p>Edit lab information of the professor with email = {{email}}</p>
                <form action="/addlab/{{email}}" method="get">
                    Lab Name:<br> <input type="text" name="labname" value="{{old[0]}}"> <Br>
                    Number of students in the lab:<br> <input type="int" name="size_student" value="{{old[1]}}"><Br>
                    Number of staffs in the lab:<br> <input type="int" name="size_staff" value="{{old[2]}}"><Br>
                    Lab department:<br> <input type="text" name="labdept" value="{{old[3]}}"><Br>
                    <br>
                    <input type="submit" name="save" value="save">
                </form>
            </div>
        </div>
    </body>
</html>
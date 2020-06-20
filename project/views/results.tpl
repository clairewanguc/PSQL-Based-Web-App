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
                <h1>Professors</h1>

                <p>The results for your search are as follows:</p>
                <table class="table table-striped">
                  <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Focus</th>
                    <th colspan="3"> Others</th>
                  </tr>
                %for row in rows:
                  <tr>
                  %for col in row:
                    <td>{{col}}</td>
                    
                  %end
                  <td> <a href="/view/{{row[1]}}">View / Edit</a> </td> 
                    <td> <a href="/deleteprof/{{row[1]}}">Delete</a> </td> 
                    <td> <a href="/labs/{{row[1]}}">Show lab</a> </td>    
                    <td> <a href="/addlab/{{row[1]}}">Add new lab</a> </td>
                  </tr>
                %end
                <td> <a href="/addprofa/{{row[0]}}">Add new professor based on name</a> </td>
                <td> <a href="/addprofb/{{row[2]}}">Add new professor based on focus</a> </td>
                </table>
            </div>
        </div>
    </body>
</html>

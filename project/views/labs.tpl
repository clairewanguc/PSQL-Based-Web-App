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
                <h1>Professor whose email is {{email}} are working in the following labs</h1>
                <p>The lab you queried is as follows:</p>
                <table class="table table-striped">
                  <tr>
                    <th>Lab name</th>
                    <th>Number of students in the lab</th>
                    <th>Number of staff in the lab</th>
                    <th>Department name</th>
                  </tr>
                %for row in rows:
                  <!-- <tr> -->
                  <!-- %for col in rows: -->
                    <td>{{row}}</td>
                  <!-- %end -->
                  <!-- </tr> -->
                %end
                </table>
            </div>
        </div>
    </body>
</html>


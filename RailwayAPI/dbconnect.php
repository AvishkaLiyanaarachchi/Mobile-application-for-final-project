<?php
   define('HOST', 'localhost:3308');
   define('USER','root');
   define('PASSWORD','');
   define('DATABASE','railwaydb');

   $conn = mysqli_connect(HOST,USER,PASSWORD,DATABASE) or
   die(json_encode("Couldn't connect to the database"));

  

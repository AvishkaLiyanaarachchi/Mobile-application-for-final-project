<?php
   require_once('dbconnect.php');
   
  if($_SERVER['REQUEST_METHOD'] == "GET"){
      //fetch_userData($conn);
      //fetch_ticketDetails($conn);
      //echo json_encode("get the records");

    $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
    if(count($request)>1){
        $errormessage = "Invalide URL";
        echo json_encode($errormessage);

    }else{
      if($request[0]=='userData'){
        // $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        fetch_userData($conn);

      }else if($request[0]=='ticketDetails'){
        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        fetch_ticketDetails($conn);

      }else if($request[0]=='timeTableDetails'){
        fetch_timeTableDetails($conn);

      }else if($request[0]=='trainDetails'){
        fetch_trainDetails($conn); 

      }else if($request[0]=='paymentDetails'){
        fetch_paymentDetails($conn);

      }else if($request[0]=='reportDetails'){
        fetch_generateReport($conn); 

      }else if($request[0]=='QRcode'){
        fetch_QRcode($conn);

      }else if($request[0]=='notification'){
        fetch_trainNotification($conn);

      }else if($request[0]=='trainDetailID'){
        //$input = (arr[ay) json_decode(file_get_contents('php://input'), TRUE);\
        $url = $_SERVER['REQUEST_URI'];
        $path = "http://127.0.0.1".$url;
        fetch_trainDetailsID($conn,$path);

      }

    }

      
    
  }

  if($_SERVER['REQUEST_METHOD']=='POST'){

    $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
    if(count($request)>1){

      $errormessage = "Invalide URL";
      echo json_encode($errormessage);

    }else
      if($request[0]=='insertUserData'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_user($conn,$input);

      }else if($request[0]=='inserttimeTable'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_timeTableData($conn,$input);

      }else if($request[0]=='inserUserRoles'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_userRolesData($conn,$input);

      }else if($request[0]=='insertTrainDetails'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_userTrainDetails($conn,$input);

      }else if($request[0]=='insertTicketDetails'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_ticketDetails($conn,$input);

      }else if($request[0]=='insertPayment'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_payment($conn,$input);

      }else if($request[0]=='insertReport'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_report($conn,$input);

      }else if($request[0]=='insertNotifiction'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_notification($conn,$input);

      }else if($request[0]=='insertQRCode'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        insert_QRCode($conn,$input);

      }else if($request[0]=='trainDetailID'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        fetch_trainDetailsID($conn,$input);

      }else if($request[0]=='trainID'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        fetch_trainID($conn,$input);

      }else if($request[0]=='selectLogin'){

        //$input = (array) json_decode(file_get_contents('php://input'), TRUE);
        select_loginData($conn);
        

      }else if($request[0]=='loginDetails'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        fetch_loginData($conn,$input);

      }


     
      
  }
  

  if($_SERVER['REQUEST_METHOD']=='PUT'){

    $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
    if(count($request)>1){

      $errormessage = "Invalide URL";
      echo json_encode($errormessage);

    }else{

      if($request[0]=='updateUserData'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_user($conn,$input);

      }else if($request[0]=='updateTimetable'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_timeTable($conn,$input);

      }else if($request[0]=='updatePaymentdetail'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_paymentDetails($conn,$input);

      }else if($request[0]=='updateReport'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_reportGeneration($conn,$input);

      }else if($request[0]=='updateTicket'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_ticketDetails($conn,$input);

      }else if($request[0]=='updateTime'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_time($conn,$input);

      }else if($request[0]=='updateTrain'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_trainDetails($conn,$input);

      }else if($request[0]=='updateTrainNotification'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_trainNotification($conn,$input);

      }else if($request[0]=='updateUserRoles'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        update_userRoles($conn,$input);

      }
     
      
    }
  }

  if($_SERVER['REQUEST_METHOD']=='DELETE'){

    $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
    if(count($request)>1){

      $errormessage = "Invalide URL";
      echo json_encode($errormessage);

    }else{

      if($request[0]=='deleteUser'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_user($conn,$input);

      }else if($request[0]=='deletePayment'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_paymentDetails($conn,$input);

      }else if($request[0]=='deleteReport'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_reportGeneration($conn,$input);

      }else if($request[0]=='deleteTicket'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_ticket($conn,$input);

      }else if($request[0]=='deleteTime'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_timeTable($conn,$input);

      }else if($request[0]=='deleteTrain'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_trainDetails($conn,$input);

      }else if($request[0]=='deleteNotification'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_trainNotification($conn,$input);

      }else if($request[0]=='deleteUserRoles'){

        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        delete_userRoles($conn,$input);

      }
      
      
      
    }
  }

  function fetch_userData($conn){

      $sql = "SELECT * FROM railwaydb.tbl_user";
      $stm = mysqli_prepare($conn,$sql);
      $res = mysqli_stmt_execute($stm);
      // return var_dump($res);
      if($res){
        
        mysqli_stmt_store_result($stm);
        $num_rows = mysqli_stmt_affected_rows($stm);
        // return var_dump($);
        if($num_rows > 0){
          
          mysqli_stmt_bind_result($stm, $user_id, $user_name, $email_address,$password, $user_contactNum, $user_address, $userRlesId);
          
          $data = array();
          while(mysqli_stmt_fetch($stm)){ 
            // echo $user_name;
            $row_array['user_id'] = $user_id;
            $row_array['username'] = $user_name;
            $row_array['user_email'] = $email_address;
            $row_array['password'] = $password;
            $row_array['user_contact'] = $user_contactNum;
            $row_array['user_address'] = $user_address; 
            $row_array['tbl_userRoles_userRoleId'] = $userRlesId;
            
            array_push($data,$row_array);
            

          }
          
          echo json_encode(array("data" => $data),JSON_PRETTY_PRINT);
          http_response_code(200);
          header('Content-Type:application/json');

        }else{
            echo json_encode(array("Resuly"=>" Error : 1"));
        }
      }else{
          echo json_encode(array("Result"=>" Error : 2"));
      }

  }

  function fetch_loginData($conn,$data){

    $useremail = $data['user_email'];
    $password = $data['password'];
    $queryResult = $conn->query("SELECT * FROM railwaydb.tbl_user WHERE user_email='".$useremail."' and password='".$password."'");
    $result =array();

    while($fetchData=$queryResult->fetch_assoc()){
      $result[]=$fetchData;
    }

    if(!empty($result)){
      echo "true";
    }else{
      echo "false";
    }
   
   
  }
  
  function fetch_ticketDetails($conn){

    $sql = "SELECT * FROM railwaydb.tbl_ticket";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$ticket_id,$destination,$date,$userId,$timeTableId,$QRcodeId);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){
          $row_array['ticketId'] = $ticket_id;
          $row_array['destination'] = $destination;
          $row_array['date'] = $date;
          $row_array['tbl_user_user_id'] = $userId;
          $row_array['tbl_timeTable_timeTableId'] = $timeTableId;
          $row_array['tbl_QRcodeGeneration_QRcodeId'] = $QRcodeId;

          array_push($data,$row_array);
          

        }
        echo json_encode(array("data" => $data),JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }

  function fetch_timeTableDetails($conn){

    $sql = "SELECT * FROM railwaydb.tbl_timetable";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$time_tableID,$destination,$train_type,$arrival_time,$departure_time);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){

          $row_array['timeTableId'] = $time_tableID;
          $row_array['destination'] = $destination;
          $row_array['train_type'] = $train_type;
          $row_array['arrival_time'] = $arrival_time;
          $row_array['depature_time'] = $departure_time;

          array_push($data,$row_array);
          

        }
        echo json_encode($data,JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }

  function fetch_trainDetails($conn){

    $sql = "SELECT * FROM railwaydb.tbl_traindetail";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$train_ID,$train_name,$trainNumber,$destination,$timeTableId,$seat,$type);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){

          $row_array['trainId'] = $train_ID;
          $row_array['train_name'] = $train_name;
          $row_array['train_number'] = $trainNumber;
          $row_array['destination'] = $destination;
          $row_array['tbl_timeTable_timeTableId'] = $timeTableId;
          $row_array['availability_seat'] = $seat;
          $row_array['class_type'] = $type;

          array_push($data,$row_array);
          

        }
        echo json_encode($data,JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }

  function fetch_trainDetailsID($conn,$ff){

        $parts = parse_url($ff);
        parse_str($parts['query'], $query);
        

    $sql = "SELECT * FROM railwaydb.tbl_traindetail WHERE trainId ='".$query['id']."'";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$train_name,$trainNumber,$destination,$timeTableId,$seat,$type,$train_ID,);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){

          $row_array['train_name'] = $train_name;
          $row_array['train_number'] = $trainNumber;
          $row_array['destination'] = $destination;
          $row_array['tbl_timeTable_timeTableId'] = $timeTableId;
          $row_array['availability_seat'] = $seat;
          $row_array['class_type'] = $type;
          $row_array['trainId'] = $train_ID;

          array_push($data,$row_array);
          

        }
        echo json_encode($data,JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }

 /*function fetch_trainID($conn){

    //include 'dbconnect.php';
    //$conn = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);
    $json = file_get_contents('php://input');
    $obj = json_decode(true);
    $ID = $obj['trainId'];
    $CheckSQL = "SELECT * FROM railwaydb.tbl_traindetail WHERE trainId -'$ID'";
    $result = $conn->query($CheckSQL);
    if ($result->num_rows >0) {
    
    while($row = $result->fetch_assoc()) {
    
    $Item = $row;
    
    $json = json_encode($Item, JSON_NUMERIC_CHECK);
    
    }
    
    }else {
      
    echo "No Results Found.";
    
    }
    
    echo $json;
    
  }*/

  function fetch_trainID($conn,$data){

    
    $trainID = $data['trainId'];
    $queryResult = $conn->query("SELECT * FROM railwaydb.tbl_traindetail WHERE trainId='".$trainID."'");
    $result =array();

    while($fetchData[]=$queryResult->fetch_assoc()){
      $result=$fetchData;
    }

    if(!empty($result)){
      echo json_encode($result);
    }else{
      echo "false";
    }
   
   
  }

  function fetch_paymentDetails($conn){

    $sql = "SELECT * FROM railwaydb.tbl_payment";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$payment_ID,$paymentType,$cardNumber,$bankName,$ticketId,$userId,$timetableid,$QRcodeId);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){

          $row_array['paymentId'] = $payment_ID;
          $row_array['paymentType'] = $paymentType;
          $row_array['cardNumber'] = $cardNumber;
          $row_array['bank_name'] = $bankName;
          $row_array['tbl_ticket_ticketId'] = $ticketId;
          $row_array['tbl_ticket_tbl_user_user_id'] = $userId;
          $row_array['tbl_ticket_tbl_timeTable_timeTableId'] = $timetableid;
          $row_array['tbl_ticket_tbl_QRcodeGeneration_QRcodeId'] = $QRcodeId;

          array_push($data,$row_array);
        
        }
        echo json_encode(array("data" => $data),JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }

  function fetch_generateReport($conn){

    $sql = "SELECT * FROM railwaydb.tbl_reportgeneration";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$report_ID,$report_name,$report_type);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){

          $row_array['reportId'] = $report_ID;
          $row_array['report_name'] = $report_name;
          $row_array['report_type'] = $report_type;

          array_push($data,$row_array);
        
        }
        echo json_encode(array("data" => $data),JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }

  function fetch_QRcode($conn){

    $sql = "SELECT * FROM railwaydb.tbl_qrcodegeneration";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$Qrcode);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){

          $row_array['QRcodeId'] = $Qrcode;
          
          array_push($data,$row_array);
        
        }
        echo json_encode(array("data" => $data),JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }

  function fetch_trainNotification($conn){

    $sql = "SELECT * FROM railwaydb.tbl_trainnotification";
    $stmt = mysqli_prepare($conn,$sql);
    $result = mysqli_stmt_execute($stmt);

    if($result){

      mysqli_stmt_store_result($stmt);
      $num_rows = mysqli_stmt_affected_rows($stmt);

      if($num_rows > 0){
        mysqli_stmt_bind_result($stmt,$notification,$name);
        $data = array();
        while(mysqli_stmt_fetch($stmt)){

          $row_array['notificationId'] = $notification;
          $row_array['notification_name'] = $name;
          
          array_push($data,$row_array);
        
        }
        echo json_encode(array("data" => $data),JSON_PRETTY_PRINT);
        http_response_code(200);
        header('Content-Type:application/json');
      }else{
        echo json_encode(array("Resuly"=>" Error : 1"));
      }
    }else{
      echo json_encode(array("Result"=>" Error : 2"));
    }
  }


  function insert_user($conn,$postValues){

    //echo var_dump($postValues);

    $sql = "INSERT INTO railwaydb.tbl_user(user_id, username, user_email, password, user_contact,	user_address, tbl_userRoles_userRoleId)VALUES(?,?,?,?,?,?,?)";
   
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"isssisi",$postValues['userID'], $postValues['userName'], $postValues['emailAddress'], $postValues['password'],$postValues['contact'], $postValues['userAddress'], $postValues['userRoleId']);
    
    if($stmt->execute()){
      
      $message = array("message"=>"successfully inserted","status"=>200);
      echo json_encode($message);

    }else{
      $message = array("Unable to inserted","status"=>500);
      echo json_encode($message);
    }

    mysqli_close($conn);
    
  }

  function insert_timeTableData($conn,$timeTable){

    $sql = "INSERT INTO railwaydb.tbl_timetable(timeTableId, destination, train_type, arrival_time, depature_time)VALUES(?,?,?,?,?)";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"issss",$timeTable['timeTable_id'],$timeTable['trainDes'],$timeTable['trainType'],$timeTable['arrivalTime'],$timeTable['departureTime']);
    
    if($stmt->execute()){

      $message = array("message"=>"successfully inserted","status"=>200);
      echo json_encode($message);

    }else{
      $message = array("Unable to inserted","status"=>500);
      echo json_encode($message);
    }

    mysqli_close($conn);
    
  }

  function insert_userRolesData($conn,$roles){

    $sql = "INSERT INTO railwaydb.tbl_userroles(userRoleId, roleName)VALUES(?,?)";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param($stmt,"is",$roles['roleID'],$roles['roleName']);
    
    if($stmt->execute()){
      $message = array("message"=>"successfully inserted");
      echo json_encode($message);
    }else{
      $message = array("unable to inserted");
      echo json_encode($message);
    }

    mysqli_close($conn);
  }

  function insert_userTrainDetails($conn,$trainDetails){

    $sql = "INSERT INTO railwaydb.tbl_traindetail(trainId, train_name, train_number, destination, tbl_timeTable_timeTableId, availability_seat, class_type)VALUES(?,?,?,?,?,?,?)";

    $stmt = mysqli_prepare($conn,$sql);
    
    mysqli_stmt_bind_param($stmt,"isssiss",$trainDetails['trainId'],$trainDetails['trainName'],$trainDetails['trainNum'],$trainDetails['destination'],$trainDetails['timeTableID'],$trainDetails['seat'],$trainDetails['classType']);
    
    if($stmt->execute()){

      $message = array("message"=>"successfully inserted");
      echo json_encode($message);
      
    }else{
      $message = array("unable to inserted");
      echo json_encode($message);
    }

    mysqli_close($conn);
  }

  function insert_ticketDetails($conn,$ticketDetails){

    $sql = "INSERT INTO railwaydb.tbl_ticket(ticketId, destination, date, tbl_user_user_id, tbl_timeTable_timeTableId, tbl_QRcodeGeneration_QRcodeId)VALUES(?,?,?,?,?,?)";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param($stmt,"isdiii",$ticketDetails['ticketId'],$ticketDetails['destination'],$ticketDetails['date'],$ticketDetails['userId'],$ticketDetails['timeTableId'],$ticketDetails['QRcodeId']);
    
    if($stmt->execute()){

      $message = array("message"=>"successfully inserted");
      echo json_encode($message);
      
    }else{
      $message = array("unable to inserted");
      echo json_encode($message);
    }

    mysqli_close($conn);
  }

  function insert_payment($conn,$payment){

    $sql = "INSERT INTO railwaydb.tbl_payment(paymentId, paymentType, cardNumber, bank_name, tbl_ticket_ticketId, tbl_ticket_tbl_user_user_id,	tbl_ticket_tbl_timeTable_timeTableId, tbl_ticket_tbl_QRcodeGeneration_QRcodeId)VALUES(?,?,?,?,?,?,?,?)";
    $stmt = mysqli_prepare($conn,$sql);
     
    mysqli_stmt_bind_param($stmt,"isssiiii",$payment['paymentId'],$payment['paymentType'],$payment['cardNum'],$payment['bankName'],$payment['ticketId'],$payment['userId'],$payment['timeTableId'],$payment['QRcodeId']);
    
    if($stmt->execute()){

      $message = array("message"=>"successfully inserted");
      echo json_encode($message);
      
    }else{
      $message = array("unable to inserted");
      echo json_encode($message);
    }

    mysqli_close($conn);
  }

  function insert_report($conn,$report){

    $sql = "INSERT INTO railwaydb.tbl_reportgeneration(reportId, report_name, report_type)VALUES(?,?,?)";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param($stmt,"iss",$report['reportID'],$report['reportName'],$report['reportType']);
    
    if($stmt->execute()){

      $message = array("message"=>"successfully inserted");
      echo json_encode($message);
      
    }else{
      $message = array("unable to inserted");
      echo json_encode($message);
    }

    mysqli_close($conn);
  }

  function insert_notification($conn,$notification){

    $sql = "INSERT INTO railwaydb.tbl_trainnotification(notificationId, notification_name)VALUES(?,?)";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param($stmt,"is",$notification['notificationID'],$notification['notificationName']);
    
    if($stmt->execute()){

      $message = array("message"=>"successfully inserted");
      echo json_encode($message);
      
    }else{
      $message = array("unable to inserted");
      echo json_encode($message);
    }

    mysqli_close($conn);
  }

  function insert_QRCode($conn,$QRcode){

    $sql = "INSERT INTO railwaydb.tbl_qrcodegeneration(QRcodeId)VALUES(?)";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param($stmt,"i",$QRcode['QRcodeID']);
    
    if($stmt->execute()){

      $message = array("message"=>"successfully inserted");
      echo json_encode($message);
      
    }else{
      $message = array("unable to inserted");
      echo json_encode($message);
    }

    mysqli_close($conn);
  }



  function update_user($conn,$updateUser){

    $sql = "UPDATE railwaydb.tbl_user SET username=?, user_email=?, password=?,	user_contact=?, user_address=?, tbl_userRoles_userRoleId=? WHERE 	user_id=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param($stmt,"isssisi", $updateUser['name'], $updateUser['email'],$updateUser['password'],$updateUser['contactNum'],$updateUser['address'],$updateUser['userRoleID'],$updateUser['userID']);
    if($stmt->execute()){

      $message = array("message"=>true,"status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>false,"status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function update_timeTable($conn,$updateTime){

    $sql = "UPDATE railwaydb.tbl_timetable SET destination=?, train_type=?, arrival_time=?,	depature_time=? WHERE timeTableId=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"ssssi",$updateTime['trainDes'],$updateTime['trainType'],$updateTime['arrivalTime'],$updateTime['departureTime'],$updateTime['timeTable_id']);
    if($stmt->execute()){

      $message = array("message"=>"Successfully updated","status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>"Not updated","status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function update_paymentDetails($conn,$updatePayment){

    $sql = "UPDATE railwaydb.tbl_payment SET paymentType=?, cardNumber=?, bank_name=?, tbl_ticket_ticketId=?, tbl_ticket_tbl_user_user_id=?, tbl_ticket_tbl_timeTable_timeTableId=?, tbl_ticket_tbl_QRcodeGeneration_QRcodeId=? WHERE paymentId=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"sssiiiii",$updatePayment['paymentType'],$updatePayment['cardNo'],$updatePayment['bankName'],$updatePayment['ticketId'],$updatePayment['userid'],$updatePayment['timeTableid'],$updatePayment['QRcodeId'],$updatePayment['paymentID']);
    if($stmt->execute()){

      $message = array("message"=>"Successfully updated","status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>"Not updated","status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function update_reportGeneration($conn,$report){

    $sql = "UPDATE railwaydb.tbl_reportgeneration SET report_name	=?, report_type=? WHERE reportId=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"ssi",$report['reportName'],$report['reportType'],$report['reportID']);
    if($stmt->execute()){

      $message = array("message"=>"Successfully updated","status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>"Not updated","status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }
  
  function update_ticketDetails($conn,$ticket){

    $sql = "UPDATE railwaydb.tbl_ticket SET destination=?, 	date=?, tbl_user_user_id=?, tbl_timeTable_timeTableId=?, tbl_QRcodeGeneration_QRcodeId=? WHERE ticketId=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"sdiiii",$ticket['des'],$ticket['date'],$ticket['userid'],$ticket['time'],$ticket['ORcode'],$ticket['ticketID']);

    if($stmt->execute()){

      $message = array("message"=>"Successfully updated","status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>"Not updated","status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function update_trainDetails($conn,$train){

    $sql = "UPDATE mydb.train_details SET train_number=?, availability_of_seats=?, train_name=?, source=?, destination=? WHERE train_id=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"sssssi",$train['trainNum'],$train['seat'],$train['trainName'],$train['source'],$train['destination'],$train['trainID']);

    if($stmt->execute()){

      $message = array("message"=>"Successfully updated","status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>"Not updated","status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function update_trainNotification($conn,$trainNotification){

    $sql = "UPDATE mydb.train_notification SET notification_name=?, notification_type=?, Ticket_ticket_id=? WHERE notification_id=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"ssii",$trainNotification['notificationName'],$trainNotification['notificationType'],$trainNotification['ticketID'],$train['notificationID']);

    if($stmt->execute()){

      $message = array("message"=>"Successfully updated","status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>"Not updated","status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function update_userRoles($conn,$userRoles){

    $sql = "UPDATE mydb.user_roles SET 	role_name=?, role_description=?, permission_name=? WHERE 	role_id=?";
    $stmt = mysqli_prepare($conn,$sql);

    mysqli_stmt_bind_param( $stmt,"sssi",$userRoles['roleName'],$userRoles['roleDes'],$userRoles['permissionName'],$userRoles['roleID']);

    if($stmt->execute()){

      $message = array("message"=>"Successfully updated","status"=>200);
      echo json_encode($message); 
    
    }else{
      $message = array("message"=>"Not updated","status"=>500);
      echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function delete_user($conn,$deleteUser){

    $sql = "DELETE FROM mydb.user WHERE User_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deleteUser['userId']);

    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function delete_paymentDetails($conn,$deletePayment){

    $sql = "DELETE FROM mydb.payment_details WHERE payment_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deletePayment['paymentId']);
    
    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function delete_reportGeneration($conn,$deleteReport){

    $sql = "DELETE FROM mydb.report_generation WHERE report_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deleteReport['reportId']);
    
    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function delete_ticket($conn,$deleteTicket){

    $sql = "DELETE FROM mydb.ticket WHERE ticket_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deleteTicket['ticketId']);
    
    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function delete_timeTable($conn,$deleteTime){

    $sql = "DELETE FROM mydb.time_table WHERE time_table_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deleteTime['timeTableId']);
    
    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function delete_trainDetails($conn,$deleteTrain){

    $sql = "DELETE FROM mydb.train_details WHERE train_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deleteTrain['trainId']);
    
    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }
  
  function delete_trainNotification($conn,$deleteTrainNotification){

    $sql = "DELETE FROM mydb.train_notification WHERE notification_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deleteTrainNotification['notificationId']);
    
    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }

  function delete_userRoles($conn,$deleteUserRoles){

    $sql = "DELETE FROM mydb.user_roles WHERE role_id=?";
    $stmt = mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"i",$deleteUserRoles['roleId']);
    
    if($stmt->execute()){
        $message = array("message"=>"Succesfully deleted","status"=>200);
        echo json_encode($message); 
    
    }else{
        $message = array("message"=>"Unable to delete","status"=>500);
        echo json_encode($message);

    }
    mysqli_close($conn);

  }












  
?>
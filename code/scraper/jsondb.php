<?php

//Open json file in read mode
$jsonfile = fopen("/data.json", "r");

//var_dump(json_decode($jsonfile));
//Create array for the json file
$jsonarray=var_dump(json_decode($jsonfile, true));

//open database connection
$dbhost = 'mysql.enrega.dreamhosters.com:3306';
$dbuser = 'enrega';
$dbpass = 'hBBkaCwz';

$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die                      ('Error connecting to mysql');

$dbname = 'enrega';
mysql_select_db($dbname);


//inserting the data in the database
foreach ($jsonarray['district'] as $district){
	
	$code= $district['code']
	$url=  $district['url']
 	$matExpn= $district['matExpn']
	$works_no= $district['works_no']
	$labour_exp= $district['labour_exp']

	$query = "INSERT INTO rega_enrega_districtexpenses (districtuniqueid, NoOfWorks, LabourExpenditures, MaterialExpenditures, Link) VALUES (".$code.",".$works_no.",".$labour_exp.",".$matExpn.",'".$url."');"
	
	mysql_query($query) or die('Query failed while inserting for districts');
	
	
 	
    foreach ($district['taluka'] as $taluka){
		$code= $taluka['code']
		$url=  $taluka['url']
		$matExpn= $taluka['matExpn']
		$works_no= $taluka['works_no']
		$labour_exp= $taluka['labour_exp']

		$query = "INSERT INTO rega_enrega_blockexpenses (BlockUniqueId, NoOfWorks, LabourExpenditures, MaterialExpenditures, Link) VALUES (".$code.",".$works_no.",".$labour_exp.",".$matExpn.",'".$url."');"
		
		mysql_query($query) or die('Query failed while inserting for taluka');
		foreach ($taluka['panchayat'] as $panchayat){
			
			$code= $panchayat['code']
			$url=  $panchayat['url']
			$matExpn= $panchayat['matExpn']
			$works_no= $panchayat['works_no']
			$labour_exp= $panchayat['labour_exp']

			$query = "INSERT INTO rega_enrega_grampanchayatexpenses (GramPanchayatUniqueId, NoOfWorks, LabourExpenditures, MaterialExpenditures) VALUES (".$code.",".$works_no.",".$labour_exp.",".$matExpn.");"
			
			mysql_query($query) or die('Query failed while inserting for panchayat');
			
     } 
  } 

//Cleaning the privileges
$query = "FLUSH PRIVILEGES";
mysql_query($query) or die('Fail ho gaya re');
  
//closing the connection
mysql_close($conn);


?>
# importing the BeautifulSoup libraries
from BeautifulSoup import BeautifulSoup
# import regular expressions library and url library
import re
import urllib2

#RB:01 begin
#import MySQLDb for database operations
import MySQLdb
#RB:01 end

#global values
ipAddress="164.100.112.66"
#database connection string for MySqlDB

#code block for extraction
#global variables for url string for soup : url
#url should be fetched as a value from the database table
#for Taluka expenditure

#including the database module:  nregaDB
    # db= MySQLdb.connect(host=’Demo’, user=’root’ , passwd=’adm1n’, db=’test’)
#record set pointer returned

def valueExtraction:
    #since the panchayat pages are going to be extracted from the database
    #hence here the code block will run till the end of the recordset

    # while talukaRecordSet.EOF<> null

    # database recordset pointer. url value
    # temporarily adding static value here
    # eg. url="http://164.100.112.66/netnrega/writereaddata/citizen_out/phy_fin_reptemp_Out_1825015_1112.html"
	#RB:02 this url is now going to be fetched from the database hence commenting it out
    #url="http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fin_year=2011-2012&block_code=1809011&district_name=AHMEDNAGAR&block_name=AKOLA&page=b"
    
	##RB:02 begin
	#database connection string 
	db_connection = MySQLdb.connect(
        host=mysql.enrega.dreamhosters.com,
        user=nrega,
        passwd=hBBkaCwz,
        db=nrega
        )
	
	#cursor to execute the database commands
	cursor = db_connection.cursor()
	
	#opening the database
	#cursor.execute('nrega')
	
	#connecting with the database to retrive the link value
	query="SELECT BlockUniqueId, Link FROM rega_enrega_blockexpenses"
	
	#executing the query to fetch the details
	cursor.execute(query)
	##RB:02 ends
	
	#looping till the end of the recordset is reached
	url= cursor.fetchall()
	for row in url
		
		#Building the soup 
		
		page= urllib2.urlopen(url[1]) #link is the second value in the array
		soup=BeautifulSoup(page)

		#Extraction logic for reaching the table block containing data needed
		#codeblock: extraction
		table_block= soup('table',id="Table2")[0]

		#there are five unwanted rows
		unwanted_row= table_block.next.nextSibling
		row_count=1

		#traversing the table to remove unwanted rows
		#first row has been traversed in the above statement
		while row_count< 5:
			unwanted_row= unwanted_row.nextSibling.nextSibling
			row_count+=1 #incrementing the row_counter
			#End loop

		#first row of the required data for panchayat
		data_row= unwanted_row.nextSibling.nextSibling

		while data_row.td.nextSibling.nextSibling.next.string<>'uTotal':
			#assigning the value of the data_row to the data_col
			data_col= data_row

			#Pointing to the first column
			data_col=data_col.td.nextSibling.nextSibling

			#Panchayat name is scrapped from the screen value
			name=data_col.string
			
			#Scrapping total no.of works, labor expenditure, material Expenditure 
			#these are stored in 32nd column hence a manipulation
			col_count=1
			while col_count<32:
				data_col=data_col.nextSibling.nextSibling
				col_count+=1

			#url extraction for Panchayat code 
			temp_url= data_col.next['href']

			#url value extraction
			#the url value is extracted as '../../citizen_html' hence a small manipulation
			#appending the ip-address and the string block '/netnrega'
			url= "http://"+ipAddress+"/netnrega"+temp_url[5:]
			
			#Panchayat code index and value. Panchayat code is 10 characters
			index= temp_url.find("Panchayat_code=")
			index=index+15
			code=temp_url[index:index+10]
			#scrapping no. of Works noWorks col: 32
			noWorks=data_col.next.next.string

			#scrapping labor expenditure col :33
			data_col=data_col.nextSibling.nextSibling
			labExpn=data_col.next.string

			#scrapping material Expenditure col:34
			data_col=data_col.nextSibling.nextSibling
			matExpn=data_col.next.string

			###RB:03 begin
			#timestamp value
			time=datetime.datetime.now()
			#creating the database of the blocks and then adding the blockwise expenses for each block in the expense table
			BlockUniqueId= url[0]
			query="INSERT INTO rega_enrega_grampanchayats " +\
				"(UniqueId, BlockUniqueId, GramPanchayatName_Mr, CreatedOn) values ('%s', '%s', '%s', '%s')"%(code, BlockUniqueId, name, time)
			#Executing the query to insert block values in the block table
			cursor.execute(query)
			
			#building the string for inserting the datavalues in the database table for taluka
			query="INSERT INTO rega_enrega_grampanchayatexpenses " +\
				"(UniqueId, BlockUniqueId, NoOfWorks, LabourExpenditures, MaterialExpenditures, CreatedOn, Link)" +\
				"values ('%s', '%s', '%s', '%s', '%s', '%s', '%s')"%(code, BlockUniqueId, noWorks, labExpn, matExpn, time, url)
			#Executing the query to insert district expenditure values in the district table
			cursor.execute(query)
			
			#Inserting the values into the database table for District_Expenses
			#database code block here
			###RB:03 end
			
			#Inserting the values into the database table for Panchayat_Expenditure
			#database code block here
			
			#move to the next row
			data_row=data_row.nextSibling
		
		

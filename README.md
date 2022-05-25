# eNapsa CSV Generator

This app generates a CSV file ready for upload to the eNapsa service. 


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Specification:

- It should output a CSV file in the correct format as specified by Napsa.
- Sample employee data can initially be hard coded.
- The employee data should be kept private, and not hard coded. 
- It should handle one employee to begin with.
- It should handle more than one employee.
- Each generated file should have a unique, meaningful name
- Should auto fill the correct date for the previous month
- I can handle one employer account
- It can work with more than one employer account


## User stories 
https://enapsa.napsa.co.zm/assets/general/2022%20NAPSA%20Template%20(2).xlsm 

The required file structure is:
Account Number 	Year 	Month(Period) 	Social Security Number(SSN) 	National ID(NRC) 	Surname 	First Name 	Other Name 	Date of Birth 	Gross Pay/Salary 	Employer Share 	Employee Share

I'm going to use the sample data on the eNapsa website.
SAMPLE DATA
1234567,2016,06,123456789,123456/78/9,Banda,Mary,Chungu,23/03/1980,2500.00,125.00,125.00  
# eNapsa CSV Generator

This app generates a CSV file ready for upload to the eNapsa service. 

## How to run this programme (work in progress)

So far, it creates a csv file with the employer name generated dynamically, and the date hard-coded.

1. Clone this  to your local machine using 
`git clone https://github.com/katemyoung/csv_generator.git`

2. From the csv_generator directory, run `rails c` to open the Rails console.

3. Run the following commands, or use your own data, to create an Employer and generate a csv file.

```
3.0.0 :001 > Employer.create(name: "Small Shop", account_number: 123123)
3.0.0 :002 > june_returns = ENapsaMonthlyReport.new("Small Shop")
3.0.0 :003 > june_returns.generate_file("./june_returns.csv")
```

4. A csv file should have been generated in your app directory (or wherever you specified in the filepath). This is what the csv file contains using the above data: 123123,2022


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


## eNapsa file format 
Official eNapsa template: https://enapsa.napsa.co.zm/assets/general/2022%20NAPSA%20Template%20(2).xlsm 

The required file structure is:
Account Number 	Year 	Month(Period) 	Social Security Number(SSN) 	National ID(NRC) 	Surname 	First Name 	Other Name 	Date of Birth 	Gross Pay/Salary 	Employer Share 	Employee Share

I'm going to use the sample data on the eNapsa website:
SAMPLE DATA
1234567,2016,06,123456789,123456/78/9,Banda,Mary,Chungu,23/03/1980,2500.00,125.00,125.00  

## Additional info:
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
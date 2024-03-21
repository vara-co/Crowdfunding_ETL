<h1>ETL Group Project 2</h1> (Using Jupyter Notebook and PostgreSQL)<br/>
<h2>DU - DA Module 13<br/>
Crowdfunding ETL Mini Project<br/>
<br/>
by M. Aparisio and L. Vara</h2><br/>

![CrowdFunding_Mini_Readme](https://github.com/maparisio/Crowdfunding_ETL/assets/152572519/89c7621d-fc4b-445a-ace7-2572ac25f667)

<br/>
<br/>
<h2>INDEX</h2><br/>

1. Content of the repository<br/>
2. Instructions for the NoSQL Challenge<br/>
3. References<br/>

Content of the repository
-----------------------------------------------------------
- Resources directory:
	- campaign.csv  <-- Database created via ETL_Mini_Project_MAparisio_LVara.ipynb
	- category.csv  <-- Database created via ETL_Mini_Project_MAparisio_LVara.ipynb
	- contacts.csv  <-- Database created via ETL_Mini_Project_MAparisio_LVara.ipynb
	- contacts.xlsx  <-- Provided Excel Database 
	- crowdfunding.xlsx  <-- Provided Excel Database
	- subcategory.csv  <-- Database created via ETL_Mini_Project_MAparisio_LVara.ipynb
- Database_Crowdfunding_db.png <-- Image displaying that a Database named Crowdfunding_db was created in PostgreSQL
- ERD_Crowdfunding.png <-- Image of the ERD created to initiate the schema
- ETL_Mini_Project_MAparisio_LVara.ipynb <-- ETL initial process via Jupyter Notebook file
- crowdfunding_db_schema.sql <-- Schema used to create the Crowdfunding_db Database to finalize the ETL process
    
<h2>Instructions</h2><br/>
The instructions for this mini project are divided into the following subsections:<br/>

- Create the Category and Subcategory DataFrames
- Create the Campaign DataFrame
- Create the Contacts DataFrame
- Create the Crowdfunding Database
  
<br/>
<h3>CREATE THE CATEGORY AND SUBCATEGORY DATAFRAMES</h3><br/>

1. Extract and transform the **crowdfunding.xlsx** Excel data to create a category DataFrame that has the following columns:
- A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories
- A "category" column that contains only the category titles
- The following image shows this category DataFrame:

![InsDF01](https://github.com/maparisio/Crowdfunding_ETL/assets/152572519/32238712-9535-4982-9f52-a4a508b05fd5)


2. Export the category DataFrame as **category.csv** and save it to your GitHub repository.

3. Extract and transform the **crowdfunding.xlsx** Excel data to create a subcategory DataFrame that has the following columns:
- A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories
- A "subcategory" column that contains only the subcategory titles
- The following image shows this subcategory DataFrame:

![InsDF02](https://github.com/maparisio/Crowdfunding_ETL/assets/152572519/f0dd8694-c6ca-4ba2-9451-28a9405fac8d)


4. Export the subcategory DataFrame as **subcategory.csv** and save it to your GitHub repository.

<br/>
<h3>CREATE THE CAMPAIGN DATAFRAME</h3><br/>

Extract and transform the **crowdfunding.xlsx** Excel data to create a campaign DataFrame has the following columns:
- The "cf_id" column
- The "contact_id" column
- The "company_name" column
- The "blurb" column, renamed to "description"
- The "goal" column, converted to the float data type
- The "pledged" column, converted to the float data type
- The "outcome" column
- The "backers_count" column
- The "country" column
- The "currency" column
- The "launched_at" column, renamed to "launch_date" and with the UTC times converted to the datetime format
- The "deadline" column, renamed to "end_date" and with the UTC times converted to the datetime format
- The "category_id" column, with unique identification numbers matching those in the "category_id" column of the category DataFrame
- The "subcategory_id" column, with the unique identification numbers matching those in the "subcategory_id" column of the subcategory DataFrame
- The following image shows this campaign DataFrame:

![InsDF03](https://github.com/maparisio/Crowdfunding_ETL/assets/152572519/d55e9ade-77f3-49a3-ab77-75b69d6098ba)


2. Export the campaign DataFrame as campaign.csv and save it to your GitHub repository.

<br/>
<h3>CREATE THE CONTACTS DATAFRAME</h3><br/>
1. Choose one of the following two options for extracting and transforming the data from the **contacts.xlsx** Excel data:
- **Option 1:** Use Python dictionary methods.
- **Option 2:** Use regular expressions.

2. If you chose Option 1, complete the following steps:
- Import the **contacts.xlsx** file into a DataFrame.
- Iterate through the DataFrame, converting each row to a dictionary.
- Iterate through each dictionary, doing the following:
- Extract the dictionary values from the keys by using a Python list comprehension.
- Add the values for each row to a new list.
- Create a new DataFrame that contains the extracted data.
- Split each "name" column value into a first and last name, and place each in a new column.
- Clean and export the DataFrame as **contacts.csv** and save it to your GitHub repository.

3. If you chose Option 2, complete the following steps:

- Import the contacts.xlsx file into a DataFrame.
- Extract the "contact_id", "name", and "email" columns by using regular expressions.
- Create a new DataFrame with the extracted data.
- Convert the "contact_id" column to the integer type.
- Split each "name" column value into a first and a last name, and place each in a new column.
- Clean and then export the DataFrame as contacts.csv and save it to your GitHub repository.

4. Check that your final DataFrame resembles the one in the following image:

![InsDF04](https://github.com/maparisio/Crowdfunding_ETL/assets/152572519/c00e645a-6e2c-4d3c-b38f-688a434ca1a4)

<br/>
<h3>CREATE THE CROWDFUNDING DATABASE</h3><br/>

1. Inspect the four CSV files, and then sketch an ERD of the tables by using QuickDBDLinks to an external site..
	- https://app.quickdatabasediagrams.com/
2. Use the information from the ERD to create a table schema for each CSV file.
**Note:** Remember to specify the data types, primary keys, foreign keys, and other constraints.
3. Save the database schema as a Postgres file named **crowdfunding_db_schema.sql**, and save it to your GitHub repository.
4. Create a new Postgres database, named **crowdfunding_db.**
5. Using the database schema, create the tables in the correct order to handle the foreign keys.
6. Verify the table creation by running a **SELECT** statement for each table.
7. Import each CSV file into its corresponding SQL table.
8. Verify that each table has the correct data by running a SELECT statement for each.

**Hints**
- To split each "category & sub-category" column value into "category" and "subcategory" column values, use **df[["new_column1","new_column2"]] = df["column"].str.split().** Make sure to pass the correct parameters to the **split()** function.
- To get the unique category and subcategory values from the "category" and "subcategory" columns, create a NumPy array where the array length equals the number of unique categories and unique subcategories from each column. For information about how to do so, see numpy.arangeLinks to an external site. in the NumPy documentation.
- To create the category and subcategory identification numbers, use a list comprehension to add the "cat" string or the "subcat" string to each number in the category or the subcategory array, respectively.
- For more information about creating a new Pandas DataFrame, see the pandas.DataFrameLinks to an external site. in the Pandas documentation.
- To convert the "goal" and "pledged" columns to the **float** data type, use the **astype()** method.
- To convert the "launch_date" and "end_date" UTC times to the **datetime** format, see the **Transform_Grocery_Orders_Solved.ipynb** activity solution.
- For more information about how to add the "category_id" and "subcategory_id" unique identification numbers to the campaign DataFrame, see the pandas.DataFrame.mergeLinks to an external site. in the Pandas documentation.


<h2>References for NoSQL UK Food Ratings</h2><br/>
Most of what's in this challenge, was covered in class.<br/>
The few things that either weren't or we had to reference to, are described
with it's source right below.<br/>

- To create a dictionary and use json.loads() method:
	- Reference: https://www.geeksforgeeks.org/json-loads-in-python/
- ERD references using these two videos:
	- Part 1: https://youtu.be/xsg9BDiwiJE?si=u5p3yiQeC447DUhU
	- Part 2: https://youtu.be/hktyW5Lp0Vo?si=u-t-066w0SxvuMvQ
    
----------------------------------------------------------------------------------------------

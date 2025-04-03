# Building-A-Data-Warehouse-using-Azure-Synapse-Analytics-from-Azure-Data-lake-system-Gen-2
This project aims to build a data warehouse using Azure Synapse Analytics leveraging Azure Data Lake Storage Gen 2 as the data source, orchestrated by Azure Data Factory.
<p align="center">
  <img src="./images/Datawarehouse.png
" width="990" height="590">
</p>

### OVERVIEW:
- This project aims to build a data warehouse using Azure Synapse Analytics leveraging Azure Data Lake Storage Gen 2 as the data source, orchestrated by Azure Data Factory.
- Azure Synapse Analytics provides an end-to-end analytics solution while Azure Data Factory serves as the ETL (Extract, Transform, Load) tool.
- [__NYC Taxi & Limousine Commission (TLC) Trip Record Dataset__](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) is used in this project


### REQUIRMENTS:

 #### Tools
  - **Azure Synapse Analytics:** For building and managing the data warehouse.
  - **Azure Data Lake Storage Gen 2:** As the data source for the data warehouse.
  - **Azure Data Factory:** For orchestrating and automating the ETL processes.
  - **Python:** Programming language for scripting ETL processes.
  - **SQL:** For Quering and analysing Dataset


 #### Azure Cloud Subscription Details:
- Azure subscription with access to Azure Synapse Analytics, Azure Data Lake Storage Gen 2, Azure Data Factory and Azure Monitor.

 ### STEPS:

 #### 1. Set up Azure Resources:
- Create an Azure Synapse Analytics workspace. Official Documentation
- Create an Azure Data Lake Storage Gen 2 account. Official Documentation
- Set up Azure Data Factory. Official Documentation
- Ensure appropriate permissions and access policies are set for the Azure resources.

#### 2. Define Data Warehouse Schema:
- Design the schema for the data warehouse tables in Azure Synapse Analytics.

- Trip Table

  ``` sql
  CREATE TABLE Trips (
      trip_id INT PRIMARY KEY,
      pickup_datetime DATETIME,
      dropoff_datetime DATETIME,
      pickup_longitude DECIMAL(10, 6),
      pickup_latitude DECIMAL(10, 6),
      dropoff_longitude DECIMAL(10, 6),
      dropoff_latitude DECIMAL(10, 6),
      passenger_count INT,
      trip_distance DECIMAL(10, 2),
      fare_amount DECIMAL(10, 2),
      tip_amount DECIMAL(10, 2),
      total_amount DECIMAL(10, 2),
      payment_type VARCHAR(50),
      trip_duration INT
  );

  ```
- Vehicles Table:

  ``` sql

  CREATE TABLE Vehicles (
      vehicle_id INT PRIMARY KEY,
      vendor_id VARCHAR(50),
      license_plate VARCHAR(50),
      vehicle_type VARCHAR(50),
      model VARCHAR(100),
      year INT
  );

  ```
- Drivers Table:

  ``` sql
  CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    driver_license VARCHAR(50),
    driver_address VARCHAR(255),
    driver_phone VARCHAR(20),
    driver_rating DECIMAL(3, 2)
  );
  ```


#### 3. Configure Linked Services:
- Configure **linked services** in Azure Data Factory to connect to Azure Synapse Analytics and Azure Data Lake Storage Gen 2. 
- Official Documentation Ensure that the appropriate credentials and connection details are provided.

#### 4. Develop ETL Pipeline:

- Azure Data Factory have Components called **"Activities"** and which is used for control pipeline in granular level
- Each  **Activities** contains each step of the pipeline as follows:
  1. Extract Data from Azure Data Lake Storage Gen 2:
       - To extract data from Azure Data Lake Storage Gen 2, we utilize the Azure Data Lake Storage Gen2 Connector within Azure Data Factory. 
       - This activity type allows us to configure a linked service to establish a connection to the Azure Data Lake Storage Gen 2 account. 
       - We specify the file path and related settings for the file we intend to extract. 
       - The output of this activity provides us with the data from the specified file located in Azure Data Lake Storage Gen 2.
  2. Transform Data:
        - For transforming the data, we can utilize either the Data Flow Activity or Custom Activity within Azure Data Factory. The Data Flow Activity facilitates visual data transformations through mapping data flows. 
        - Alternatively, if more customized transformations are required, we can opt for the Custom Activity, where we can execute custom transformation scripts written in languages like Python. 
        - Within this activity, we define the transformation logic, which may include operations such as dropping null values, changing data types, and joining datasets. 
        - The output of this activity furnishes us with the transformed data, which is then prepared for loading. 
  3. Load Data into Azure Synapse Analytics:
        - To load the transformed data into Azure Synapse Analytics, we employ the Synapse Analytics Connector within Azure Data Factory. 
        - We configure the linked service to establish a connection to the Azure Synapse Analytics workspace and database. 
        - Within this activity, we specify the target table where the transformed data will be loaded. 
        - The input to this activity comprises the transformed data generated from the preceding step. 
        - Upon completion, the output of this activity provides us with the loaded data in the specified table within Azure Synapse Analytics. 

#### 5. Monitor and Manage:

  - Azure Monitor plays a crucial role in monitoring the health, performance, and reliability of the data pipeline project involving Azure Data Factory and Azure Synapse Analytics.

    **Metrics and Alerts:**
    
     Azure Monitor collects metrics and enables alert configurations tailored to the specific needs of the data pipeline project.

      - **Metrics:** Monitor pipeline runs, activity runs, resource utilization, query performance, and data ingestion rates within Azure Data Factory and Azure Synapse Analytics. These metrics provide insights into system behavior and performance trends.

      - **Alerts:** Configure alerts for pipeline failures, execution time thresholds, query performance issues, and data loading failures. Ensure proactive notification and rapid response to critical events affecting data pipeline operations.

    **Logs:**

    Azure Monitor captures logs and diagnostic data, facilitating detailed analysis and troubleshooting for the data pipeline project.

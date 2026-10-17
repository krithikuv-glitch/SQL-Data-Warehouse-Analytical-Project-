/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data from external CSV files into the
    'bronze' schema.
    It performs the following operations:
    - Clears existing data from the bronze tables before loading new data.
    - Uses the BULK INSERT command to import data from CSV files into
      the bronze tables.

Parameters:
    None.
    This stored procedure does not accept any input parameters or return
    any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS 

BEGIN 

DECLARE @START_TIME DATETIME, @END_TIME DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
  
  BEGIN TRY
SET @batch_start_time = GETDATE();
PRINT '---------------------------';
PRINT'Loading Bronze Layer';
PRINT'----------------------------';

    PRINT'-------------------------------------------';
    PRINT'LOADING CRM TABLE';
    PRINT'--------------------------------------------';

    SET @START_TIME = GETDATE();
    TRUNCATE TABLE  bronze.crm_cust_info;
    PRINT'FILE crm_cust_info';
    BULK INSERT bronze.crm_cust_info
    FROM 'D:\Datawarehouse\source_crm\cust_info.csv'
    WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
    );
    SET @END_TIME = GETDATE();
    PRINT'LOAD DURATION: ' + CAST(DATEDIFF(SECOND,@START_TIME, @END_TIME) AS NVARCHAR) + 'SECOND'
    PRINT'-----------------------------'

    SET @START_TIME = GETDATE();
    TRUNCATE TABLE  bronze.crm_prd_info;
    PRINT'FILE CRM crm_prd_info';
    BULK INSERT bronze.crm_prd_info
    FROM 'D:\Datawarehouse\source_crm\prd_info.csv'
    WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
    );
    SET @END_TIME = GETDATE();
    PRINT'LOAD DURATION: ' + CAST(DATEDIFF(SECOND,@START_TIME, @END_TIME) AS NVARCHAR) + 'SECOND'
    PRINT'-----------------------------'

   SET @START_TIME = GETDATE();
   TRUNCATE TABLE  bronze.crm_sales_details;
     PRINT'FILE CRM crm_sales_details';
   BULK INSERT bronze.crm_sales_details
   FROM 'D:\Datawarehouse\source_crm\sales_details.csv'
   WITH (
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
   );
   SET @END_TIME = GETDATE();
   PRINT'LOAD DURATION: ' + CAST(DATEDIFF(SECOND,@START_TIME, @END_TIME) AS NVARCHAR) + 'SECOND'
   PRINT'-----------------------------'


   PRINT'--------------------------------------------';
   PRINT'LOADING ERP TABLE';
   PRINT'---------------------------------------------';

  SET @START_TIME = GETDATE();
  TRUNCATE TABLE  bronze.erp_cust_az12;
  PRINT'FILE ERP erp_cust_az12';
  BULK INSERT bronze.erp_cust_az12
  FROM 'D:\Datawarehouse\source_erp\cust_az12.csv'
  WITH (
     FIRSTROW = 2,
     FIELDTERMINATOR = ',',
     TABLOCK
     );
  SET @END_TIME = GETDATE();
  PRINT'LOAD DURATION: ' + CAST(DATEDIFF(SECOND,@START_TIME, @END_TIME) AS NVARCHAR) + 'SECOND'
  PRINT'-----------------------------'


  SET @START_TIME = GETDATE();
  TRUNCATE TABLE  bronze.erp_loc_a101;
  PRINT'FILE  ERP erp_loc_a101';
  BULK INSERT  bronze.erp_loc_a101
  FROM 'D:\Datawarehouse\source_erp\loc_a101.csv'
  WITH (
     FIRSTROW = 2,
     FIELDTERMINATOR = ',',
     TABLOCK
     );
  SET @END_TIME = GETDATE();
  PRINT'LOAD DURATION: ' + CAST(DATEDIFF(SECOND,@START_TIME, @END_TIME) AS NVARCHAR) + 'SECOND'
  PRINT'-----------------------------'

  SET @START_TIME = GETDATE();
  TRUNCATE TABLE  bronze.erp_px_cat_g1v2;
   PRINT'FILE ERP erp_px_cat_g1v2';
  BULK INSERT bronze.erp_px_cat_g1v2
  FROM 'D:\Datawarehouse\source_erp\px_cat_g1v2.csv'
  WITH (
     FIRSTROW = 2,
     FIELDTERMINATOR = ',',
     TABLOCK 
  );
  SET @END_TIME = GETDATE();
  PRINT'LOAD DURATION: ' + CAST(DATEDIFF(SECOND,@START_TIME, @END_TIME) AS NVARCHAR) + 'SECOND'
  PRINT'-----------------------------'

SET @batch_end_time = GETDATE();
PRINT'';
PRINT'Loding Bronze layer Complete';
PRINT'total load duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'second';
PRINT'-------------------------------------------------------------------------------------------------------------';
END TRY

BEGIN CATCH
  print'--------------------------------------------------'
  PRINT'LOADING Failed Bronze Layer';
  PRINT'ERROR MESSAGE' + ERROR_MESSAGE();
  PRINT'ERROR NUMBER' + CAST(ERROR_NUMBER() AS NVARCHAR); 
  print'----------------------------------------------------'
END CATCH
END

EXEC bronze.load_bronze





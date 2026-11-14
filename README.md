# SQL Data Warehouse and Analytics Project

## Project Overview
This project demonstrates the development of a SQL Server Data Warehouse using CRM and ERP datasets. It follows the **Bronze, Silver, and Gold (Medallion) Architecture** to extract, clean, transform, and integrate data into an analytics-ready format.

## Architecture

The project follows three layers:

- **Bronze:** Stores raw data from CRM and ERP source files.
- **Silver:** Cleans, standardizes, and transforms the data.
- **Gold:** Contains business-ready dimension and fact views for analytics.

## Technologies Used
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Git & GitHub

## Key Features
- Data ingestion from CSV files.
- Data cleaning and transformation.
- Handling NULL values and duplicates.
- CRM and ERP data integration.
- Stored procedures for ETL operations.
- Surrogate key generation.
- Fact and dimension views.
- Star Schema data modelling.

## Project Structure

```text
SQL-Data-Warehouse-Analytical-Project/
│
├── datasets/
│   ├── CRM/
│   └── ERP/
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── tests/
│   ├── quality_checks_Gold.sql
│   └── quality_checks_Silver.sql
│
└── README.md
```

## Data Flow

```text
CRM & ERP Data
      |
      v
  Bronze Layer
   (Raw Data)
      |
      v
  Silver Layer
(Cleaned Data)
      |
      v
   Gold Layer
(Fact & Dimension Views)
      |
      v
 Analytics & Reporting
```

## Key Learning Outcomes
- Understanding ETL processes.
- Working with SQL Server and T-SQL.
- Implementing Medallion Architecture.
- Performing data cleaning and transformation.
- Understanding Data Warehousing concepts.
- Building Star Schema models.

## Author

**Krithik UV**



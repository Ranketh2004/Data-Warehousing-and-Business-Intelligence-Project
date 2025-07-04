# 🧠 Data Warehousing & Business Intelligence Project

## 📌 Project Overview

This project showcases the end-to-end development of a **Data Warehousing and Business Intelligence** solution for grocery sales data. It includes the design of an **ETL pipeline**, a **snowflake-schema-based data warehouse**, and interactive **BI dashboards** built using:

- 🔧 **SQL Server Integration Services (SSIS)**
- 📊 **SQL Server Analysis Services (SSAS)**
- 📘 **Microsoft Excel**
- 📈 **Power BI**
- 🖥️ **Development Tools**: SQL Server Management Studio, Microsoft Visual Studio, Power BI Desktop

---

## 🗂️ Data Sources

The solution integrates data from **three different source types**:

1. 📂 **Relational Database**
2. 📄 **CSV files**
3. 📃 **Text files**

---

## ⚙️ ETL & Staging Area

- Built a robust ETL pipeline using **SSIS** to extract, clean, and load data into a **staging database**.
- Ensured **data independence** from source systems through centralized staging.
- Implemented **OnPreExecute SQL Tasks** to prevent record duplication in each staging table.

---

## 🧱 Data Warehouse Design

- Modeled the data warehouse using a **Snowflake Schema**.
- Implemented **stored procedures** for all **dimension tables** to enable **incremental loading**.
- Designed **Customer Dimension** as a **Slowly Changing Dimension (SCD)** with both **Type 1** and **Type 2** logic.
- Ensured referential integrity by loading **dimension tables first**, followed by the **fact table**.
- Developed an **Accumulating Snapshot Fact Table** with:
  - `txn_create_time`
  - `txn_completed_time`
  - `txn_processing_time_hrs`

---

## 🧊 OLAP Cube Development

- Developed a multidimensional **OLAP Cube** using **SSAS**, connected to the data warehouse.
- Designed **Hierarchies** for:
  - 📅 Date
  - 🛍️ Product
  - 👤 Customer
- Deployed the cube in SSAS for real-time analysis.

---

## 🔄 OLAP Operations in Excel

Demonstrated key OLAP operations within Excel using the SSAS cube:

- 🔍 **Drill Down**
- 📈 **Roll Up**
- 🧊 **Dice**
- ✂️ **Slice**
- 🔄 **Pivot**

---

## 📊 Power BI Dashboards

Developed multiple interactive dashboards with advanced features:

- ✅ Matrix visualizations for aggregated views
- 🎛️ Cascading **Slicers** for dynamic filtering
- 🔽 **Drill Down** navigation
- ↘️ **Drill Through** pages for detailed analysis

---

## 📚 Documentation

For a deeper understanding, refer to the documentation in the `/documents` folder:

- 📄 `assignment_1.pdf` – Initial project scope and planning  
- 📄 `assignment_2.pdf` – Detailed implementation and results

---

## 🚀 Summary

This project demonstrates a complete BI workflow from data ingestion to actionable insights. It highlights:

- Strong ETL practices  
- Thoughtful data modeling  
- OLAP capabilities  
- Insightful Power BI visualizations  

---

Feel free to explore, replicate, or extend this solution!  
🧠💡📊

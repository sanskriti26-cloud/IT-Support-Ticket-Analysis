# IT Support Cost Optimization Using Data Analysis

## Project Overview

This project analyzes IT support ticket data to identify operational inefficiencies and provide data-driven recommendations for improving support performance. The analysis was conducted using **Microsoft SQL Server** for data exploration and **Microsoft Power BI Desktop** for dashboard visualization.

The project addresses the following business objectives:

* Reduce IT support costs by 20%
* Improve customer satisfaction above 4.2
* Reduce unnecessary ticket escalations
* Optimize engineer allocation

---

## Tools Used


* MS Excel
* Microsoft SQL Server
* Microsoft Power BI Desktop

---

## Dataset

The dataset contains approximately **1 million IT support ticket records**, including information such as:

* Ticket ID
* Issue Category & Subcategory
* Priority
* Assigned Team
* Resolution Time
* Escalation Status
* Date Created
* Date Resolved

---

## Data Cleaning

The following preprocessing steps were performed before analysis:

* Checked for missing values
* Identified 348,518 missing **Date Resolved** records. Found 60,324 resolved tickets with missing resolution dates
* Verified no duplicate records
* Converted columns to appropriate data types
* Removed the unnecessary **Description** column
* Performed overall data consistency checks

---

## Key Performance Indicators (KPIs)

* Total Tickets
* Average Resolution Time
* Escalation Rate

---

## Key Insights

* Desktop Support handled nearly **2×** more tickets than other support teams.
* Identified the slowest-resolving issue subcategories.
* Identified the most frequently escalated issue subcategories.
* Critical-priority tickets required slightly longer resolution times than the ideal service expectations.
* Dashboard KPIs enable continuous monitoring of operational performance.

---

## Dashboard

The Power BI dashboard provides interactive insights into:

* Ticket distribution by support team
* Average resolution time
* Escalation trends
* Daily ticket trends
* Slowest issue subcategories
* Most escalated issue subcategories


---

## Project Structure

IT-Support-Cost-Optimization/
│
├── Data/
│   └── helpdesk.csv
│
├── SQL/
│   └── IT Support.sql
│
├── Dashboard/
│   └── IT Support Tickets Dashboard.pbix
│
├── Report/
│   └── IT Support Cost Optimization Report.pdf
│
└── README.me
---

## Limitations

The dataset did not include:

* Engineer Cost per Hour
* Client Type
* Customer Satisfaction Rating

These fields would enable deeper cost and customer experience analysis.

---


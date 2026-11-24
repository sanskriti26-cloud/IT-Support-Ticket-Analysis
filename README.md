# IT Support Cost Optimization Using Data Analysis

## Project Overview

This project analyzes IT support ticket data to identify operational inefficiencies and provide data-driven recommendations for improving support performance. The analysis was conducted using **Microsoft SQL Server** for data exploration and **Microsoft Power BI Desktop** for dashboard visualization.

## Problem Statement
Managing large volumes of IT support tickets requires efficient workload distribution, timely resolution, and effective escalation management. This project analyzes approximately 1 million IT support ticket records to identify operational inefficiencies and evaluate support performance.

The analysis focuses on:

- Identifying workload imbalances across support teams.
- Finding issue categories with longer resolution times.
- Analyzing escalation patterns and frequently escalated issues.
- Evaluating resolution performance of critical-priority tickets.
- Examining ticket volume trends to support resource planning.

The goal is to identify operational bottlenecks and recommend improvements in IT support efficiency, resource allocation, and issue resolution.

---

## Objectives
The primary objectives of this analysis are:
1. to identify opportunities to reduce IT support costs by 20% through improved ticket management and resource utilization.
2. to analyze factors affecting customer satisfaction and identify improvements to achieve a satisfaction score above 4.2.
3. to investigate escalation patterns and identify opportunities to minimize unnecessary ticket escalations.
4. to evaluate engineer workload, ticket distribution, and resolution efficiency to optimize resource allocation.

## Tools Used


* MS Excel
* Microsoft SQL Server
* Microsoft Power BI Desktop

---

## Dataset Understanding

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
* Several issue subcategories consistently recorded higher resolution times, suggesting the presence of process bottlenecks or the need for additional technical expertise and training. 
* Certain issue subcategories experienced noticeably higher escalation rates, indicating recurring technical complexity or opportunities to strengthen first-level support capabilities. 
* Critical-priority tickets required slightly longer resolution times than the ideal service expectations.
* Dashboard KPIs enable continuous monitoring of operational performance.

---

## Dashboard

The Power BI dashboard provides interactive insights into:

* Total number of ticket
* Average resolution time
* Escalation rate and escalation trends
* Daily ticket trends
* Slowest issue subcategories
* Most escalated issue subcategories



---

* Customer Satisfaction Rating

These fields would enable deeper cost and customer experience analysis.

---


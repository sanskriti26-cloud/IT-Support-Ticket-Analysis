-- EXPLORATORY DATA ANALYSIS (EDA)
-- Total Tickets
SELECT 
	COUNT(*) AS Total_Tickets
FROM [support_tickets];

-- Insights: 
-- The dataset has 1 million IT support tickets in it. That seems large enough to look at workload distribution and support performance overall.
--------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tickets by Category
SELECT
    Category,
    COUNT(*) AS Total_Tickets,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM support_tickets),2) AS Percentage
FROM [support_tickets]
GROUP BY Category
ORDER BY Total_Tickets DESC;

-- Insights: 
-- Tickets are distributed fairly evenly across categories. Around 20% each with "Software" a bit higher than the rest.
-- This suggests demand is spread across multiple issue types so resources should be balanced rather than focused on one.
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tickets by Priority
SELECT
    Priority,
    COUNT(*) AS Ticket_Count
FROM [support_tickets]
GROUP BY Priority
ORDER BY Ticket_Count DESC;

-- Insight: 
-- Ticket counts are evenly distributed across Low, Medium, High, and Critical priorities.
-- Support resources should therefore be planned to handle all priority levels efficiently while ensuring SLA compliance for higher-priority tickets.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Average Resolution Time by Category
SELECT
    Category,
    COUNT(*) AS Tickets,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Resolution_Time
FROM [support_tickets]
GROUP BY Category
ORDER BY Avg_Resolution_Time DESC;

-- Insight: 
-- Similar across all categories
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Average Resolution Time by Priority
SELECT
    Priority,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Resolution_Time
FROM [support_tickets]
GROUP BY Priority
ORDER BY Avg_Resolution_Time DESC;

-- Insight:
-- The resolution times are relatively similar for all priority types (close to 5.24–5.25 hours).
-- This indicates a balanced support process, although the critical tickets can be prioritized more to increase the customer satisfaction rate.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Workload of Teams
SELECT
    Assigned_Team,
    COUNT(*) AS Tickets_Handled,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Resolution_Time
FROM [support_tickets]
GROUP BY Assigned_Team
ORDER BY Avg_Resolution_Time;

-- Insights:
-- Desktop Support receives nearly twice as many tickets as any other support team. 
-- This indicates an uneven workload distribution and suggests the need for additional resources or process improvements to reduce the team's workload.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Escalation Rate by Category
SELECT
    Category,
    COUNT(*) AS Total_Tickets,
    SUM(CASE WHEN Escalated='True' THEN 1 ELSE 0 END) AS Escalated_Tickets,
    ROUND(
        100.0 *
        SUM(CASE WHEN Escalated='True' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS Escalation_Rate
FROM [support_tickets]
GROUP BY Category
ORDER BY Escalation_Rate DESC;

-- Insights: 
-- Escalation rates are approximately 50% across all categories, with only minor differences.
-- Since half of all tickets are escalated, improving first-level support documentation and technician training could significantly reduce unnecessary escalations.
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Resolution Time by Status
SELECT
    Status,
    COUNT(*) AS Tickets,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Resolution_Time
FROM [support_tickets]
GROUP BY Status;

-- Insight: 
-- Resolution time averages are almost identical regardless of the status of the tickets.
-- This shows that ticket status is not a significant determinant of resolution time.
----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Daily Ticket Trend
SELECT
    Date_Created,
    COUNT(*) AS Tickets
FROM [support_tickets]
GROUP BY Date_Created
ORDER BY Date_Created;

-- Insights:
-- Ticket throughput on a daily basis is fairly consistent, averaging approximately 33,000 tickets a day with minor variations.
-- The consistent work level implies that the staff requirement for each day may not spike.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Which teams handle which categories
SELECT
    Assigned_Team,
    Category,
    COUNT(*) AS Tickets
FROM [support_tickets]
GROUP BY Assigned_Team, Category
ORDER BY Assigned_Team, Tickets DESC;

-- Insights:
-- Every team is related to only one issue type and vica versa
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Overall Resolution Statistis
SELECT
    MIN(Resolution_Time_Hrs) AS Min_Time,
    MAX(Resolution_Time_Hrs) AS Max_Time,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Time
FROM [support_tickets];

-- Insights:
-- Resolution times range from 0.5 to 10 hours, with an average of 5.25 hours.
-- Reducing the average resolution time through automation, knowledge bases, and faster issue routing could help achieve the organization's cost reduction target.
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DIAGNOSTIC ANALYSIS
-- Slowest Subcategories
SELECT
    Category,
    Subcategory,
    COUNT(*) AS Tickets,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Resolution_Time
FROM [support_tickets]
GROUP BY Category, Subcategory
ORDER BY Avg_Resolution_Time DESC;

-- Insights:
-- The highest average resolution times are concentrated in specific subcategories rather than across an entire issue category.
-- These subcategories should be prioritized for process improvements, better troubleshooting documentation, or specialized engineer training to reduce overall resolution time.
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Escalation by Priority
SELECT
    Priority,
    COUNT(*) AS Total_Tickets,
    SUM(CASE WHEN Escalated='True' THEN 1 ELSE 0 END) AS Escalated_Tickets,
    ROUND(
        100.0 *
        SUM(CASE WHEN Escalated='True' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS Escalation_Rate
FROM [support_tickets]
GROUP BY Priority
ORDER BY Escalation_Rate DESC;

-- Insight:
-- Escalation rates remain close to 50% across all priority levels, with only minor variations.
-- This suggests that ticket priority alone is not a major driver of escalations, indicating that other factors such as issue complexity or support processes may have a greater influence.
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Most Escalated Subcategories
SELECT
    Category,
    Subcategory,
    COUNT(*) AS Tickets,
    SUM(CASE WHEN Escalated='True' THEN 1 ELSE 0 END) AS Escalated_Tickets,
    ROUND(
        100.0 *
        SUM(CASE WHEN Escalated='True' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS Escalation_Rate
FROM [support_tickets]
GROUP BY Category, Subcategory
ORDER BY Escalation_Rate DESC;

-- Insights:
-- Certain subcategories show slightly higher escalation rates than others, although the differences are relatively small.
-- These issue types should be reviewed to identify common causes and improve first-level troubleshooting, helping reduce unnecessary escalations
---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Resolution Time: Escalated vs Non-Escalated
SELECT
    Escalated,
    COUNT(*) AS Tickets,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Resolution_Time
FROM [support_tickets]
GROUP BY Escalated;

-- Insights:
-- Certain subcategories show slightly higher escalation rates than others, although the differences are relatively small.
-- These issue types should be reviewed to identify common causes and improve first-level troubleshooting, helping reduce unnecessary escalations.
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Team Workload by Priority
SELECT
    Assigned_Team,
    Priority,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY Assigned_Team),
        2
    ) AS Ticket_Percentage
FROM [support_tickets]
GROUP BY Assigned_Team, Priority
ORDER BY Assigned_Team, Priority;

-- Insights:
-- Ticket distribution across priorities is nearly uniform for all support teams.
-- This indicates a balanced allocation of work, reducing the likelihood that any single team is overloaded with high-priority tickets
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Category × Priority Matrix
SELECT
    Category,
    Priority,
    COUNT(*) AS Tickets,
    ROUND(AVG(Resolution_Time_Hrs),2) AS Avg_Resolution_Time
FROM [support_tickets]
GROUP BY Category, Priority
ORDER BY Category, Priority;

-- Insights:
-- Average resolution times remain consistent across different combinations of categories and priorities, with only slight differences.
-- This suggests that the current support process maintains a relatively uniform service level regardless of ticket type or urgency.
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Resolution Time Segmentation by Issue Category
SELECT
    Category,

    ROUND(
        100.0 * SUM(CASE WHEN Resolution_Time_Hrs < 4 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Fast_Tickets_Percentage,

    ROUND(
        100.0 * SUM(CASE WHEN Resolution_Time_Hrs >= 4 AND Resolution_Time_Hrs <= 8 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Normal_Tickets_Percentage,

    ROUND(
        100.0 * SUM(CASE WHEN Resolution_Time_Hrs > 8 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Slow_Tickets_Percentage

FROM [support_tickets]
GROUP BY Category
ORDER BY Slow_Tickets_Percentage DESC;

-- Insights:
-- All categories exhibit a similar distribution of fast, normal, and slow tickets, with most tickets falling within the normal resolution range.
-- Since no category stands out as a significant bottleneck, optimization efforts should focus on improving overall support processes rather than targeting a single issue category.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
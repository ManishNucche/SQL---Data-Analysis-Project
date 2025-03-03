# SQL---Data-Analysis-Project

## Overview
This project contains SQL queries and database schema for analyzing customer, product, and sales data. The queries help extract insights related to customer behavior, sales trends, and product performance.

## Features
- Customer insights (total spend, frequent buyers, location-based analysis)
- Product sales trends
- Sales performance and revenue tracking
- Sales representatives' performance analysis

## Database Schema

### Customers Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| customer_id | INT       | Primary key |
| name        | TEXT      | Customer name |
| location    | TEXT      | Customer location |
| gender      | TEXT      | Gender of customer |
| total_spend | DECIMAL   | Total amount spent by the customer |

### Products Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| product_id  | INT       | Primary key |
| name        | TEXT      | Product name |
| category    | TEXT      | Product category |
| price       | DECIMAL   | Product price |

### Sales Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| sale_id     | INT       | Primary key |
| customer_id | INT       | Foreign key referencing Customers(customer_id) |
| product_id  | INT       | Foreign key referencing Products(product_id) |
| salesrep_id | INT       | Foreign key referencing SalesReps(salesrep_id) |
| order_date  | DATE      | Date of purchase |
| quantity    | INT       | Quantity purchased |
| price       | DECIMAL   | Total price for the order |

### SalesReps Table
| Column Name       | Data Type | Description |
|------------------|-----------|-------------|
| salesrep_id      | INT       | Primary key |
| name            | TEXT      | Sales representative name |
| commission_rate | DECIMAL   | Sales representative commission rate |

## Installation & Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/sql-data-analysis.git
   ```
2. Load the SQL schema into your database (PostgreSQL, MySQL, or MSSQL).
3. Run the provided queries to analyze data.

## Queries Included
- Customer Insights
- Product Performance
- Sales Trend Analysis
- Sales Rep Performance

## License
This project is open-source under the MIT License.


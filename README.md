# Superstore Sales & Profitability Analysis

## Project Overview

This project began as an exploratory analysis of the Superstore dataset, starting with an overall view of sales, profit, and the company's financial performance.

The analysis then moved deeper after identifying loss-making sub-categories. Rather than assuming a direct cause for the losses, I investigated the affected sub-categories and then drilled down to the product level. This revealed that the Tables sub-category was not uniformly unprofitable, but contained significant differences in profitability between products.

The analysis also showed that higher observed discount levels were associated with lower profitability, although the available data does not establish discount as the sole cause of the losses. Some products had weak profit margins even at 0% discount, while a small number of products maintained a profit margin of at least 10% at higher observed discount levels.

For the product-level analysis, a minimum acceptable profit margin of 10% was assumed as a business threshold. The resulting discount levels are analytical observations based only on the available data and should not be interpreted as a definitive pricing policy.

## Business Problem

The business is profitable overall, but the dataset contains loss-making areas.

The objective of this analysis is to identify where the observed losses occur and investigate what factors are associated with them, with particular attention to product profitability and discount levels.

The analysis aims to determine whether the losses are concentrated in specific sub-categories or products, and whether higher observed discount levels are associated with lower profit margins.



## Analytical Approach

The analysis followed a progressive drill-down approach:

1. **General Data Exploration**
   - Reviewed the dataset structure, rows, columns, data types, missing values, and duplicate records.

2. **Category-Level Analysis**
   - Analyzed Sales, Profit, Profit Margin, and Discount across categories to identify areas with weaker profitability.

3. **Sub-Category Analysis**
   - Drilled down into sub-categories to examine the relationship between Discount and Profit Margin and identify loss-making sub-categories.

4. **Product-Level Analysis**
   - Focused on products within the Tables sub-category to investigate differences in Profit Margin across observed discount levels.

This approach allowed the analysis to move from a broad view of overall performance to a more detailed investigation of the products associated with the observed losses.

## Tools & Technologies

- **Excel** — Initial data exploration and data validation.
- **SQL** — Aggregation, profitability analysis, discount analysis, and product-level investigation.
- **Python** — Data analysis, aggregation, and visualization.
- **Power BI** — Interactive dashboard development and visualization of the key findings.


## Key Findings

### 1. Overall Performance

The dataset contains 10,194 records covering 5,111 customers and 804 products.

Overall, the business generated approximately $2.33M in sales and $292.3K in profit, resulting in an overall profit margin of 12.56%.

Although the business is profitable overall, the presence of loss-making sub-categories prompted a deeper investigation into where the losses occur and what factors are associated with them.

### 2. Loss-Making Sub-Categories

The analysis identified three loss-making sub-categories:

- Tables: -$17.8K profit with a profit margin of -8.53%
- Bookcases: -$3.6K profit with a profit margin of -3.15%
- Supplies: -$1.2K profit with a profit margin of -2.51%

Tables represented the most significant loss among the three, making it the primary area for further investigation.

However, the sub-category-level results alone were not sufficient to conclude that all Tables products were unprofitable. Therefore, the analysis was drilled down to the product level.

### 3. Discount and Profitability

Higher observed discount levels were generally associated with lower profit margins, particularly at higher discount levels.

However, the relationship was not strictly linear. Profit margin decreased from 29.56% at 0% discount to 5.15% at 15%, but increased to 11.77% at 20% discount before becoming negative at 30% and higher discount levels.

This indicates that discount level alone does not fully explain the observed losses, suggesting that other factors may contribute to differences in product profitability.

### 4. Product-Level Analysis: Tables

The product-level analysis showed that the Tables sub-category is not uniformly unprofitable. Profitability varies considerably between individual products.

Some products had relatively weak profit margins even at 0% discount, meaning that based on the available observations, they had very limited room for additional discounting while maintaining the assumed 10% minimum profit margin.

In contrast, a small number of products maintained a profit margin of at least 10% at a 20% observed discount level.

This suggests that discount tolerance varies considerably between products within the same sub-category. Therefore, applying a single discount policy to all Tables products may overlook important differences in product-level profitability.

### 5. Business Implication

Based on the available data, a uniform discount policy does not appear suitable for all products within the Tables sub-category.

Product-level profitability varies considerably: some products showed limited margin at 0% discount, while a small number maintained a profit margin of at least 10% at higher observed discount levels.

Therefore, discount decisions should consider product-level profitability rather than applying the same discount level across all products.

The observed discount thresholds should be treated as data-based analytical indicators, not as definitive pricing recommendations, since the analysis is based only on historical observations and assumes a 10% minimum acceptable profit margin.

## Recommendations

### 1. Product-Level Discount Decisions

The analysis suggests that a single discount level should not be applied uniformly across all products within the Tables sub-category.

Discount decisions should consider the profitability characteristics of each product, based on the observed data.

### 2. Further Investigation of Low-Margin Products

The analysis identified products with relatively weak profit margins even at 0% discount. However, the available dataset does not provide enough information to determine the underlying reasons for their low profitability.

Further analysis would require additional business data, such as product costs, pricing, order-level characteristics, customer information, shipping costs, and other factors that may help explain the differences in product profitability.

The purpose of this additional analysis would be to identify the underlying drivers of low-margin products rather than assuming that discounting is the primary cause.

## Limitations

- The available dataset does not contain enough information to identify the root causes of low-margin products.
- The analysis identifies associations between discount levels and profitability but does not establish causality.
- The 10% minimum profit margin is an assumed analytical threshold, not a confirmed company policy.
- Recommended discount levels are based on observed discount levels in the dataset and should not be interpreted as definitive pricing recommendations.
- Further investigation would require additional business data such as product costs, pricing, shipping costs, and other product-level or order-level factors.

## Project Structure

The repository contains the project documentation, analysis files, Power BI dashboard, and supporting visualizations.

The final repository structure will be organized as follows:

- `README.md` — Project overview, analytical approach, findings, recommendations, and limitations.
- `data/` — Dataset used for the analysis.
- `sql/` — SQL queries used for profitability, discount, and product-level analysis.
- `python/` — Python analysis and visualizations.
- `powerbi/` — Power BI dashboard file.
- `screenshots/` — Final dashboard screenshots.


## Dashboard

The Power BI dashboard presents the main findings across six analytical views:

- Executive Overview
- Sales & Profit Analysis
- Discount & Profitability
- Product Analysis
- Regional & Geographic Analysis
- Customer & Order Analysis

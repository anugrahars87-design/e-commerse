🧾 Columns:
- **sku_id:** Unique identifier for each product entry (Synthetic Primary Key)

- **name:** Product name as it appears on the app

- **category:** Product category like Fruits, Snacks, Beverages, etc.

- **mrp:** Maximum Retail Price (originally in paise, converted to ₹)

- **discountPercent:** Discount applied on MRP

- **discountedSellingPrice:** Final price after discount (also converted to ₹)

- **availableQuantity:** Units available in inventory

- **weightInGms:** Product weight in grams

- **outOfStock:** Boolean flag indicating stock availability

- **quantity:** Number of units per package (mixed with grams for loose produce)

## 🔧 Project Workflow

Here’s a step-by-step breakdown of what we do in this project:

### 1. Database & Table Creation
We start by creating a SQL table with appropriate data types:

```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```

### 2. Data Import
- Loaded CSV using pgAdmin's import feature.
### 3. 🔍 Data Exploration
- Counted the total number of records in the dataset

- Viewed a sample of the dataset to understand structure and content

- Checked for null values across all columns

- Identified distinct product categories available in the dataset

- Compared in-stock vs out-of-stock product counts

- Detected products present multiple times, representing different SKUs
### 4. 🧹 Data Cleaning
- Identified and removed rows where MRP or discounted selling price was zero

- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
### 5. 📊 Business Insights
- Found top 10 best-value products based on discount percentage

- Identified high-MRP products that are currently out of stock
  
- Estimated potential revenue for each product category

- Filtered expensive products (MRP > ₹500) with minimal discount

- Ranked top 5 categories offering highest average discounts

- Calculated price per gram to identify value-for-money products

- Grouped products based on weight into Low, Medium, and Bulk categories

- Measured total inventory weight per product category

# 📊 Tableau Visualization Project

 Overview
 
- Objective: Showcase end‑to‑end data analysis using SQL and Tableau.
- Workflow:
- Data Preparation – Cleaning and joining tables using SQL/PostgreSQL.
- Analysis – Calculating KPIs (averages, growth rates, retention, etc.).
- Visualization – Designing Tableau dashboards with reference lines, average bands, and interactive filters.
- Insights – Highlighting trends and actionable recommendations.




## Sample Data Table (Zepto highest Discounts)

| Product Name                                | Discount Selling Price | Discount Percent |
|---------------------------------------------|-------------------------|------------------|
| Dukes Waffy Chocolate Wafers                | 22                      | 51               |
| Dukes Waffy Orange Wafers                   | 22                      | 51               |
| Dukes Waffy Strawberry Wafers               | 22                      | 51               |
| Chef's Basket Durum Wheat Fusilli Pasta     | 80                      | 50               |
| Chef's Basket Durum Wheat Penne Pasta       | 80                      | 50               |
| Ceres Foods Laal Maas Instant Liquid Masala | 110                     | 50               |
| Chef's Basket Durum Wheat Elbow Pasta       | 80                      | 50               |
| Ceres Foods Nalli Nihari Instant Masala     | 110                     | 50               |



## Sample Data Table (Zepto Highest MRP Out-of-Stock)

| Product Name                                                   | Highest MRP (Out of Stock) |
|----------------------------------------------------------------|-----------------------------|
| Patanjali Cow's Ghee                                           | 565                         |
| MamyPoko Pants Standard Diapers, Extra Large (12 - 17 kg)      | 399                         |
| Aashirvaad Atta With Multigrains                               | 315                         |
| Everest Kashmiri Lal Chilli Powder                             | 310                         |
| Madhur Pure And Hygienic Sugar                                 | 295                         |
| Hershey's Cocoa + Almond Spread                                | 295                         |
| RRO Mozzarella Block Cheese                                    | 295                         |
| Godrej Real Good Chicken Boneless Cubes                        | 275                         |
| Zorabian Chicken Cubes                                         | 270                         |
| Kelloggs Corn Flakes With Real Strawberry Pure                 | 265                         |
| Origami Plates Plain                                           | 250                         |
| Zorabian Chicken Leg Boneless                                  | 250                         |

  
## Sample Data Table (Zepto Weight Categories)

| Product Name                  | Weight (g/ml) | Group by Weight |
|-------------------------------|---------------|-----------------|
| Bell Peppers Red & Yellow     | 116           | low             |
| Pomegranate                   | 116           | low             |
| Sweet Lime                    | 116           | low             |
| Baby Potato                   | 500           | low             |
| Coccinia                      | 250           | low             |
| Guava                         | 232           | low             |
| Apple Washington              | 232           | low             |
| Amla                          | 250           | low             |
| Beans Cluster                 | 250           | low             |
| Apple Royal Gala              | 232           | low             |
| Chilli Bhaji                  | 250           | low             |
| Lettuce Green                 | 100           | low             |



## Sample Data Table (Zepto Inventory by Category)

| Category              | Total Inventory Weight |
|-----------------------|-------------------------|
| Munchies              | 1,404,654              |
| Cooking Essentials    | 1,404,654              |
| Packaged Food         | 490,797                |
| Ice Cream & Desserts  | 490,797                |
| Chocolates & Candies  | 490,797                |
| Home & Cleaning       | 373,161                |
| Personal Care         | 348,187                |
| Paan Corner           | 348,187                |
| Beverages             | 143,735                |
| Dairy, Bread & Batter | 143,735                |
| Health & Hygiene      | 142,904                |
| Fruits & Vegetables   | 91,794                 |
| Biscuits              | 84,431                 |
| Meats, Fish & Eggs    | 48,016                 |



## Sample Data Table (Zepto Product Pricing & Discounts)

| Category            | Product Name                                      | Discount Selling | Weight (g/ml) | Unit Price per g/ml |
|---------------------|---------------------------------------------------|------------------|---------------|---------------------|
| Health & Hygiene    | Vicks Cough Drops Menthol                         | 20               | 1160          | 0.0172              |
| Munchies            | Aashirvaad Iodised Salt                           | 19               | 1000          | 0.0190              |
| Cooking Essentials  | Aashirvaad Iodised Salt                           | 19               | 1000          | 0.0190              |
| Fruits & Vegetables | Onion                                             | 57               | 3000          | 0.0190              |
| Fruits & Vegetables | Onion                                             | 21               | 1000          | 0.0210              |
| Munchies            | Tata Salt                                         | 24               | 1000          | 0.0240              |
| Cooking Essentials  | Tata Salt                                         | 24               | 1000          | 0.0240              |
| Home & Cleaning     | Shubh kart - Nirmal sugandhi mogra wet dhoop      | 28               | 1160          | 0.0241              |
| Fruits & Vegetables | Beetroot                                          | 13               | 500           | 0.0260              |
| Fruits & Vegetables | Potato                                            | 84               | 3000          | 0.0280              |
| Home & Cleaning     | Shubh kart - Tejas Twisted Cotton Wicks           | 28               | 1000          | 0.0280              |
| Fruits & Vegetables | Carrot                                            | 15               | 500           | 0.0300              |


## Dashboard Screenshot

![Sales Dashboard](<img width="1654" height="798" alt="Screenshot 2026-02-24 134609" src="https://github.com/user-attachments/assets/264fde97-c5c8-4866-9061-be4b813c221b" />
)


## Tableau Dashboard Link

[View Dashboard on Tableau Public](https://public.tableau.com/app/profile/anugraha.r.s/viz/zeptoecommerse/Dashboard1?publish=yes)

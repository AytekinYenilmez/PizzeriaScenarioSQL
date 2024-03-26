Scenario:
- Pizza place with no dine in option
- Main request of the customer: Keep track of Orders, Stock Control and Staff.

The customer gave us these requirements:
- Order Data: Item Name, Item Price, Quantity, Customer Name, Delivery Address.
- The customer also gave us the menu.
- He wants to be able to know when it is time to order new stock.
- He wants to know which staff members are working when
- How much each pizza costs (based on the staff salary information, ingredients, delivery)

Order Data Requirements are our starting point. Also, from the menu, we saw that each item as different sizes,
there are also vailable beverages (which led us to think about product category).

We first created a mock-up table about what the table could look like. Hands on starting lead to certain realizations:
- We need a row_id column, ecause each order can contain multiple items.
In other words, we can't use order_id as primary key (to identify each individual entry).
- Secondly, assume we created a orders table which as all possible columns: row_id, order_id, created_at, item_name,
item_cat, item_size, item_price, quantity, cust_firstname, cust_lastname, delivery, delivery_address1, delivery_address2,
delivery_city and delivery_zipcode. This introduces too many repetitions. Redundancy! We are going to fix it by Normalization.
The aim of Normalization is to reduce redundancy in our table and improve efficiency.
- Then, we created additional tale for customers and delivery addresses because they tend to repeat if the order contains
more than one item (which almost always happens).
- Items are the main component of the business. They can change in the future, and we do not want to update countless rows
if an item changes suddenly. Thus, we created a table for items too. All these additional tables have id column as primary key,
so that they can become foreign key at the orders table and the relation is established. Change only the item table,
everyting else is handled accordingly.

In addition to these, we created 3 seperate tables for stock control. Ingredients table which includes price of each
ingredient with their id as primary key. Recipes table with row_id as primary key and ingredient id's as foreign key.
Inventory table to keep track of quantities for determining the existing stock level.

For staff data, we created staffs table with their hourly rates, positions and identifiers. Shifts table to keep track of dates
(when and who starts/ends the shift). Lastly, rota table to keep track of the routes, which employee went on it
(to later calculate delivery cost) and date.

Above, my general thought process is explained. Each table creation through sql queries can be seen from the file:
SQLQueryCreateRelationalDatabase.sql. I know that this is simpler than the industrial real-world scenario,
but it is a good starting point to build upon.

Aytekin Yenilmez.


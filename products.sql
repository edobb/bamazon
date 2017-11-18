DROP DATABASE IF EXISTS bamazon;
CREATE database bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INT AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  department_name VARCHAR(100) NOT NULL,
  price DECIMAL(6,2) NOT NULL,
  stock_quantity INT(5) NOT NULL,
  PRIMARY KEY (item_id)
);
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "widget", "stuff", 5.00, 8500 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "knicknack", "stuff", 2.50, 12000 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "television", "electronics", 575.00, 500 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "hammer", "tools", 15.25, 4500 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "shoes", "clothes", 75.00, 500 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "jeans", "clothes", 55.50, 2000 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "stroller", "kids", 175.00, 1500 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "football", "sporting goods", 20.00, 2200 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "desktop", "electronics", 1575.00, 200 );
INSERT INTO products ( product_name, department_name, price, stock_quantity )
   VALUES
   ( "drill", "tools", 95.25, 1500 );

SELECT * FROM products;
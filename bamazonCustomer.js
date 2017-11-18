var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

 // Your username
  user: "root",

 // Your password
  password: "root",
  database: "bamazon"
});

connection.connect(function(err) {
  if (err) throw err;
 
});

function displayAll() {
    connection.query("SELECT * FROM products", function(err, res) {
      if (err) throw err;
        for(i = 0; i < res.length; i++){
          console.log('Product ID: ' + res[i].item_id + ' | Product Name: ' + res[i].product_name + ' | Price: $' + res[i].price + ' | Quantity Available: ' + res[i].stock_quantity);
        }

      productPurchase(res);
    });
  };


function productPurchase(data) {
    inquirer
      .prompt([{
        name: "itemId",
        type: "input",
        message: "Enter Product ID"
      },
      {
        name: "quantity",
        type: "input",
        message: "How Many Would You Like?"
      }])
      .then(function(answer) {
        var stockQuantity = data[answer.itemId - 1].stock_quantity;
        var itemPrice = data[answer.itemId - 1].price;

        if (stockQuantity >= answer.quantity){ 
          var totalPrice = answer.quantity * itemPrice;
          var query = connection.query(
            "UPDATE products SET ? WHERE ?",
            [
              {
                stock_quantity: stockQuantity - answer.quantity
              },
              {
                item_id: answer.itemId
              }
            ],

        );
        console.log('The Total Price of Your Order is: ' + totalPrice);
        displayAll();
      } else {
          displayAll();
          console.log("We do not have enough in stock, Please try again.");

      }
      });
  }

displayAll();

  
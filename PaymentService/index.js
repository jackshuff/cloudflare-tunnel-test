const express = require("express");
const app = express();
app.use(express.json());

app.get("/", (req, res) => {
    console.log("Payment Service homepage accessed.");
    res.send("Welcome to Payment Service");
});

// Process Payment
app.post("/pay", (req, res) => {
    const { orderId, amount } = req.body;
    console.log(`Processing payment of $${amount} for order ${orderId}`);
    res.send({ message: "Payment successful" });
});

app.listen(4001, () => console.log("Payment Service running on port 4001"));

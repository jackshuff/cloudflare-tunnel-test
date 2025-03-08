const express = require("express");
const axios = require("axios");
const app = express();
app.use(express.json());

app.get("/", (req, res) => {
    console.log("Order Service homepage accessed.");
    res.send("Welcome to Order Service");
});


// Handle order creation
app.post("/order", async (req, res) => {
    const { orderId, amount } = req.body;

    // Call Payment Service (inside Cloudflare Tunnel)
    await axios.post("http://payment.internal/pay", { orderId, amount });

    // Call Inventory Service (inside Cloudflare Tunnel)
    await axios.post("http://inventory.internal/reserve", { orderId });

    res.send({ message: "Order processed successfully" });
});

app.listen(4000, () => console.log("Order Service running on port 4000"));

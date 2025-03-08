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
    await axios.post("https://api.combinepensions.com/payments", { orderId, amount });

    // Call Inventory Service (inside Cloudflare Tunnel)
    await axios.post("https://api.combinepensions.com/inventory", { orderId });

    res.send({ message: "Order processed successfully" });
});

const PORT = process.env.PORT || 4002;
app.listen(PORT, () => console.log(`Order Service running on port ${PORT}`));

const express = require("express");
const app = express();
app.use(express.json());

// Welcome Route for Inventory Service
app.get("/", (req, res) => {
    console.log("Inventory Service homepage accessed.");
    res.send("Welcome to Inventory Service");
});

// Reserve Inventory Route
app.post("/reserve", (req, res) => {
    const { orderId } = req.body;
    console.log(`Reserving stock for order ${orderId}`);
    res.send({ message: "Inventory reserved" });
});

// Start Server
const PORT = process.env.PORT || 4002;
app.listen(PORT, () => console.log(`Inventory Service running on port ${PORT}`));

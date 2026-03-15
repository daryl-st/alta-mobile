import app from "./app.js";

const PORT = process.env.PORT || 3000;

// 0.0.0.0 to listen to all IP's
app.listen(3000, '0.0.0.0', () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

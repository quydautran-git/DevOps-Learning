const express = require("express");
const app = express();
const PORT = process.env.PORT || 8000;

app.use(express.json());

// Health check - dùng để kiểm tra container/ALB target group sống hay không
app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok", service: "cms-backend" });
});

// Endpoint mẫu cho CMS - danh sách bài viết
app.get("/api/posts", (req, res) => {
  res.json([
    { id: 1, title: "Xin chào CMS", content: "Bài viết đầu tiên của hệ thống." },
    { id: 2, title: "Demo Terraform + EKS/EC2", content: "Bài viết thứ hai để test API." },
  ]);
});

app.get("/", (req, res) => {
  res.send("CMS Backend API is running.");
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`CMS backend listening on port ${PORT}`);
});

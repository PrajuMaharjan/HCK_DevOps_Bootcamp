require('dotenv').config();
const express = require('express');
const cors = require('cors');
const os = require('os');
const connectDB = require('./config/db');
const todoRoutes = require('./routes/todoRoutes');

const app = express();

app.use(cors());
app.use(express.json());

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Load balancing test route (MUST be before connectDB/app.listen)
app.get('/api/whoami', (req, res) => {
  res.json({
    instance: process.env.INSTANCE_ID || 'unknown',
    hostname: os.hostname(),
    pid: process.pid
  });
});

app.use('/api/todos', todoRoutes);

const PORT = process.env.PORT || 5000;

connectDB().then(() => {
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
});
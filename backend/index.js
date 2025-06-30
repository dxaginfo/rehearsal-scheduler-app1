// Express server for rehearsal scheduler API
const express = require('express');
const app = express();
app.use(express.json());
// Dummy API endpoint
app.get('/api/health', (req, res) => res.json({ status: 'ok' }));
app.listen(3001, () => console.log('API running on http://localhost:3001'));
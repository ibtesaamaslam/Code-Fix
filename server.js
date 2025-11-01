const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3002;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('.'));

// Serve the main HTML file
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Health check
app.get('/health', (req, res) => {
    res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// Start server
app.listen(PORT, () => {
    console.log('\n🚀 Code Fix Server Started Successfully!');
    console.log('=====================================');
    console.log(`📍 Server running on: http://localhost:${PORT}`);
    console.log(`🌍 Environment: ${process.env.NODE_ENV || 'development'}`);
    console.log(`📱 Open your browser and navigate to: http://localhost:${PORT}`);
    console.log('=====================================');
    
    if (process.env.NODE_ENV === 'development') {
        console.log('🔧 Development mode - Server will restart on file changes');
        console.log('⚡ Ready for code analysis and fixing!');
    }
    
    console.log('\n✨ Code Fix is ready to analyze your code!\n');
});

module.exports = app;
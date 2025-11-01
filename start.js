#!/usr/bin/env node

const { spawn } = require('child_process');
const path = require('path');

console.log('🚀 Code Fix Quick Start');
console.log('=======================\n');

// Check if node_modules exists
const fs = require('fs');
if (!fs.existsSync('node_modules')) {
    console.log('📦 Installing dependencies...');
    const install = spawn('npm', ['install'], { stdio: 'inherit' });
    
    install.on('close', (code) => {
        if (code === 0) {
            console.log('✅ Dependencies installed successfully!\n');
            startServer();
        } else {
            console.log('❌ Failed to install dependencies');
            process.exit(1);
        }
    });
} else {
    console.log('✅ Dependencies already installed\n');
    startServer();
}

function startServer() {
    console.log('🚀 Starting Code Fix server...\n');
    const server = spawn('npm', ['run', 'dev'], { stdio: 'inherit' });
    
    server.on('close', (code) => {
        console.log(`\n📊 Server exited with code ${code}`);
    });
    
    // Handle Ctrl+C gracefully
    process.on('SIGINT', () => {
        console.log('\n\n👋 Shutting down Code Fix server...');
        server.kill('SIGINT');
        process.exit(0);
    });
}
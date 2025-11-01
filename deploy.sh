#!/bin/bash

# Code Fix Deployment Script
# This script handles deployment to various platforms

set -e

echo "🚀 Code Fix Deployment Script"
echo "=============================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Node.js is installed
check_node() {
    if ! command -v node &> /dev/null; then
        print_error "Node.js is not installed. Please install Node.js 16+ first."
        exit 1
    fi
    
    NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -lt 16 ]; then
        print_error "Node.js version 16+ is required. Current version: $(node --version)"
        exit 1
    fi
    
    print_success "Node.js $(node --version) detected"
}

# Check if Docker is installed
check_docker() {
    if ! command -v docker &> /dev/null; then
        print_warning "Docker is not installed. Docker deployment will not be available."
        return 1
    fi
    
    print_success "Docker $(docker --version | cut -d' ' -f3 | cut -d',' -f1) detected"
    return 0
}

# Install dependencies
install_deps() {
    print_status "Installing dependencies..."
    npm ci --only=production
    print_success "Dependencies installed successfully"
}

# Run tests (if available)
run_tests() {
    if [ -f "package.json" ] && grep -q '"test"' package.json; then
        print_status "Running tests..."
        npm test
        print_success "All tests passed"
    else
        print_warning "No tests found, skipping test phase"
    fi
}

# Build for production
build_production() {
    print_status "Preparing production build..."
    
    # Create production environment file if it doesn't exist
    if [ ! -f ".env" ]; then
        cp .env.example .env
        print_warning "Created .env file from .env.example. Please review and update as needed."
    fi
    
    # Set production environment
    sed -i 's/NODE_ENV=development/NODE_ENV=production/' .env
    
    print_success "Production build prepared"
}

# Local deployment
deploy_local() {
    print_status "Starting local deployment..."
    
    check_node
    install_deps
    build_production
    
    print_success "Local deployment ready!"
    print_status "Run 'npm start' to start the server"
    print_status "Application will be available at: http://localhost:3002"
}

# Docker deployment
deploy_docker() {
    print_status "Starting Docker deployment..."
    
    if ! check_docker; then
        print_error "Docker is required for Docker deployment"
        exit 1
    fi
    
    print_status "Building Docker image..."
    docker build -t code-fix:latest .
    
    print_status "Starting Docker container..."
    docker-compose up -d
    
    print_success "Docker deployment completed!"
    print_status "Application is running at: http://localhost:3002"
    print_status "Use 'docker-compose logs -f' to view logs"
    print_status "Use 'docker-compose down' to stop the application"
}

# Vercel deployment
deploy_vercel() {
    print_status "Preparing Vercel deployment..."
    
    if ! command -v vercel &> /dev/null; then
        print_error "Vercel CLI is not installed. Install with: npm i -g vercel"
        exit 1
    fi
    
    # Create vercel.json if it doesn't exist
    if [ ! -f "vercel.json" ]; then
        cat > vercel.json << EOF
{
  "version": 2,
  "builds": [
    {
      "src": "server.js",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/server.js"
    }
  ]
}
EOF
        print_status "Created vercel.json configuration"
    fi
    
    print_status "Deploying to Vercel..."
    vercel --prod
    
    print_success "Vercel deployment completed!"
}

# Netlify deployment
deploy_netlify() {
    print_status "Preparing Netlify deployment..."
    
    if ! command -v netlify &> /dev/null; then
        print_error "Netlify CLI is not installed. Install with: npm i -g netlify-cli"
        exit 1
    fi
    
    # Create _redirects file for SPA routing
    echo "/*    /index.html   200" > _redirects
    
    print_status "Deploying to Netlify..."
    netlify deploy --prod --dir=.
    
    print_success "Netlify deployment completed!"
}

# Health check
health_check() {
    print_status "Running health check..."
    
    if [ -f "healthcheck.js" ]; then
        node healthcheck.js
        print_success "Health check passed"
    else
        print_warning "Health check script not found"
    fi
}

# Main deployment function
main() {
    case "${1:-local}" in
        "local")
            deploy_local
            ;;
        "docker")
            deploy_docker
            ;;
        "vercel")
            deploy_vercel
            ;;
        "netlify")
            deploy_netlify
            ;;
        "health")
            health_check
            ;;
        *)
            echo "Usage: $0 {local|docker|vercel|netlify|health}"
            echo ""
            echo "Deployment options:"
            echo "  local    - Deploy locally with Node.js"
            echo "  docker   - Deploy using Docker containers"
            echo "  vercel   - Deploy to Vercel platform"
            echo "  netlify  - Deploy to Netlify platform"
            echo "  health   - Run health check"
            echo ""
            echo "Examples:"
            echo "  $0 local    # Local development deployment"
            echo "  $0 docker   # Production Docker deployment"
            echo "  $0 vercel   # Deploy to Vercel"
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
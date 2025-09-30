#!/bin/bash

# Function Player Documentation Setup Script
# This script helps set up the local development environment

echo "🚀 Setting up Function Player Documentation..."

# Check if Ruby is installed
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby is not installed. Please install Ruby 3.0+ first."
    echo "   Visit: https://www.ruby-lang.org/en/documentation/installation/"
    exit 1
fi

echo "✅ Ruby found: $(ruby --version)"

# Check if Bundler is installed
if ! command -v bundle &> /dev/null; then
    echo "📦 Installing Bundler..."
    gem install bundler
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install Bundler. You may need to run with sudo:"
        echo "   sudo gem install bundler"
        exit 1
    fi
fi

echo "✅ Bundler found: $(bundle --version)"

# Install Jekyll and dependencies
echo "📚 Installing Jekyll and dependencies..."
bundle install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies. Please check the error messages above."
    exit 1
fi

echo ""
echo "🎉 Setup complete! You can now:"
echo ""
echo "   1. Start the development server:"
echo "      bundle exec jekyll serve"
echo ""
echo "   2. Open your browser to:"
echo "      http://localhost:4000"
echo ""
echo "   3. Edit files and see changes automatically reload!"
echo ""
echo "📖 For more information, see the README.md file."

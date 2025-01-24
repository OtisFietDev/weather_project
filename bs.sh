#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "Running Flutter setup..."

# Flutter commands
if ! flutter clean; then
    echo "Error: flutter clean failed"
    exit 1
fi

if ! flutter pub get; then
    echo "Error: first flutter pub get failed"
    exit 1
fi

if ! flutter pub get; then
    echo "Error: second flutter pub get failed"
    exit 1
fi

if ! flutter pub run build_runner build --delete-conflicting-outputs; then
    echo "Error: build_runner failed"
    exit 1
fi

echo "Setup completed successfully!"
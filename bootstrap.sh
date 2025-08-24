#!/usr/bin/env bash
set -e

echo "Bootstrapping macOS setup..."

# Install Xcode Command Line Tools if needed
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode CLI tools..."
  xcode-select --install
  echo "Accepting license..."
  sudo xcodebuild -license accept
fi

# Install Homebrew if missing
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Tap bundle and install packages
echo "Tapping brew bundle..."
brew tap homebrew/bundle

echo "Installing from Brewfile..."
brew bundle --file="./Brewfile"

echo "Cleaning up..."
brew cleanup
brew autoremove

echo "Done! All set."

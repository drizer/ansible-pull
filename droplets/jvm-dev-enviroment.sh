#!/usr/bin/env bash
#
# TODO: add a dev user?

# Exit immediately if a command exits with a non-zero status
set -xe

echo "=== Updating system packages ==="
sudo apt-get update && sudo apt-get install -y curl unzip zip

echo "Install neovim + kickstarter config"
sudo snap install nvim --classic
mkdir -p .config/nvim
git clone https://github.com/drizer/kickstart.nvim .config/nvim

echo "=== Installing SDKMAN! ==="
# Download and run the SDKMAN! installer script
until curl -s https://get.sdkman.io >/dev/null; do
    sleep 5
done

curl -s "https://get.sdkman.io" | bash

ln -s /.sdkman /root/.sdkman
cat /.bashrc >> /root/.bashrc

echo "=== Loading SDKMAN! into the current shell session ==="
# Locate SDKMAN directory and source the init script
export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

echo "=== Verifying SDKMAN! installation ==="
sdk version

echo "=== Installing Java version: $JAVA_VERSION ==="
# Install the specified Java version and set it as default
# Define the Java version to install
JAVA_VERSION="25.0.3-tem"
sdk install java "$JAVA_VERSION"
sdk install leiningen 
sdk install scala
sdk install sbt 

echo "=== Verifying Java installation ==="
java -version

echo "alias vi='nvim'" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "echo \"init sdkman: 'sdk env init'\"" >> ~/.bashrc

echo "=== Bootstrap Complete! ==="
echo "Please restart your terminal or run: source ~/.bashrc (or ~/.zshrc)"

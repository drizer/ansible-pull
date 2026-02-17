# Ansible Ubuntu Terrminal VPS

![Ansible Logo](https://www.learnlinux.tv/wp-content/uploads/2020/12/ansible-e1607524003363.png)

This repository was used setup up terminal server vps, initial bootstrap github-cli and ansible:

```bash

apt update; apt upgrade

apt install ansible gh

ansible-pull -o -U https://github.com/drizer/ansible-pull

```

## users

creates users:
- dmall
- ansible

## tools

- tmux
- htop
- sqlite3
- yt-dlp

## services

updates: 
- apt repo

installs: 
- tailscale

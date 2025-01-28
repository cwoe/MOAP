# Modular Offensive Arch Playbook (MOAP)

MOAP is an Ansible playbook aiming to provide a system with a basic modern collection of offensive tools in order to compete in CTFs/HTB. Users can select the roles they want to have installed on their system depending on their targets.

Tools are freshly pulled off of Github in order to provide the most recent release.

## Installation

### Requirements

- Working Arch Linux Installation
- The playbook is designed to be run from a user in the sudoers group
- Make sure /etc/resolv.conf is symlinked/populated or go install will fail
- If you run the desktop role disable your login/display manager

### Steps

Clone the repo:
```bash
git clone https://github.com/cwoe/MOAP
cd ./MOAP
```

If you plan to runthis against a remote host edit the inventory file.

Run the playbook:
```bash
ansible-playbook main.yml
```

Open your xinitrc file and change the file path to the background image to a background image of your choice. This can be done by editing the following line:
```bash
feh --bg-max ./bg.jpeg  &
```

Reboot your system.

## Usage

All installed programs should be in the path.

### Important Keybinds

- Power + Shift + e -> Exit i3
- Power + Shift + q -> Close current window

---

- Power + Shift + [0-9] -> Switch to desktop
- Power + [0-9] -> Move current window to desktop

---

- Power + q -> Open Firefox
- Power + Enter -> Open Terminal (kitty)
- Power + d -> Open Application Laucher (dmenu)

### Important Folders

Binarys/Scripts to be uploaded/executed on the target:
- /usr/share/windows
- /usr/share/Linux
- /usr/share/multi

SecLists directory:
- /opt/SecLists

## Known Issues
- The task responsible for cloning SecLists will always return changed

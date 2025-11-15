kde-auto-rotate
===============

Automatic screen rotation for KDE Plasma on Wayland.

The script monitors the system accelerometer using monitor-sensor and rotates the display via kscreen-doctor.

Requirements
------------
Install the following packages:

Debian / Ubuntu:
    sudo apt install iio-sensor-proxy libkscreen-bin

Fedora:
    sudo dnf install iio-sensor-proxy kscreen

openSUSE:
    sudo zypper install iio-sensor-proxy kscreen6

Installation
------------
Run:
    ./install.sh

This installs the script to /usr/local/bin and enables a systemd user service.

Uninstallation
--------------
Run:
    ./uninstall.sh

Manual rotation commands
------------------------
    kscreen-doctor output.eDP-1.rotation.none
    kscreen-doctor output.eDP-1.rotation.right
    kscreen-doctor output.eDP-1.rotation.left
    kscreen-doctor output.eDP-1.rotation.inverted

If your internal display uses a different output name, update OUTPUT in auto_rotate.sh.

License
-------
MIT

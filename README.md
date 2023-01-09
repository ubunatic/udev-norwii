# NORWII Presenter Key Remapping in Linux

The Norwii presenters are small input devices that register as keyboard-like devices.

## Goal of this Project

This repository focuses on using the N95s Pro to control [reveal.js](https://revealjs.com).

Here is the current key map as implemented by the provided hwdb file:

![Keymap for N95s Pro](keymap.jpg)

## Details

All findings are collected in [Keymapping.md](Keymapping.md).

If you want to adjust this project for your own devices
see the [Makefile](Makefile) that automates the installation.

## Installation
Currently the key mapping works using a hwdb file which needs to to be copied to
`/etc/udev` (and thus requires root access).

The [Makefile](Makefile) implements installation and activation of such a file for the Norwii N95s Pro (vendor-device ID: `3243:0122`).

```
make install reload -n    # review what the installation will do.
sudo make install reload  # install and load the hwdb file.
```

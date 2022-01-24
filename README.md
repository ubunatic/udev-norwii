# NORWII Presenter Config in Linux

The Norwii presenters are small input devices that register as keyboard-like devices.

Here is the default key mapping.

```
.---.
| = |
|[#]| <-- Tab
|[^]| <-- Arrow Key Up
|[v]| <-- Arrow Key Down
|[*]| <-- Laser pointer
| _ |
|| ||
|| ||
|| ||
`---´
```

This works well in Google Slides to advance animations and slides.
But it does not work in Youtube to skip forward.

## Goal of this Project

**Main Goal**. Provide a nice tool to quickly switch presenter key mappings for various apps.

**Stretch Goal**. Autoswitch key mappings for the active app.

## Roadmap

### V0.1 (PoC + personal app)

- [x] Find out how key mapping works
- [x] Remap keys
- [ ] Tool to switch mappings

### V0.2 (Stretch goal)
- [ ] Detect app and autoswitch mappings
- [ ] Integrate in common Linux config tools

## Details

All findings are collected in [Keymapping.md](Keymapping.md).

If you want to adjust this project for your own devices
see the [Makefile](Makefile) that automates the installation for my Norwii N27.

## Installation
Currently the key mapping works using a hwdb file which needs to to be copied to
`/etc/udev` (and thus requires root access).

The [Makefile](Makefile) implements installation and activation of such a file
for the Norwii N27 (vendor-device ID: `3243:0111`).

```
make install reload -n    # review what the installation will do.
sudo make install reload  # install and load the hwdb file.
```

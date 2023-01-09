# How to find and configure key mappings?

## References

* Arch Wiki with ton of info: https://wiki.archlinux.org/title/Map_scancodes_to_keycodes
* Default key mapping: `/usr/lib/udev/hwdb.d/60-keyboard.hwdb`
* Tool to manage low level mappings: https://github.com/philipl/evdevremapkeys (not used in this project)

## Find some device data

Run `lsusb` to find your vendor and device ID.

`ID 3243:0111 NORWII Norwii Wireless Presenter`

Find out more about the device capabilities using
[evemu](https://man.archlinux.org/man/evemu-describe.1) tools.

```
sudo evemu-describe /dev/input/by-id/usb-NORWII_Norwii_Wireless_Presenter-event-kbd
```
```
...
#     Event code 15 (KEY_TAB)
#     Event code 103 (KEY_UP)
#     Event code 108 (KEY_DOWN)
...
```
For instance, this shows the event codes sent by the device.

Check if the device works and get the key codes we need to map.
```
sudo evtest /dev/input/by-id/usb-NORWII_Norwii_Wireless_Presenter-event-kbd
```
```
Event: time ..., type 4 (EV_MSC), code 4 (MSC_SCAN), value 70052
Event: time ..., type 1 (EV_KEY), code 103 (KEY_UP), value 1
...
Event: time ..., type 4 (EV_MSC), code 4 (MSC_SCAN), value 70051
Event: time ..., type 1 (EV_KEY), code 108 (KEY_DOWN), value 1
```

## Build the `hwdb` entry

The pattern to match devices in udev hwdb is:
```
evdev:input:b<bus_id>v<vendor_id>p<product_id>e<version_id>-<modalias>
```
The USB bus ID is `0003` (see `/usr/include/linux/input.h`).

The vendor ID for Norwii is `3243`.

The product ID is `0111`.

The Norwii presenter can be matched with `evdev:input:b0003v3243p0111*`.

In a `hwdb` entry you can remap keys with `KEYBOARD_KEY_<scancode>=<keycode>`.
The entry for remapping the norwii is the following.
```
evdev:input:b0003v3243p0111*
 KEYBOARD_KEY_70052=left    # map [^] to LEFT
 KEYBOARD_KEY_70051=right   # map [v] to RIGHT
```

Put this to a new file `/etc/udev/hwdb.d/90-norwii.hwdb`.

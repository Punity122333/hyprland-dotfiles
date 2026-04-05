#!/usr/bin/env python3
# Your Python code below

import uinput
import time

with open("/tmp/hypr_click_debug.log", "a") as f:
    f.write("Script started at " + time.ctime() + "\n")

# Create the device with mouse capabilities
events = [uinput.BTN_LEFT, uinput.REL_X, uinput.REL_Y]
device = uinput.Device(events)
time.sleep(0.5)

# CLICK: Press and release
device.emit(uinput.BTN_LEFT, 1)  # Press
time.sleep(0.05)                # Short hold
device.emit(uinput.BTN_LEFT, 0)  # Release



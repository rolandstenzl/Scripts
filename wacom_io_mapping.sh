#!/bin/bash

# This script automatically assigns a Wacom tablet (One by Wacom) 
# to a specific screen output. It maps both the stylus and eraser inputs
# to the designated screen using xinput.

# 1. Display startup message
echo "Starting Wacom IO Mapping Process..."

# 2. Define the target screen output
SCREEN="HDMI-0"

# 3. Retrieve the device ID of the Wacom Pen Eraser
#    - Use `xinput list` to list all input devices
#    - Filter for 'Wacom One by Wacom M Pen eraser' (case insensitive)
#    - Extract the ID number using grep
ERASER_ID=$(xinput list | grep -i 'Wacom One by Wacom M Pen eraser' | grep -o 'id=[0-9]*' | grep -o '[0-9]*')

# 4. Retrieve the device ID of the Wacom Pen Stylus
#    - Use `xinput list` to list all input devices
#    - Filter for 'Wacom One by Wacom M Pen stylus' (case insensitive)
#    - Extract the ID number using grep
STYLUS_ID=$(xinput list | grep -i 'Wacom One by Wacom M Pen stylus' | grep -o 'id=[0-9]*' | grep -o '[0-9]*')

# 5. Map both Wacom input devices to the specified screen output
xinput map-to-output $ERASER_ID $SCREEN
xinput map-to-output $STYLUS_ID $SCREEN

# 6. Confirm the mapping for each device
echo "Mapped Eraser (ID: $ERASER_ID) to screen: $SCREEN"
echo "Mapped Stylus (ID: $STYLUS_ID) to screen: $SCREEN"


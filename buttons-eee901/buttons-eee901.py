#!/usr/bin/env python

##### HELPERS ################################################################

# !SET YOUR CONFIGURATION HERE!

# power button
def key_power(arg):
  hbus = dbus.SystemBus()
  hobj = hbus.get_object('org.freedesktop.Hal', '/org/freedesktop/Hal/devices/computer')
  hifc = dbus.Interface(hobj, 'org.freedesktop.Hal.Device.SystemPowerManagement')
  hifc.Shutdown()

# sleep button
def key_sleep(arg):
  hbus = dbus.SystemBus()
  hobj = hbus.get_object('org.freedesktop.Hal', '/org/freedesktop/Hal/devices/computer')
  hifc = dbus.Interface(hobj, 'org.freedesktop.Hal.Device.SystemPowerManagement')
  hifc.Suspend(0)

# lid
def key_lid(arg):
  ec = os.popen('cat /proc/acpi/button/lid/LID/state','r').read().split(' ')[-1].split('\n')[0]
  if ec == 'closed':
    hbus = dbus.SystemBus()
    hobj = hbus.get_object('org.freedesktop.Hal', '/org/freedesktop/Hal/devices/computer')
    hifc = dbus.Interface(hobj, 'org.freedesktop.Hal.Device.SystemPowerManagement')
    hifc.Suspend(0)

# wlan button
def key_wlan(arg):
  # toggle bluetooth switch
  hbus = dbus.SystemBus()
  hobj = hbus.get_object('org.freedesktop.Hal', '/org/freedesktop/Hal/devices/computer_rfkill_eeepc_wlan_wlan')
  hifc = dbus.Interface(hobj, 'org.freedesktop.Hal.Device.KillSwitch')
  cs   = hifc.GetPower()
  if cs == 1:
    ec = os.system(arg + ' start')
  elif cs == 0:
    ec = os.system(arg + ' stop')    

# switch video mode
def key_swvid(arg):
  global state_videomode
  if state_videomode == 0:
    # was in the internal mode, have to switch to external:
    ec = os.system('xrandr --output LVDS --off --output VGA --auto &')
    state_videomode = 1
  elif state_videomode == 1:
    # was in the external mode, have to switch to internal & external:
    ec = os.system('xrandr --output VGA --auto --output LVDS --auto &')
    state_videomode = 2
  elif state_videomode == 2:
    # was in the internal & external mode, have to switch to internal:
    ec = os.system('xrandr --output LVDS --auto --output VGA --off &')
    state_videomode = 0

# first silver button
def key_coffee(arg):
  ec = os.system(arg)

# A/P button
def key_prog1(arg):
  ec = os.system(arg)

# third silver button
def key_prog2(arg):
  ec = os.system(arg)

# fourth silver button
def key_prog3(arg):
  ec = os.system(arg)

# second silver button
def key_prog4(arg):
  # toggle bluetooth switch
  hbus = dbus.SystemBus()
  hobj = hbus.get_object('org.freedesktop.Hal', '/org/freedesktop/Hal/devices/computer_rfkill_eeepc_bluetooth_bluetooth')
  hifc = dbus.Interface(hobj, 'org.freedesktop.Hal.Device.KillSwitch')
  cs   = hifc.GetPower()
  # now toggle bluetooth
  hifc.SetPower((cs + 1) % 2)

# mute button
def key_mute(arg):
  ec = os.system(arg)

# volume down
def key_voldn(arg):
  ec = os.system(arg)

# volume up
def key_volup(arg):
  ec = os.system(arg)

##### END HELPERS ############################################################

##### CALLBACKS ##############################################################

#def parse(s):
#  # Parse a string into a dictionary.
#  # Fetch a *copy* of the default dictionary.
#  ret = DEFAULTDICT.copy()
#  # Split lines.
#  lines = s.split('\n')
#  # Loop through lines.
#  for line in lines:
#    # Strip whitespace.
#    line = line.strip()
#    # Skip comment and blank lines.
#    if line and line[0] != '#':
#      # Split the line in the pair key, value
#      values = line.split()
#      # Fill dictionary.
#      ret[values[0]] = int(values[1])
#  # Return dictionary.
#  return ret

def callback(kind, key):
  """Handles Condition events from org.freedesktop.Hal.Device"""
  if kind == 'ButtonPressed':
    key = key.lower()
    try:
      KEYMAP[key][0](KEYMAP[key][1])
      print 'Executed event for key: %s' % key
    except KeyError:
      print 'No event defined for key: %s' % key

##### END CALLBACKS ##########################################################

import os, dbus, gobject
from dbus.mainloop.glib import DBusGMainLoop
dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

## Open file: filename: ~/.buttons-eee901-rc
#if os.path.exists('~/.buttons-eee901-rc') == True:
#  f = file('~/.buttons-eee901-rc')
#  try:
#    # Read whole file as one string.
#    data = f.read()
#  finally:
#    # Close file
#    f.close()
#  # Parse data string.
#  config = parse(data)

# definition of keys
KEYMAP = {
  'power'  : (key_power,  ('')),
  'sleep'  : (key_sleep,  ('')),
  'lid'    : (key_lid,    ('')),
  'wlan'   : (key_wlan,   ('wifi')),
  'switch-videomode' : (key_swvid, ('')),
  'coffee' : (key_coffee, ('xset dpms force off &')),
  'prog1'  : (key_prog1,  ('xterm -e top &')),
  'prog2'  : (key_prog2,  ('firefox &')),
  'prog3'  : (key_prog3,  ('sylpheed &')),
  'prog4'  : (key_prog4,  ('')),
  'mute'   : (key_mute,   ('amixer -q -c 0 set LineOut toggle &')),
  'volume-down' : (key_volup, ('amixer -q -c 0 set LineOut 5%- &')),
  'volume-up'   : (key_voldn, ('amixer -q -c 0 set LineOut 5%+ &')),
}

# connect to the message bus
hal_1 = 'org.freedesktop.Hal'
hal_2 = '/org/freedesktop/Hal'

# video mode:
# 0: internal
# 1: external
# 2: internal & external
state_videomode = 0

# Connect to DBUS System Bus
hbus = dbus.SystemBus()

# Add an event handler: Condition
hbus.add_signal_receiver(callback,
                         dbus_interface=hal_1+".Device",
                         signal_name="Condition")

# Add an event handler: PropertyModified
#hbus.add_signal_receiver(button_pressed_cb,
#                         dbus_interface=hal_1+".Device",
#                         signal_name="PropertyModified")

# Add an event handler: DeviceAdded
#hbus.add_signal_receiver(button_pressed_cb,
#                         dbus_interface=hal_1+".Device",
#                         signal_name="DeviceAdded")

# Add an event handler: DeviceRemoved
#hbus.add_signal_receiver(button_pressed_cb,
#                         dbus_interface=hal_1+".Device",
#                         signal_name="DeviceRemoved")

# other interesting stuff

#hbus = dbus.SystemBus()
#hmgr = hbus.get_object(hal_1, hal_2+'/Manager')
#hifc1 = dbus.Interface(hmgr, hal_1+'.Manager')
#hudi = hifc1.FindDeviceByCapability('laptop_panel')
#hobj = hbus.get_object('org.freedesktop.Hal', hudi[0])
#hifc2 = dbus.Interface(hobj, 'org.freedesktop.Hal.Device.LaptopPanel')
#hifc3 = dbus.Interface(hobj, 'org.freedesktop.Hal.Device')
#print 100 * hifc2.GetBrightness() / (hifc3.GetProperty('laptop_panel.num_levels') - 1)

loop = gobject.MainLoop()
loop.run()

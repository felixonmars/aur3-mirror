#!/usr/bin/env python2
# -*- coding: utf-8 -*-

# pylendar -- simple GTK calendar, with basic calendar features, that
#             uses another application, like GNU Emacs org-mode, for
#             agenda and project management.
# Copyright (C) 2009, 2010 Adrian C. <anrxc_sysphere_org>

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# Documentation
#   - http://www.pygtk.org/docs/pygtk/

import gtk
import gobject
from sys import argv
from os  import path, getenv
from subprocess import call
from calendar   import month_name
# From 2.4 CALENDAR_WEEK_START_MONDAY is ignored and locales are used,
# which is broken, but if you still want it in your own language call:
import locale
locale.setlocale(locale.LC_ALL, "en_US.utf-8")


# Pylendar settings
#
# Name, Type, X, Y, Padding, Border, Timeout, Buttons
appprop = ["Pylendar", gtk.WINDOW_POPUP, 1088, 14, 0, 5, 15000, True]

# Icon theme, icon size, icon category, icon name
appicon = ["Tango", "16x16", "apps", "office-calendar.png"]

# Agenda and project management application, and options
appagen = ["emacsclient", " --eval '(org-agenda-list)'"]

# Buttons and tooltips
apptips = {
    1 : ["Agenda", "Open org-mode agenda in Emacs"],
    2 : ["Close",  "Close the calendar"],
    3 : ["Praznici za", "Holidays in"]
}

# Local non-working holidays
nonworking = {
    1 : [["Nova Godina", 1],
         ["Sveta tri kralja", 6]],
    2 : [],
    3 : [],
    4 : [["Veliki petak", 2],
         ["Uskrs", 4],
         ["Uskrsni ponedjeljak", 5]],
    5 : [["Praznik rada", 1]],
    6 : [["Tijelovo", 3],
         ["Dan antifašističke borbe", 22],
         ["Dan državnosti", 25]],
    7 : [],
    8 : [["Dan domovinske zahvalnosti", 5],
         ["Dan domovinske zahvalnosti", 6],
         ["Velika Gospa", 15]],
    9 : [],
   10 : [["Dan neovisnosti", 8]],
   11 : [["Svi sveti", 1]],
   12 : [["Božić", 25],
         ["Sveti Stjepan", 26]]
}


class PyLendar:
    DEF_POS_X, DEF_POS_Y, DEF_PAD = appprop[2], appprop[3], appprop[4]

    def calendar_select_icon(self):
        icopath = '/'.join(appicon)
        xdgdata = getenv("XDG_DATA_DIRS").split(":")
        xdgdata.append(getenv("XDG_DATA_HOME"))
        xdgdata.append(getenv("HOME") + "/")

        for i in xdgdata:
            icopref = i.endswith("/") and ".icons/" or "/icons/"
            if path.isfile(i + icopref + icopath):
                pylendar_icon = gtk.gdk.pixbuf_new_from_file(i + icopref + icopath)
                break
            else: # Default to stock
                pylendar_icon = self.window.render_icon(gtk.STOCK_EDIT, gtk.ICON_SIZE_DIALOG)
        return pylendar_icon

    def calendar_show_agenda(self):
        call(appagen[0] + appagen[1], shell=True)

    def calendar_month_changed(self, widget):
        year, month, day = self.window.get_date()

        self.window.clear_marks()

        tooltip = "%s %s:" % (apptips[3][0], month_name[month+1])
        for key, holiday in list(nonworking.items()):
            if key == month+1 and holiday:
                for i in holiday:
                    self.window.mark_day(i[1])
                    # Even out all dates for aligned table-like display
                    if len(str(i[1])) < 2:
                        tableday = "0%.0f" % i[1]
                    else:
                        tableday = i[1]
                    tooltip = "%s\n | %s.%s | %s" % (tooltip, str(tableday), str(key), i[0])
            self.window.set_tooltip_text(tooltip)


    def __init__(self, monthspec=None):
        self.window = None
        # Create a new window
        window = gtk.Window(appprop[1])
        # - floating when TOPLEVEL
        window.set_resizable(False)
        # - window properties
        window.set_title(appprop[0])
        window.set_border_width(appprop[5])

        # Connect the destroy event to a handler
        window.connect("destroy", lambda x: gtk.main_quit())
        # Auto exit after timeout
        timer = gobject.timeout_add(appprop[6], lambda: gtk.main_quit())

        # The top part of the window: calendar box
        vbox  = gtk.VBox(False, self.DEF_PAD)
        hbox  = gtk.HBox(False, self.DEF_PAD)
        hbbox = gtk.HButtonBox()
        window.add(vbox)
        vbox.pack_start(hbox,  True,  True,  self.DEF_PAD)
        hbox.pack_start(hbbox, False, False, self.DEF_PAD)
        hbbox.set_layout(gtk.BUTTONBOX_SPREAD)
        hbbox.set_spacing(0)

        # Calendar widget
        frame = gtk.Frame()
        hbbox.pack_start(frame, False, True, self.DEF_PAD)
        calendar = gtk.Calendar()
        self.window = calendar

        # Calendar options
        #   GTK_CALENDAR_SHOW_HEADING      = 1 << 0,
        #   GTK_CALENDAR_SHOW_DAY_NAMES    = 1 << 1,
        #   GTK_CALENDAR_NO_MONTH_CHANGE   = 1 << 2,
        #   GTK_CALENDAR_SHOW_WEEK_NUMBERS = 1 << 3,
        #   GTK_CALENDAR_WEEK_START_MONDAY = 1 << 4,
        #   GTK_CALENDAR_SHOW_DETAILS      = 1 << 5
        # As default, show heading, show days and allow date changes
        #self.window.set_display_options(3 + (1<<5))

        # Show a specific month if requested on startup
        if monthspec in range(1, 13):
            # Clear day selection if not viewing current month
            if monthspec != self.window.get_date()[1]+1:
                self.window.select_day(0)
            self.window.select_month(monthspec-1, self.window.get_date()[0])

        # Fake a month change on startup, to get marks right away
        self.calendar_month_changed(calendar)

        # Put the finished widget in the frame
        frame.add(calendar)

        # Signals                         Handlers
        calendar.connect("month_changed", self.calendar_month_changed)

        # Setup buttons
        if appprop[7]:
          # The bottom part of the window: button box
          bbox = gtk.HButtonBox ()
          vbox.pack_start(bbox, False, False, 0)
          bbox.set_layout(gtk.BUTTONBOX_SPREAD)

          # Button widget: Agenda
          #  - modify default label for STOCK_EDIT
          gtk.stock_add([(gtk.STOCK_EDIT, apptips[1][0], 0, 0, "")])
          button = gtk.Button(stock=gtk.STOCK_EDIT)
          button.connect("clicked", lambda w: self.calendar_show_agenda())
          bbox.add(button)
          button.set_tooltip_text(apptips[1][1])

          # Button widget: Close
          #  - modify default label for STOCK_CANCEL
          gtk.stock_add([(gtk.STOCK_CANCEL, apptips[2][0], 0, 0, "")])
          button = gtk.Button(stock=gtk.STOCK_CANCEL)
          button.connect("clicked", lambda w: gtk.main_quit())
          bbox.add(button)
          #  - this is the default button
          button.set_flags(gtk.CAN_DEFAULT)
          button.grab_default()
          button.set_tooltip_text(apptips[2][1])

        # Set application icon
        gtk.window_set_default_icon(self.calendar_select_icon())

        # Position the window
        window.move(self.DEF_POS_X, self.DEF_POS_Y)

        # Draw the calendar
        window.show_all()


def main():
    gtk.main()
    return 0


if __name__ == "__main__":
    if len(argv) < 2:
        PyLendar()
    else:
        try:
            PyLendar(int(argv[1]))
        except ValueError:
            raise SystemExit("Usage: %s [month (1-12)]" % path.split(argv[0])[1])
    main()

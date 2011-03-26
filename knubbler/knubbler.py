#!/usr/bin/python
# -*- coding: utf-8 -*-

# Part of knubbler
# License: CC-BY-NC-SA-3.0
# http://creativecommons.org/licenses/by-nc-sa/3.0/de/
# http://creativecommons.org/licenses/by-nc-sa/3.0/de/deed.en
# Johann Klähn <kljohann@gmail.com>

import sys
import gtk
import re

from optparse import OptionParser
    
def float_to_percent(flt):
    return (("%.2f" % flt).replace('.', '').lstrip("0") or "0")+"%"


class Scroller(object):
    # defaults that will be overridden by instances
    exitstatus = 0

    def __init__(self, fraction=0.5, title=None, factor=20):
        # Interface {{{
        self._window = gtk.Window()
        self._window.set_title('Knubbler')

        # Cancel when closed by window-manager
        self._window.connect('delete-event', lambda *a, **k: self.exit(1))
        
        # Put ProgressBar in EventBox to capture Scroll & Mouse-Click
        eventbox = gtk.EventBox()
        self._progress = gtk.ProgressBar()
        self._progress.set_property('show-text', True)
        
        # Add widgets to window
        eventbox.add(self._progress)

        if title:
            # Display text above progressbar
            label = gtk.Label(title)
            label.set_alignment(0.5, 0.5)
            label.set_justify(gtk.JUSTIFY_CENTER)
            label.set_use_markup(True)
            label.set_line_wrap(True)

            vbox = gtk.VBox()
            vbox.pack_start(label, expand=False, padding=5)
            vbox.pack_end(eventbox)

            self._window.add(vbox)
        else:
            self._window.add(eventbox)
        # }}}

        # Atach event-handlers:
        self._progress.connect("realize",
                lambda w: w.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.CIRCLE)))
        eventbox.connect("button-press-event", self.on_button_press_event)
        eventbox.connect("motion-notify-event", self.on_motion_notify_event)
        eventbox.connect('scroll-event', self.on_scroll_event)
        self._window.connect('key-press-event', self.on_key_press_event)

        # Set value of progressbar, initialize everything else
        # (most of this is done by properties/set_x, see below)
        self._factor = float(factor)
        self.fraction = fraction
        self.orientation = gtk.PROGRESS_BOTTOM_TO_TOP
    
    def window(self, width=150, height=250):
        self._window.unfullscreen()
        self._window.set_size_request(width, height)
        self._window.set_position(gtk.WIN_POS_CENTER)

    def fullscreen(self):
        self._window.fullscreen()
    
    # Properties {{{
    def set_orientation(self, orientation):
        assert orientation in [gtk.PROGRESS_LEFT_TO_RIGHT,
                              gtk.PROGRESS_BOTTOM_TO_TOP], "Only LTR/BTT"
        self._progress.set_orientation(orientation)
        self._orientation = orientation
    
    def get_orientation(self):
        return self._orientation

    orientation = property(lambda s: s.get_orientation(),
                           lambda s, v: s.set_orientation(v))

    def set_fraction(self, value):
        value = max(0, min(1, value))
        # round to steps of 1/factor
        self._fraction = round(value * self._factor)/self._factor
        self._progress.set_fraction(self._fraction)

    def get_fraction(self):
        return self._fraction

    fraction = property(lambda s: s.get_fraction(),
                        lambda s, v: s.set_fraction(v))

    def tick_up(self):
        self.fraction += 1.0/self._factor

    def tick_down(self):
        self.fraction -= 1.0/self._factor
    # }}}

    def exit(self, code=0):
        self.exitstatus = code
        self._window.hide()
        gtk.main_quit()

    def call(self):
        self._window.show_all()
        gtk.main()
        return self.exitstatus or 0

    # Event-Handlers {{{
    def on_scroll_event(self, widget, event):
        # Modify progessbar according to scrolling
        if self.orientation == gtk.PROGRESS_LEFT_TO_RIGHT:
            # Horizontal scrolling
            if event.direction == gtk.gdk.SCROLL_RIGHT:
                self.tick_up()
            elif event.direction == gtk.gdk.SCROLL_LEFT:
                self.tick_down()
        elif self.orientation == gtk.PROGRESS_BOTTOM_TO_TOP:
            # Vertical scrolling
            if event.direction == gtk.gdk.SCROLL_UP:
                self.tick_up()
            elif event.direction == gtk.gdk.SCROLL_DOWN:
                self.tick_down()

    def on_button_press_event(self, widget, event):
        if event.button == 3:
            # Set distinct value by right-clicking
            if self.orientation == gtk.PROGRESS_LEFT_TO_RIGHT:
                total = self._progress.allocation.width
                self.fraction = max(0, min(1,
                                event.get_coords()[0] / float(total)))
            elif self.orientation == gtk.PROGRESS_BOTTOM_TO_TOP:
                total = self._progress.allocation.height
                self.fraction = 1 - max(0, min(1,
                                event.get_coords()[1] / float(total)))
        elif event.button == 1:
            # accept current value on mouseclick
            self.exit(0)
            
    def on_motion_notify_event(self, widget, event):
        if event.get_state() == gtk.gdk.BUTTON3_MASK:
            # Right click-and-hold to modify value
            if self.orientation == gtk.PROGRESS_LEFT_TO_RIGHT:
                total = self._progress.allocation.width
                self.fraction = max(0, min(1,
                                event.x / float(total)))
            elif self.orientation == gtk.PROGRESS_BOTTOM_TO_TOP:
                total = self._progress.allocation.height
                self.fraction = 1 - max(0, min(1,
                                event.y / float(total)))

    def on_key_press_event(self, widget, event):
        #Return or Space is pressed -> Accept current value
        if event.keyval in [gtk.keysyms.Return, gtk.keysyms.space]:
            self.exit(0)
        #Escape is pressed -> Cancel
        elif event.keyval == gtk.keysyms.Escape:
            self.exit(1)
        #Number key is pressed -> set value of progressbar
        elif event.keyval >= 48 and event.keyval <= 57:
            self.fraction = float(event.keyval - 48)/10.0
    # }}}

def main(args):
    parser = OptionParser()
    parser.add_option('-i', '--stdin', dest='stdin',
        action="store_true", help='Use first percentage found on stdin')
    parser.add_option('-p', '--percent', dest='percent',
        action="store_true", help='Output XX% instead of 0.XX')
    parser.add_option('-w', '--window', dest='window', metavar="DIMENSIONS",
        help='Display window with given dimensions. '
            +'DIMENSIONS has the format 150x250 (WIDTHxHEIGHT)')
    parser.add_option('-t', '--title', dest='title', metavar="TITLE",
        help='Display a short help at the top of the window.'
            +'You can use Pango-Markup.')
    parser.add_option('-f', '--factor', dest='factor', metavar="FACTOR",
        help='Sets the accuracy of the progressbar to steps of 100/FACTOR percent.')
    parser.add_option('-l', '--left-to-right', dest='ltr',
        action="store_true", help='Display progressbar from left to right')
    parser.usage = "%prog [options] [-i|FRACTION]"

    parser.set_defaults(title=None, ltr=False, factor=20)

    (options, args) = parser.parse_args(args)

    # Find first "xx%"
    re_percent = re.compile("(?:\D|^)(0|100|[1-9][0-9]?)\%(?:\D|$)").search
    #re_fractal = re.compile("\D0.[0-9]+\D").search

    # determine fraction to start with
    frac = 0.5
    if options.stdin:
        # Look for percentage on stdin.
        text = sys.stdin.read()
        match = re_percent(text)
        if match:
            frac = max(0, min(1, float(match.group(1))/100.0))
    else:
        # Was a fraction passed as first argument? (0,xx or 0.xx)
        try:
            frac = max(0, min(1, float(args[1].replace(',', '.'))))
        except (IndexError, ValueError):
            pass
    
    scr = Scroller(fraction=frac, title=options.title, factor=options.factor)
    if options.ltr:
        scr.orientation = gtk.PROGRESS_LEFT_TO_RIGHT
    if options.window:
        try:
            # read dimensions (WIDTHxHEIGHT)
            dimensions = [int(x) for x in options.window.lower().split("x")]
            scr.window(*dimensions)
        except (IndexError, ValueError):
            # Use standard values
            scr.window()
    else:
        scr.fullscreen()

    scr.call()

    # only print value on success/accept
    if scr.exitstatus == 0:
        if options.percent:
            print float_to_percent(scr.fraction)
        else:
            print "%.2f" % scr.fraction
    return scr.exitstatus

if __name__ == '__main__':
    sys.exit(main(sys.argv))


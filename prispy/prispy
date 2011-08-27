#!/usr/bin/env python
# PrisPy, a PyGTK Webkit implementation of Mozilla Prism released under the GPLv3
# Special thanks to Andy Breiner for the initial webkit browser code
# Special thanks also goes to Vladimir Kolev for the PyBrowser code

import pygtk
pygtk.require('2.0')
import gtk
import webkit
import gobject
import sys
import os
import imp

class Browser(object):
    def delete_event(self, widget, event, data=None):
        return False

    def destroy(self, widget, data=None):
        gtk.main_quit()

    def __init__(self, shortcut):
        imp.load_source('config', os.path.join(os.path.expanduser('~'), '.prispy', shortcut + '.conf'))
        import config
        self.url = config.url
        gobject.threads_init()
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_resizable(True)
        self.window.set_default_size(800,600)
        self.window.set_title('PrisPy: '+ config.name)
        self.window.connect("delete_event", self.delete_event)
        self.window.connect("destroy", self.destroy)
        self.web_view = webkit.WebView()
        try: config.userAgent
        except NameError:
            print ""
        else:
            settings = webkit.WebSettings()
            settings.set_property('user-agent', config.userAgent)
            self.web_view.set_settings(settings)
        if not config.url.find('http://') > -1:
            config.url = 'http://'+config.url
        self.web_view.open(config.url)
        scroll_window = gtk.ScrolledWindow(None, None)
        scroll_window.add(self.web_view)
        vbox = gtk.VBox(False, 0)
        vbox.add(scroll_window)
        if config.wantStatusbar == 1:
            backButton = gtk.Button()
            backButton.set_relief(gtk.RELIEF_NONE)
            backImage = gtk.Image()
            backImage.set_from_stock(gtk.STOCK_GO_BACK, gtk.ICON_SIZE_MENU)
            backImage.set_pixel_size(16)
            backButton.add(backImage)
            backButton.connect('clicked', self.back)
            forwardButton = gtk.Button()
            forwardButton.set_relief(gtk.RELIEF_NONE)
            forwardImage = gtk.Image()
            forwardImage.set_from_stock(gtk.STOCK_GO_FORWARD, gtk.ICON_SIZE_MENU)
            forwardImage.set_pixel_size(16)
            forwardButton.add(forwardImage)
            forwardButton.connect('clicked', self.forward)
            self.reloadButton = gtk.Button()
            self.reloadButton.set_relief(gtk.RELIEF_NONE)
            reloadImage = gtk.Image()
            reloadImage.set_from_stock(gtk.STOCK_REFRESH, gtk.ICON_SIZE_MENU)
            reloadImage.set_pixel_size(16)
            self.reloadButton.add(reloadImage)
            self.reloadButton.connect('clicked', self.refresh)
            self.stopButton = gtk.Button()
            self.stopButton.set_relief(gtk.RELIEF_NONE)
            stopImage = gtk.Image()
            stopImage.set_from_stock(gtk.STOCK_STOP, gtk.ICON_SIZE_MENU)
            stopImage.set_pixel_size(16)
            self.stopButton.add(stopImage)
            self.stopButton.connect('clicked', self.stop)
            self.stopButton.hide()
            homeButton = gtk.Button()
            homeButton.set_relief(gtk.RELIEF_NONE)
            homeImage = gtk.Image()
            homeImage.set_from_stock(gtk.STOCK_HOME, gtk.ICON_SIZE_MENU)
            homeImage.set_pixel_size(16)
            homeButton.add(homeImage)
            homeButton.connect('clicked', self.home)
            switchButton = gtk.Button()
            switchButton.set_relief(gtk.RELIEF_NONE)
            switchImage = gtk.Image()
            switchImage.set_from_stock(gtk.STOCK_INDEX, gtk.ICON_SIZE_MENU)
            switchImage.set_pixel_size(16)
            switchButton.add(switchImage)
            switchButton.connect('clicked', self.switch)
            self.statusbar = gtk.Statusbar()
            self.progressBar = gtk.ProgressBar()
            self.progressBar.set_size_request(150, -1)
            statusHBox = gtk.HBox(False, 0)
            statusHBox.pack_start(backButton, False)
            statusHBox.pack_start(forwardButton, False)
            statusHBox.pack_start(self.reloadButton, False)
            statusHBox.pack_start(self.stopButton, False)
            statusHBox.pack_start(homeButton, False)
            statusHBox.pack_start(switchButton, False)
            statusHBox.pack_start(self.statusbar, True)
            statusHBox.pack_start(self.progressBar, False)
            vbox.pack_start(statusHBox, False)

            self.web_view.connect('load-progress-changed', self.progress_changed)
            self.web_view.connect('load-started', self.progress_started)
            self.web_view.connect('load-finished', self.progress_finished)
            self.window.add(vbox)
        self.window.show_all()

    def back(self, widget, data=None):
        self.web_view.go_back()

    def forward(self, widget, data=None):
        self.web_view.go_forward()

    def home(self, widget, data=None):
        self.web_view.open(self.url)

    def refresh(self, widget, data=None):
        self.web_view.reload()
        self.reloadButton.hide()
        self.stopButton.show()

    def stop(self, widget, data=None):
        self.web_view.stop_loading()
        self.stopButton.hide()
        self.reloadButton.show()

    def switch(self, widget, data=None):
        self.window.destroy()
        startup = Startup()
        startup.main()

    def progress_changed(self, web_view, amount):
        self.progressBar.set_fraction(amount / 100.0)

    def progress_started(self, web_view, frame):
        self.progressBar.show()

    def progress_finished(self, web_view, frame):
        self.progressBar.hide()

    def main(self):
        gtk.main()

class NewShortcut(object):
    def save_config(self, widget, data=None):
        url = self.urlEntry.get_text()
        name = self.nameEntry.get_text()
        userAgent = self.userAgentEntry.get_text()
        confName = os.path.join(os.path.expanduser('~'), '.prispy', name + '.conf')
        confFile = open(confName, 'wb')
        confFile.write("name = '"+name+"'\nurl = '"+url+"'\nuserAgent = '"+userAgent+"'\nwantStatusbar = "+self.wantStatusbar)
        confFile.close()
        if not self.createDeskFile == '0':
            deskName = os.path.join(os.path.expanduser('~'), '.local', 'share', 'applications', name + '.desktop')
            deskFile = open(deskName, 'wb')
            deskFile.write("[Desktop Entry]\nExec=/usr/bin/prispy "+name+"\nIcon=browser\nName="+name+"\nComment=Created with PrisPy\nTerminal=false\nType=Application\nCategories=GNOME;Application;Network;\nVersion=1.0")
            deskFile.close()
        self.window.destroy()
        startup = Startup()
        startup.main()

    def delete_event(self, widget, event, data=None):
        return False

    def destroy(self, widget, data=None):
        gtk.main_quit()

    def cancel_action(self, widget, data=None):
        self.window.destroy()
        Startup().main()

    def status_is_checked(self, widget, data=None):
        self.wantStatusbar = "%s" % ((0, 1)[widget.get_active()])

    def desk_is_checked(self, widget, data=None):
        self.createDeskFile = "%s" % ((0, 1)[widget.get_active()])

    def __init__(self):
        self.wantStatusbar = 0
        self.createDeskFile = 0
        gobject.threads_init()
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_border_width(10)
        self.window.set_resizable(True)
        self.window.set_title('PrisPy: Create new shortcut')
        self.window.connect("delete_event", self.delete_event)
        self.window.connect("destroy", self.destroy)
        urlLabel = gtk.Label('URL:')
        self.urlEntry = gtk.Entry()
        nameLabel = gtk.Label('Name:')
        self.nameEntry = gtk.Entry()
        userAgentLabel = gtk.Label('User Agent:\n(optional)')
        self.userAgentEntry = gtk.Entry()
        labelVBox = gtk.VBox(False, 0)
        labelVBox.add(urlLabel)
        labelVBox.add(nameLabel)
        labelVBox.add(userAgentLabel)
        entryVBox = gtk.VBox(False, 0)
        entryVBox.add(self.urlEntry)
        entryVBox.add(self.nameEntry)
        entryVBox.add(self.userAgentEntry)
        combinedHBox = gtk.HBox(False, 0)
        combinedHBox.pack_start(labelVBox, False, True, 0)
        combinedHBox.add(entryVBox)
        wantStatusButton = gtk.CheckButton('Show combined status/toolbar?')
        wantStatusButton.connect("clicked", self.status_is_checked, None)
        deskFileButton = gtk.CheckButton('Create a desktop file for app?')
        deskFileButton.connect("clicked", self.desk_is_checked, None)
        cancelButton = gtk.Button('Cancel')
        cancelButton.connect('clicked', self.cancel_action, None)
        okButton = gtk.Button('Ok')
        okButton.connect('clicked', self.save_config, None)
        buttonHBox = gtk.HBox(False, 0)
        buttonHBox.add(cancelButton)
        buttonHBox.add(okButton)
        buttonAlign = gtk.Alignment(1, 0, 0, 0)
        buttonAlign.add(buttonHBox)
        vbox = gtk.VBox(False, 0)
        vbox.add(combinedHBox)
        #urlLabel.show()
        #self.urlEntry.show()
        #nameLabel.show()
        #self.nameEntry.show()
        #userAgentLabel.show()
        #self.userAgentEntry.show()
        vbox.add(wantStatusButton)
        #wantStatusButton.show()
        vbox.add(deskFileButton)
        vbox.add(buttonAlign)
        #cancelButton.show()
        #okButton.show()
        self.window.add(vbox)
        self.window.show_all()

    def main(self):
        gtk.main()

class EditShortcut(object):
    def save_config(self, widget, data=None):
        urlTmp = self.urlEntry.get_text()
        name = self.nameEntry.get_text()
        userAgent = self.userAgentEntry.get_text()
        os.remove(os.path.join(os.path.expanduser('~'), '.prispy', self.oldName + '.conf'))
        os.remove(os.path.join(os.path.expanduser('~'), '.prispy', self.oldName + '.confc'))
        confName = os.path.join(os.path.expanduser('~'), '.prispy', name + '.conf')
        confFile = open(confName, 'wb')
        confFile.write("name = '"+name+"'\nurl = '"+url+"'\nuserAgent = '"+userAgent+"'\nwantStatusbar = "+self.wantStatusbar)
        confFile.close()
        self.window.destroy()
        startup = Startup()
        startup.main()

    def delete_event(self, widget, event, data=None):
        return False

    def destroy(self, widget, data=None):
        gtk.main_quit()

    def cancel_action(self, widget, data=None):
        self.window.destroy()
        Startup().main()

    def is_checked(self, widget, data=None):
        self.wantStatusbar = "%s" % ((0, 1)[widget.get_active()])

    def __init__(self, configFile):    
        imp.load_source('config', configFile)
        import config
        self.oldName = config.name
        gobject.threads_init()
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_border_width(10)
        self.window.set_resizable(True)
        self.window.set_title('PrisPy: Create new shortcut')
        self.window.connect("delete_event", self.delete_event)
        self.window.connect("destroy", self.destroy)
        urlLabel = gtk.Label('URL:')
        self.urlEntry = gtk.Entry()
        self.urlEntry.set_text(config.url)
        nameLabel = gtk.Label('Name:')
        self.nameEntry = gtk.Entry()
        self.nameEntry.set_text(config.name)
        userAgentLabel = gtk.Label('User Agent:\n(optional)')
        self.userAgentEntry = gtk.Entry()
        self.userAgentEntry.set_text(config.userAgent)
        labelVBox = gtk.VBox(False, 0)
        labelVBox.add(urlLabel)
        labelVBox.add(nameLabel)
        labelVBox.add(userAgentLabel)
        entryVBox = gtk.VBox(False, 0)
        entryVBox.add(self.urlEntry)
        entryVBox.add(self.nameEntry)
        entryVBox.add(self.userAgentEntry)
        combinedHBox = gtk.HBox(False, 0)
        combinedHBox.pack_start(labelVBox, False, True, 0)
        combinedHBox.add(entryVBox)
        wantStatusButton = gtk.CheckButton('Show combined status/toolbar?')
        wantStatusButton.connect("clicked", self.is_checked, None)
        if config.wantStatusbar == 1:
            wantStatusButton.set_active(True)
            self.wantStatusbar = 1
        else:
            wantStatusButton.set_active(False)
            self.wantStatusbar = 0
        cancelButton = gtk.Button('Cancel')
        cancelButton.connect('clicked', self.cancel_action, None)
        okButton = gtk.Button('Ok')
        okButton.connect('clicked', self.save_config, None)
        buttonHBox = gtk.HBox(False, 0)
        buttonHBox.add(cancelButton)
        buttonHBox.add(okButton)
        buttonAlign = gtk.Alignment(1, 0, 0, 0)
        buttonAlign.add(buttonHBox)
        vbox = gtk.VBox(False, 0)
        vbox.add(combinedHBox)
        urlLabel.show()
        self.urlEntry.show()
        nameLabel.show()
        self.nameEntry.show()
        userAgentLabel.show()
        self.userAgentEntry.show()
        vbox.add(wantStatusButton)
        wantStatusButton.show()
        vbox.add(buttonAlign)
        cancelButton.show()
        okButton.show()
        self.window.add(vbox)
        self.window.show_all()

    def main(self):
        gtk.main()

class Startup(object):
    def select_shortcut(self, widget, data=None):
        selection = self.treeview.get_selection()
        model, iter = selection.get_selected()
        self.shortcut = model.get_value(iter, 0)
        self.window.destroy()
        browser = Browser(self.shortcut)
        browser.main()

    def new_shortcut(self, widget, data=None):
        self.window.destroy()
        newshortcut = NewShortcut()
        newshortcut.main()

    def edit_shortcut(self, widget, data=None):
        selection = self.treeview.get_selection()
        model, iter = selection.get_selected()
        self.shortcut = model.get_value(iter, 0)
        self.configFile = os.path.join(os.path.expanduser('~'), '.prispy', self.shortcut + '.conf')
        self.window.destroy()
        editshortcut = EditShortcut(self.configFile)
        editshortcut.main()

    def delete_shortcut(self, widget, data=None):
        selection = self.treeview.get_selection()
        model, iter = selection.get_selected()
        self.shortcut = model.get_value(iter, 0)
        configFile = os.path.join(os.path.expanduser('~'), '.prispy', self.shortcut + '.conf')
        os.remove(configFile)
        deskFile = os.path.join(os.path.expanduser('~'), '.local', 'share', 'applications', self.shortcut + '.desktop')
        os.remove(deskFile)
        selection = self.treeview.get_selection()
        model, iter = selection.get_selected()
        model.remove(iter)

    def delete_event(self, widget, event, data=None):
        return False

    def destroy(self, widget, data=None):
        gtk.main_quit()

    def __init__(self):
        gobject.threads_init()
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_border_width(0)
        self.window.set_resizable(True)
        self.window.set_default_size(300, 250)
        self.window.set_title('PrisPy: Start')
        self.window.connect("delete_event", self.delete_event)
        self.window.connect("destroy", self.destroy)
        titleText = gtk.Label()
        titleText.set_markup('<span size="large"><b>Welcome to PrisPy!</b></span>')
        liststore = gtk.ListStore(str)
        self.treeview = gtk.TreeView(liststore)
        renderText = gtk.CellRendererText()
        column = gtk.TreeViewColumn('Shortcuts', renderText, text=0)
        column.set_sort_column_id(1)
        self.treeview.append_column(column)
        configDir = os.path.join(os.path.expanduser('~'), '.prispy')
        if not os.path.exists(configDir):
            os.makedirs(configDir)
        shortcuts = os.listdir(configDir)
        for config in shortcuts:
            fname, ext = os.path.splitext(config)
            if ext == '.conf':
                appendShort = liststore.append([fname])
        scrolledWindow = gtk.ScrolledWindow()
        scrolledWindow.add_with_viewport(self.treeview)
        newButton = gtk.Button('New')
        newButton.connect('clicked', self.new_shortcut, None)
        editButton = gtk.Button('Edit')
        editButton.connect('clicked', self.edit_shortcut, None)
        delButton = gtk.Button('Delete')
        delButton.connect('clicked', self.delete_shortcut, None)
        cancelButton = gtk.Button('Cancel')
        cancelButton.connect('clicked', self.destroy, None)
        okButton = gtk.Button('Ok')
        okButton.connect('clicked', self.select_shortcut, None)
        treeButtonVBox = gtk.VBox(False,0)
        treeButtonVBox.pack_start(newButton, False, True, 0)
        treeButtonVBox.pack_start(editButton, False, True, 0)
        treeButtonVBox.pack_start(delButton, False, True, 0)
        treeHBox = gtk.HBox(False, 0)
        treeHBox.add(scrolledWindow)
        treeHBox.pack_start(treeButtonVBox, False, True, 5)
        newButton.show()
        editButton.show()
        delButton.show()
        buttonHBox = gtk.HBox(False, 0)
        buttonHBox.pack_start(cancelButton, False, True, 0)
        buttonHBox.pack_start(okButton, False, True, 0)
        buttonAlign = gtk.Alignment(1, 0, 0, 0)
        buttonAlign.add(buttonHBox)
        vbox = gtk.VBox(False, 0)
        vbox.pack_start(titleText, False, True, 10)
        titleText.show()
        vbox.add(treeHBox)
        self.treeview.show()
        vbox.pack_start(buttonAlign, False, True, 5)
        cancelButton.show()
        okButton.show()
        self.window.add(vbox)
        self.window.show_all()

    def main(self):
        gtk.main()

if __name__ == "__main__":
    try: sys.argv[1]
    except IndexError:
        startup = Startup()
        startup.main()
    else:
        shortcut = sys.argv[1]
        browser = Browser(shortcut)
        browser.main()

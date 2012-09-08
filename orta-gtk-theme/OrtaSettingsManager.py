#!/usr/bin/python2
# -*- mode: Python; indent-tabs-mode: nil; -*-
_app_name = "Orta Settings Manager"
_version = "1.0"
_bugs = "Please report all bugs to <nikount@gmail.com>."
_config_header = """#
# Orta Config File
#
#
"""

import pygtk
import gtk
from sys import argv
from os import path, getenv, system
from subprocess import Popen
import ConfigParser

#useful paths
_filename = path.basename(argv[0])
_curdir = path.dirname(path.realpath(argv[0]))
_home = getenv('HOME')
_local_prefix = _home + "/.themes/Orta"
_global_prefix = '/usr/share/themes/Orta'
_configpath = _home + "/.orta/ortaconfig.ini"

#global variables
gradient_type = 1
tabs = 1
expanders = 1
scrollbars = 2
nautilus = 1
menu_item = 1
panel = 1

install_squared = False
install_old = False
remove_old = False

breadcrumbs_unified = False
nogtk_gradient = False
reverse_light_tabs = False
smooth_nogtk = False
flat_panel = False
midori = False
opera = False
remove_menu = False
fix_menubar = False
globalmenu = False
trans_tabs = False
center_title = False
nautilus_fix = False

#method that saves the current settings into a file
def config_save(self, path, gradient_style, gradient_nogtk, tab_style,
                tab_reverse, smooth_nogtk, expander_style, scrollbar_size,
                nautilus_style, breadcrumbs_style, menu_style, panel_style,
                panel_flat, midori, opera, menu_button, pixbuf_bug, globalmenu,
                trans_tabs, center_title, nautilus_fix):
    config = ConfigParser.ConfigParser()

    if not config.has_section('Fixes'):
        config.add_section('Fixes')

    for prog in ['midori', 'opera', 'menu_button', 'pixbuf_bug', 'globalmenu', 'nautilus_fix']:
        config.set('Fixes', prog, str(eval(prog)))
    config.set('Fixes', 'nogtk_transparent_tabs', str(trans_tabs))
    config.set('Fixes', 'centered_title', str(center_title))

    if not config.has_section('Panel'):
        config.add_section('Panel')

    config.set('Panel', 'style', str(panel_style))
    config.set('Panel', 'flat', str(panel_flat))

    if not config.has_section('Menu'):
        config.add_section('Menu')

    config.set('Menu', 'style', str(menu_style))

    if not config.has_section('Nautilus'):
        config.add_section('Nautilus')

    config.set('Nautilus', 'style', str(nautilus_style))
    config.set('Nautilus', 'breadcrumbs_unified', str(breadcrumbs_style))

    if not config.has_section('Scrollbars'):
        config.add_section('Scrollbars')

    config.set('Scrollbars', 'size', str(scrollbar_size))

    if not config.has_section('Expanders'):
        config.add_section('Expanders')

    config.set('Expanders', 'style', str(expander_style))

    if not config.has_section('Tabs'):
        config.add_section('Tabs')

    config.set('Tabs', 'style', str(tab_style))
    config.set('Tabs', 'reverse', str(tab_reverse))
    config.set('Tabs', 'smooth_nogtk', str(smooth_nogtk))

    if not config.has_section('Gradients'):
        config.add_section('Gradients')

    config.set('Gradients', 'style', str(gradient_style))
    config.set('Gradients', 'nogtk', str(gradient_nogtk))

    with open(path, "w") as configfile:
        configfile.write(_config_header)
        config.write(configfile)
        configfile.close()

#set the home dir files and folders
def set_home():
    system("install -d " + _home + "/.orta/gtk/")
    if not path.isdir(_home + "/.orta/panel"):
        system("cp -r " + _curdir + "/orta/panel " + _home + "/.orta")
    if not path.isdir(_home + "/.orta/metacity"):
        system("cp -r " + _curdir + "/orta/metacity " + _home + "/.orta")

def uninstall(remove_settings):
    status = 0
    status += system("rm -rf " +
                     _local_prefix +
                     _local_prefix + "-Squared " +
                     _local_prefix + "-Old " +
                     _local_prefix + "-Old-Squared")
    if remove_settings:
        status += system("rm -rf " + _home + "/.orta")
    return status == 0

def install(squared_decorator, old_decorator):
    system("find " + _home + "/.orta -type d -exec chmod 755 '{}' \;")
    system("find " + _home + "/.orta -type f -exec chmod 644 '{}' \;")

    status = 0
    status += system("install -d " + _home + "/.themes")
    status += system("cp -rf " + _home + "/.orta/gtk/Orta " + _local_prefix)
    if squared_decorator:
        status += system("cp -rf " + _home + "/.orta/gtk/Orta-Squared " + _local_prefix + "-Squared")
        if old_decorator:
            status += system("cp -rf " + _home + "/.orta/gtk/Orta-Old-Squared " + _local_prefix + "-Old-Squared")
    if old_decorator:
        status += system("cp -rf " + _home + "/.orta/gtk/Orta-Old " + _local_prefix + "-Old")
    return status == 0

#Settings Manager main class
class OrtaSettingsManager(object):

    #method to create a default configuration ini
    def config_create(self, path):
        config = ConfigParser.ConfigParser()

        config.add_section('Fixes')
        for prog in ['midori', 'opera', 'menu_button', 'pixbuf_bug', 'globalmenu', 'nogtk_transparent_tabs', 'centered_title', 'nautilus_fix']:
            config.set('Fixes', prog, 'False')

        config.add_section('Panel')
        config.set('Panel', 'style', '2')
        config.set('Panel', 'flat', 'False')

        config.add_section('Menu')
        config.set('Menu', 'style', '4')

        config.add_section('Nautilus')
        config.set('Nautilus', 'style', '1')
        config.set('Nautilus', 'breadcrumbs_unified', 'False')

        config.add_section('Scrollbars')
        config.set('Scrollbars', 'size', '2')

        config.add_section('Expanders')
        config.set('Expanders', 'style', '1')

        config.add_section('Tabs')
        config.set('Tabs', 'style', '1')
        config.set('Tabs', 'reverse', 'False')
        config.set('Tabs', 'smooth_nogtk', 'False')

        config.add_section('Gradients')
        config.set('Gradients', 'style', '1')
        config.set('Gradients', 'nogtk', 'False')

        with open(path, "w") as configfile:
            configfile.write(_config_header)
            config.write(configfile)
            configfile.close()

    #method that restores the previously saved settings on application startup
    def config_restore(self, path):
        config = ConfigParser.ConfigParser()
        config.read(path)

        try:
            radio_gradient = config.getint('Gradients', 'style') - 1
        except ConfigParser.Error:
            radio_gradient = 2
        self.builder.get_object(["Default", "Short", "No"][radio_gradient] + "GradientButton").set_active(True)

        try:
            check_gradient = config.getboolean('Gradients', 'nogtk')
        except ConfigParser.Error:
            check_gradient = False
        self.builder.get_object("NoGtkGradientButton").set_active(check_gradient)

        try:
            radio_expanders = config.getint('Expanders', 'style') - 1
        except ConfigParser.Error:
            radio_expanders = 0
        self.builder.get_object(["Default", "Arrow", "Simple", "Light", "Dark"][radio_expanders] + "ExpanderButton").set_active(True)

        try:
            radio_tabs = config.getint('Tabs', 'style') - 1
        except ConfigParser.Error:
            radio_tabs = 0
        self.builder.get_object(["tabsRadio1Default", "tabsRadio2Squared", "tabsRadio3Light",
                                 "SmoothTabsButton", "UnifiedTabsButton"][radio_tabs]).set_active(True)

        try:
            check_tabs = config.getboolean('Tabs', 'reverse')
        except ConfigParser.Error:
            check_tabs = False
        self.builder.get_object("ReversedLightTabsButton").set_active(check_tabs)

        try:
            check_smooth_tabs = config.getboolean('Tabs', 'smooth_nogtk')
        except ConfigParser.Error:
            check_smooth_tabs = False
        self.builder.get_object("UseSmoothNoGtkButton").set_active(check_smooth_tabs)

        try:
            radio_scrollbar = config.getint('Scrollbars', 'size') - 1
        except ConfigParser.Error:
            radio_scrollbar = 1
        self.builder.get_object("scrollbarsRadio" + ["2Thin", "1Normal", "3Wide", "4Wider", "5Widest"][radio_scrollbar]).set_active(True)

        try:
            radio_nautilus = config.getint('Nautilus', 'style') - 1
        except ConfigParser.Error:
            radio_nautilus = 0
        self.builder.get_object("nautilusRadio" + ["1Default", "2Elementary", "3ElementaryNM"][radio_nautilus]).set_active(True)

        try:
            radio_breadcrumbs = config.getboolean('Nautilus', 'breadcrumbs_unified')
        except ConfigParser.Error:
            radio_breadcrumbs = False
        self.builder.get_object(["Default", "Unified"][radio_breadcrumbs] + "BreadcrumbsButton").set_active(True)

        try:
            radio_menu = config.getint('Menu', 'style') - 1
        except ConfigParser.Error:
            radio_menu = 3
        self.builder.get_object(["Default", "Squared", "Simple", "DarkRound", "DarkSquared"][radio_menu] + "MenuItemButton").set_active(True)

        try:
            radio_panel = config.getint('Panel', 'style') - 1
        except ConfigParser.Error:
            radio_panel = 1
        self.builder.get_object("PanelRadio" + ["1Light", "2Dark"][radio_panel]).set_active(True)

        try:
            check_panel = config.getboolean('Panel', 'flat')
        except ConfigParser.Error:
            check_panel = False
        self.builder.get_object("PanelNoBgButton").set_active(check_panel)

        try:
            check_midori = config.getboolean('Fixes', 'midori')
        except ConfigParser.Error:
            check_midori = False
        self.builder.get_object("OrtaMidoriButton").set_active(check_midori)

        try:
            check_opera = config.getboolean('Fixes', 'opera')
        except ConfigParser.Error:
            check_opera = False
        self.builder.get_object("OrtaOperaButton").set_active(check_opera)

        try:
            check_menu_button = config.getboolean('Fixes', 'menu_button')
        except ConfigParser.Error:
            check_menu_button = False
        self.builder.get_object("OrtaMenuButton").set_active(check_menu_button)

        try:
            check_pixbuf = config.getboolean('Fixes', 'pixbuf_bug')
        except ConfigParser.Error:
            check_pixbuf = False
        self.builder.get_object("OrtaLucidButton").set_active(check_pixbuf)

        try:
            check_globalmenu = config.getboolean('Fixes', 'globalmenu')
        except ConfigParser.Error:
            check_globalmenu = False
        self.builder.get_object("OrtaGlobalMenuButton").set_active(check_globalmenu)

        try:
            check_trans_tabs = config.getboolean('Fixes', 'nogtk_transparent_tabs')
        except ConfigParser.Error:
            check_trans_tabs = False
        self.builder.get_object("AllowTransTabsButton").set_active(check_trans_tabs)

        try:
            check_center_title = config.getboolean('Fixes', 'centered_title')
        except ConfigParser.Error:
            check_center_title = False
        self.builder.get_object("CenterTitleButton").set_active(check_center_title)

        try:
            check_nautilus_fix = config.getboolean('Fixes', 'nautilus_fix')
        except ConfigParser.Error:
            check_nautilus_fix = False
        self.builder.get_object("NautilusFixButton").set_active(check_nautilus_fix)

    #buttons callback methods
    def on_remove_old_toggled(self, widget, data=None):
        global remove_old
        remove_old = not remove_old

    def on_ensure_permissions_toggled(self, widget, data=None):
        pass

    def on_install_squared_toggled(self, widget, data=None):
        global install_squared
        install_squared = not install_squared

    def on_install_old_toggled(self, widget, data=None):
        global install_old
        install_old = not install_old

    def on_default_gradient_toggled(self, widget, data=None):
        global gradient_type
        gradient_type = 1

    def on_short_gradient_toggled(self, widget, data=None):
        global gradient_type
        gradient_type = 2

    def on_no_gradient_toggled(self, widget, data=None):
        global gradient_type
        gradient_type = 3

    def on_nogtk_gradient_toggled(self, widget, data=None):
        global nogtk_gradient
        nogtk_gradient = not nogtk_gradient

    def on_tabs_default_toggled(self, widget, data=None):
        global tabs
        tabs = 1

    def on_tabs_squared_toggled(self, widget, data=None):
        global tabs
        tabs = 2

    def on_tabs_light_toggled(self, widget, data=None):
        global tabs
        tabs = 3

    def on_tabs_smooth_toggled(self, widget, data=None):
        global tabs
        tabs = 4

    def on_tabs_unified_toggled(self, widget, data=None):
        global tabs
        tabs = 5

    def on_reverse_light_tabs_toggled(self, widget, data=None):
        global reverse_light_tabs
        reverse_light_tabs = not reverse_light_tabs

    def on_smooth_nogtk_toggled(self, widget, data=None):
        global smooth_nogtk
        smooth_nogtk = not smooth_nogtk

    def on_expander_default_toggled(self, widget, data=None):
        global expanders
        expanders = 1

    def on_expander_arrow_toggled(self, widget, data=None):
        global expanders
        expanders = 2

    def on_expander_simple_toggled(self, widget, data=None):
        global expanders
        expanders = 3

    def on_expander_light_toggled(self, widget, data=None):
        global expanders
        expanders = 4

    def on_expander_dark_toggled(self, widget, data=None):
        global expanders
        expanders = 5

    def on_scrollbars_thin_toggled(self, widget, data=None):
        global scrollbars
        scrollbars = 1

    def on_scrollbars_normal_toggled(self, widget, data=None):
        global scrollbars
        scrollbars = 2

    def on_scrollbars_wide_toggled(self, widget, data=None):
        global scrollbars
        scrollbars = 3

    def on_scrollbars_wider_toggled(self, widget, data=None):
        global scrollbars
        scrollbars = 4

    def on_scrollbars_widest_toggled(self, widget, data=None):
        global scrollbars
        scrollbars = 5

    def on_nautilus_default_toggled(self, widget, data=None):
        global nautilus
        nautilus = 1

    def on_nautilus_elementary_toggled(self, widget, data=None):
        global nautilus
        nautilus = 2

    def on_nautilus_elementary_no_menubar_toggled(self, widget, data=None):
        global nautilus
        nautilus = 3

    def on_default_breadcrumbs_toggled(self, widget, data=None):
        global breadcrumbs_unified
        breadcrumbs_unified = False

    def on_unified_breadcrumbs_toggled(self, widget, data=None):
        global breadcrumbs_unified
        breadcrumbs_unified = True

    def on_default_menu_item_toggled(self, widget, data=None):
        global menu_item
        menu_item = 1

    def on_squared_menu_item_toggled(self, widget, data=None):
        global menu_item
        menu_item = 2

    def on_simple_menu_item_toggled(self, widget, data=None):
        global menu_item
        menu_item = 3

    def on_dark_round_menu_item_toggled(self, widget, data=None):
        global menu_item
        menu_item = 4

    def on_dark_squared_menu_item_toggled(self, widget, data=None):
        global menu_item
        menu_item = 5

    def on_panel_light_toggled(self, widget, data=None):
        global panel
        panel = 1

    def on_panel_dark_toggled(self, widget, data=None):
        global panel
        panel = 2

    def on_flat_panel_toggled(self, widget, data=None):
        global flat_panel
        flat_panel = not flat_panel

    def on_midori_clicked(self, widget, data=None):
        global midori
        midori = not midori

    def on_opera_clicked(self, widget, data=None):
        global opera
        opera = not opera

    def on_remove_menu_clicked(self, widget, data=None):
        global remove_menu
        remove_menu = not remove_menu

    def on_fix_menubar_clicked(self, widget, data=None):
        global fix_menubar
        fix_menubar = not fix_menubar

    def on_globalmenu_toggled(self, widget, data=None):
        global globalmenu
        globalmenu = not globalmenu

    def on_allow_trans_tabs_toggled(self, widget, data=None):
        global trans_tabs
        trans_tabs = not trans_tabs

    def on_center_alignment_toggled(self, widget, data=None):
        global center_title
        center_title = not center_title

    def on_nautilus_fix_toggled(self, widget, data=None):
        global nautilus_fix
        nautilus_fix = not nautilus_fix

    #extract the theme files
    def on_install_clicked(self, widget, data=None):
        self.builder.get_object("InstallForAllUsers").show()
        set_home()
        system("tar -xvf " + _curdir + "/Orta.tar.gz -C " + _home + "/.orta/gtk")
        system("tar -xvf " + _curdir + "/Orta-Old.tar.gz -C " + _home + "/.orta/gtk")
        system("tar -xvf " + _curdir + "/Orta-Squared.tar.gz -C " + _home + "/.orta/gtk")
        system("tar -xvf " + _curdir + "/Orta-Old-Squared.tar.gz -C " + _home + "/.orta/gtk")

    #installs on /usr/share/themes
    def on_install_for_all_yes_clicked(self, widget, data=None):
        global install_squared
        global install_old
        global remove_old

        uninstall_all = uninstall(False)
        install_for_all = install(install_squared, install_old)

        self.builder.get_object("InstallForAllUsers").hide()
        #check if the theme is actually installed
        self.builder.get_object("Installation" + ["Aborted", "Succeeded"][install_for_all] + "Dialog").show()

    #install on ~/.themes
    def on_install_for_all_no_clicked(self, widget, data=None):
        global install_squared
        global install_old
        global remove_old

        uninstall_local = uninstall(False)
        install_local = install(install_squared, install_old)

        self.builder.get_object("InstallForAllUsers").hide()

        #check if the theme is actually installed
        self.builder.get_object("Installation" + ["Aborted", "Succeeded"][install_local] + "Dialog").show()

    #installation canceled
    def on_install_cancel_clicked(self, widget, data=None):
        self.builder.get_object("InstallForAllUsers").hide()
        self.builder.get_object("InstallationAbortedDialog").show()

    #installation successful
    def on_installation_ok_clicked(self, widget, data=None):
        self.builder.get_object("InstallationSucceededDialog").hide()
        #try to launch gnome-appearance-properties
        try:
            Popen('gnome-appearance-properties')
        except Exception:
            self.builder.get_object("GnomeNotFoundDialog").show()

    #installation aborted
    def on_installation_aborted_close_clicked(self, widget, data=None):
        self.builder.get_object("InstallationAbortedDialog").hide()

    #uninstall
    def on_uninstall_clicked(self, widget, data=None):
        self.builder.get_object("UninstallRemoveFiles").show()

    #remove everything
    def on_remove_files_yes(self, widget, data=None):
        self.builder.get_object("UninstallRemoveFiles").hide()
        uninstall_all = uninstall(True)
        self.builder.get_object("Uninstall" + ["Failed", "Completed"][uninstall_all] + "Dialog").show()

    #remove theme only
    def on_remove_files_no(self, widget, data=None):
        self.builder.get_object("UninstallRemoveFiles").hide()
        uninstall_theme = uninstall(False)
        self.builder.get_object("Uninstall" + ["Failed", "Completed"][uninstall_theme] + "Dialog").show()

    def on_uninstall_failed_close(self, widget, data=None):
        self.builder.get_object("UninstallFailedDialog").hide()

    def on_uninstall_cancel_clicked(self, widget, data=None):
        self.builder.get_object("UninstallRemoveFiles").hide()

    def on_uninstall_completed_close_clicked(self, widget, data=None):
        self.builder.get_object("UninstallCompletedDialog").hide()


    #saves the new settings
    def on_save_clicked(self, widget, data=None):
        #our settings
        all_users = False
        settings = []
        settings_rc = _global_prefix + '/gtk-2.0/settings.rc'
        settings_rc_local = _local_prefix + "/gtk-2.0/settings.rc"
        settings_backup = _global_prefix + '/gtk-2.0/~settings.rc'
        settings_backup_local = _local_prefix + '/gtk-2.0/~settings.rc'
        settings_rc_temp = _home + '/.orta/settings.rc'

        #make sure the theme is installed. Priority is given to a local installation
        #since in the case that the theme is installed both globally and locally the
        #local version will be the one used in most cases.
        if path.isfile(settings_rc_local):
            pass
        elif path.isfile(settings_rc):
            all_users = True
        # otherwise check for a backup settings file
        elif path.isfile(settings_backup_local):
            system('cp -f ' + settings_backup_local + ' ' + settings_rc_local)
            self.builder.get_object("SettingsRestoredDialog").show()
            return
        elif path.isfile(settings_backup):
            system("gksudo 'cp -f " + settings_backup + " "  + settings_rc + "'")
            self.builder.get_object("SettingsRestoredDialog").show()
            return
        # failing that, report that Orta isn't installed
        else:
            self.builder.get_object("OrtaNotInstalledDialog").show()
            return

        gradient_type_string = ['default', 'short', 'flat'][gradient_type - 1]
        settings += ['Gradients/Globalmenu/' + ['none', gradient_type_string][gradient_type < 3] + ['', '-globalmenu'][globalmenu]]
        settings += ['Menubar/menubar-' + gradient_type_string + ['', '-fix'][fix_menubar]]
        settings += ['Notebook/notebook-' + ['smooth-', ''][tabs < 4] + gradient_type_string]
        settings += ['Tabs/tabs-' + ['default', 'squared', 'light' + ['', '-reversed'][reverse_light_tabs], 'smooth', 'smooth-dark'][tabs] + ['', '-flat'][tabs > 3 and gradient_type == 3]]
        settings += ['Tabs/No-Gtk/' + ['', 'Transparent'][trans_tabs] + 'tabs-light' + ['', '-reversed'][reverse_light_tabs]]
        settings += ['Sliders/scrollbars-' + ['thin', 'default', 'wide', 'wider', 'widest'][scrollbars - 1]]
        settings += ['Menu/' + ['', 'opera-'][opera] + ['-dark', ''][menu_item < 4] + 'menu']
        settings += ['Menu-Item/menu-item-' + ['default', 'squared', 'simple', 'dark-round', 'dark-squared'][menu_item - 1]]
        settings += ['Panel/panel-'+ ['light', 'dark'][panel - 1] + '-' + ['default', 'flat'][flat_panel]]

        if nogtk_gradient:
            settings += ['Menubar/No-Gtk/menubar-' + gradient_type_string + ['', '-fix'][fix_menubar]]
            if gradient_type != 3:
                settings += ['Gradients/No-Gtk/gradient-' + gradient_type_string]

        if trans_tabs:
            settings += ['Notebook/No-Gtk/nogtk-' + ['', 'smooth-'][smooth_nogtk] + 'flat']
            if smooth_nogtk:
                settings += ['Notebook/notebook-mozilla']
                settings += ['Tabs/No-Gtk/Transparent/tabs-smooth']
        else:
            settings += ['Tabs/Mozilla/tabs-' + ['light' + ['', '-reversed'][reverse_light_tabs], 'smooth-flat'][smooth_nogtk]]
            if smooth_nogtk:
                settings += ['Tabs/No-Gtk/tabs-smooth']
                settings += ['Notebook/notebook-mozilla']

        if nautilus > 1:
            settings += ['Nautilus/breadcrumbs-' + ['default', 'unified'][breadcrumbs_unified]]
            settings += ['Nautilus/nautilus-with' + ['', 'out'][nautilus == 3] + '-menubar' + ['', '-solid'][nautilus_fix]]
            if nautilus == 2:
                settings += ['Nautilus/nautilus-menubar' + ['', '-fix'][fix_menubar]]

        if expanders > 1:
            settings += ['Expanders/' + ['arrow', 'simple', 'light', 'dark'][expanders - 2] ]

        if midori:
            settings += ['Tabs/Midori/tabs-light' + ['', '-reversed'][reverse_light_tabs]]

        #tries to write the new settings into a temporary file
        try:
            settings_file = open(settings_rc_temp, 'wt')
            for setting in settings:
                settings_file.write('include "Styles/' + setting + '.rc"\n')
            settings_file.close()
        except Exception:
            self.builder.get_object("WriteErrorDialog").show()
            return

        #save the new settings to ini
        save = config_save
        save(self, _configpath, gradient_type, nogtk_gradient, tabs,
             reverse_light_tabs, smooth_nogtk, expanders, scrollbars,
             nautilus, breadcrumbs_unified, menu_item, panel, flat_panel,
             midori, opera, remove_menu, fix_menubar, globalmenu,
             trans_tabs, center_title, nautilus_fix)

        if all_users:
            #backup the old settings file
            system('mv ' + settings_rc_local + ' ' + settings_backup_local)
            #copy the new settings file
            system('cp -f -T ' + settings_rc_temp + ' ' + settings_rc_local)

            #select the right index.theme file for the panel color
            #and the menu button preferences
            system("cp -f " + _home + "/.orta/panel/" + ["light", "dark"][panel - 1] +
                   "/" + ["", "nomenu"][remove_menu] + "/index.theme " + _local_prefix + "/")

            if center_title:
                system("cp -f " + _home + "/.orta/metacity/round/center/metacity-theme-1.xml " + _local_prefix + "/metacity-1")
                if path.isdir(_local_prefix + "-Squared"):
                    system("cp -f " + _home + "/.orta/metacity/squared/center/metacity-theme-1.xml " + _local_prefix + "-Squared/metacity-1")
            else:
                system("cp -f " + _home + "/.orta/metacity/round/left/metacity-theme-1.xml " + _local_prefix + "/metacity-1")
                if path.isdir(_local_prefix + "-Squared"):
                    system("cp -f " + _home + "/.orta/metacity/squared/left/metacity-theme-1.xml " + _local_prefix + "-Squared/metacity-1")

        else:
            system("gksudo 'mv " + settings_rc + " "  + settings_backup + "'")
            system("gksudo 'cp -f -T " + settings_rc_temp + " " + settings_rc + "'")
            system("gksudo 'cp -f " + _home + "/.orta/panel/" + ["light", "dark"][panel - 1] +
                   "/" + ["", "nomenu"][remove_menu] + "/index.theme " + _global_prefix + "'")
            if center_title:
                system("gksudo 'cp -f " + _home + "/.orta/metacity/round/center/metacity-theme-1.xml " + _global_prefix + "/metacity-1'")
                if path.isdir(_global_prefix + "-Squared"):
                    system("gksudo 'cp -f " + _home + "/.orta/metacity/squared/center/metacity-theme-1.xml " + _global_prefix + "-Squared/metacity-1'")
            else:
                system("gksudo 'cp -f " + _home + "/.orta/metacity/round/left/metacity-theme-1.xml " + _global_prefix + "/metacity-1'")
                if path.isdir(_global_prefix + "-Squared"):
                    system("gksudo 'cp -f " + _home + "/.orta/metacity/squared/left/metacity-theme-1.xml " + _global_prefix + "-Squared/metacity-1'")
        self.builder.get_object("SettingsSavedDialog").show()

    def on_settings_restore_close_clicked(self, widget, data=None):
        self.builder.get_object("SettingsRestoredDialog").hide()

    def on_error_dialog_close_clicked(self, widget, data=None):
        self.builder.get_object("WriteErrorDialog").hide()

    def on_settings_saved_ok_clicked(self, widget, data=None):
        self.builder.get_object("SettingsSavedDialog").hide()
        try:
            system("killall gnome-appearance-properties")
            Popen('gnome-appearance-properties')
        except Exception:
            self.builder.get_object("GnomeNotFoundDialog").show()

    #restore default settings
    def on_defaults_clicked(self, widget, data=None):
        self.builder.get_object("DefaultGradientButton").set_active(True)
        self.builder.get_object("NoGtkGradientButton").set_active(False)
        self.builder.get_object("tabsRadio1Default").set_active(True)
        self.builder.get_object("ReversedLightTabsButton").set_active(False)
        self.builder.get_object("UseSmoothNoGtkButton").set_active(False)
        self.builder.get_object("DefaultExpanderButton").set_active(True)
        self.builder.get_object("scrollbarsRadio1Normal").set_active(True)
        self.builder.get_object("DefaultMenuItemButton").set_active(True)
        self.builder.get_object("nautilusRadio1Default").set_active(True)
        self.builder.get_object("DefaultBreadcrumbsButton").set_active(True)
        self.builder.get_object("panelRadio1Light").set_active(True)
        self.builder.get_object("PanelNoBgButton").set_active(False)
        self.builder.get_object("OrtaMidoriButton").set_active(False)
        self.builder.get_object("OrtaOperaButton").set_active(False)
        self.builder.get_object("OrtaMenuButton").set_active(False)
        self.builder.get_object("OrtaLucidButton").set_active(False)
        self.builder.get_object("OrtaGlobalMenuButton").set_active(False)
        self.builder.get_object("AllowTransTabsButton").set_active(False)
        self.builder.get_object("CenterTitleButton").set_active(False)
        self.builder.get_object("NautilusFixButton").set_active(False)

    def on_mainWindow_destroy(self, widget, data=None):
        gtk.main_quit()

    def on_quit_clicked(self, widget, data=None):
        gtk.main_quit()

    def on_warning_ok_clicked(self, widget, data=None):
        self.builder.get_object("OrtaNotInstalledDialog").hide()

    def __init__(self):
        self.builder = gtk.Builder()
        self.builder.add_from_file(path.join(_curdir, "orta/OrtaSettingsManager.ui"))
        self.builder.connect_signals(self)
        self.window = self.builder.get_object("mainWindow")
        self.window.show()

    def main_loop(self):
        gtk.main()
        return 0

def main():
    settings_manager = OrtaSettingsManager()
    set_home()
    if not path.isfile(_configpath):
        settings_manager.config_create(_configpath)
    settings_manager.config_restore(_configpath)
    settings_manager.main_loop()

if __name__ == "__main__":
    main()

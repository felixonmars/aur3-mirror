#!/usr/bin/python
_app_name = "Orta Settings Manager"
_version = "1.0"
_bugs = "Please report all bugs to <nikount@gmail.com>."
_config_header = """#
# Orta Config File
#
#
"""

import gi
import gi.pygtkcompat

gi.pygtkcompat.enable() 
gi.pygtkcompat.enable_gtk(version='3.0')

import gtk
import sys
import os
import urllib.request, urllib.error, urllib.parse
import shutil
import subprocess
import configparser

#useful paths
_filename = os.path.basename(sys.argv[0])
_curdir = os.path.dirname(os.path.realpath(sys.argv[0]))
_configpath = os.getenv('HOME') + "/.orta/ortaconfig.ini"

#global variables
gradient_type = 1
tabs = 1
expanders = 1
scrollbars = 2
nautilus = 1
breadcrumbs = 1
menu_item = 1
panel = 1

install_squared = False
install_old = False
remove_old = False
ensure_permissions = False

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
def config_save(self, path, gradient_style, gradient_nogtk, tab_style, tab_reverse, smooth_nogtk, expander_style, scrollbar_size, nautilus_style, breadcrumbs_style, menu_style, panel_style, panel_flat, midori, opera, menu_button, pixbuf_bug, globalmenu, trans_tabs, center_title, nautilus_fix):
        config = configparser.ConfigParser()

        if not config.has_section('Fixes') :
            config.add_section('Fixes')

        config.set('Fixes','midori',str(midori))
        config.set('Fixes','opera',str(opera))
        config.set('Fixes','menu_button',str(menu_button))
        config.set('Fixes','pixbuf_bug',str(pixbuf_bug))
        config.set('Fixes','globalmenu',str(globalmenu))
        config.set('Fixes','nogtk_transparent_tabs',str(trans_tabs))
        config.set('Fixes','centered_title',str(center_title))
        config.set('Fixes','nautilus_fix',str(nautilus_fix))

        if not config.has_section('Panel') :
            config.add_section('Panel')

        config.set('Panel','style',str(panel_style))
        config.set('Panel','flat',str(panel_flat))

        if not config.has_section('Menu') :
            config.add_section('Menu')

        config.set('Menu','style',str(menu_style))

        if not config.has_section('Nautilus') :
            config.add_section('Nautilus')

        config.set('Nautilus','style',str(nautilus_style))
        config.set('Nautilus','breadcrumbs',str(breadcrumbs_style))

        if not config.has_section('Scrollbars') :
            config.add_section('Scrollbars')

        config.set('Scrollbars','size',str(scrollbar_size))

        if not config.has_section('Expanders') :
            config.add_section('Expanders')

        config.set('Expanders','style',str(expander_style))

        if not config.has_section('Tabs') :
            config.add_section('Tabs')

        config.set('Tabs','style',str(tab_style))
        config.set('Tabs','reverse',str(tab_reverse))
        config.set('Tabs','smooth_nogtk',str(smooth_nogtk))

        if not config.has_section('Gradients') :
            config.add_section('Gradients')
    
        config.set('Gradients','style',str(gradient_style))
        config.set('Gradients','nogtk',str(gradient_nogtk))

        with open(path, "w") as configfile:
            configfile.write(_config_header)
            config.write(configfile)
            configfile.close()

#set the home dir files and folders
def set_home():
    os.system("mkdir -p ~/.orta")
    os.system("mkdir -p ~/.orta/gtk")
    if not os.path.isdir("~/.orta/panel") :
        os.system("cp -r " + _curdir + "/orta/panel ~/.orta")
    if not os.path.isdir("~/.orta/metacity") :
        os.system("cp -r " + _curdir + "/orta/metacity ~/.orta")

def uninstall(remove_all, remove_settings):
    if os.path.isdir("~/.themes/Orta") :
        os.system("rm -R -f ~/.themes/Orta")
    if os.path.isdir("~/.themes/Orta-Squared") :
        os.system("rm -R -f ~/.themes/Orta-Squared")
    if os.path.isdir("~/.themes/Orta-Old") :
        os.system("rm -R -f ~/.themes/Orta-Old")
    if os.path.isdir("~/.themes/Orta-Old-Squared") :
        os.system("rm -R -f ~/.themes/Orta-Old-Squared")

    if remove_all :
        if os.path.isdir("/usr/share/themes/Orta") :
            os.system("gksu 'rm -R -f /usr/share/themes/Orta'")
        if os.path.isdir("/usr/share/themes/Orta-Squared") :
            os.system("gksu 'rm -R -f /usr/share/themes/Orta-Squared'")
        if os.path.isdir("/usr/share/themes/Orta-Old") :
            os.system("gksu 'rm -R -f /usr/share/themes/Orta-Old'")
        if os.path.isdir("/usr/share/themes/Orta-Old-Squared") :
            os.system("gksu 'rm -R -f /usr/share/themes/Orta-Old-Squared'")

    if remove_settings and os.path.isdir("~/.orta") :
        os.system("rm -R -f ~/.orta")

    return os.path.isdir("~/.themes/Orta") or \
        os.path.isdir("~/.themes/Orta-Squared") or \
        os.path.isdir("~/.themes/Orta-Old") or \
        os.path.isdir("~/.themes/Orta-Old-Squared") or \
        os.path.isdir("/usr/share/themes/Orta") or \
        os.path.isdir("/usr/share/themes/Orta-Squared") or \
        os.path.isdir("/usr/share/themes/Orta-Old") or \
        os.path.isdir("/usr/share/themes/Orta-Old-Squared") or \
        remove_settings and os.path.isdir("~/.orta") 

def install(squared_decorator, old_decorator, fix_permissions, install_for_all):
    if fix_permissions :
        os.system("chmod -R 755 ~/.orta")
#        os.system("find ~/.orta -type d -exec chmod 755 '{}' \;")
#        os.system("find ~/.orta -type f -exec chmod 644 '{}' \;")

    if install_for_all :
        os.system("gksu 'cp -r -f ~/.orta/gtk/Orta /usr/share/themes/Orta'")
        if squared_decorator :
            os.system("gksu 'cp -r -f ~/.orta/gtk/Orta-Squared /usr/share/themes/Orta-Squared'")
            if old_decorator :
                os.system("gksu 'cp -r -f ~/.orta/gtk/Orta-Old-Squared /usr/share/themes/Orta-Old-Squared'")
        if old_decorator :
            os.system("gksu 'cp -r -f ~/.orta/gtk/Orta-Old /usr/share/themes/Orta-Old'")
        return os.path.isdir("/usr/share/themes/Orta")

    os.system("cp -r -f ~/.orta/gtk/Orta ~/.themes/Orta")
    if squared_decorator :
        os.system("cp -r -f ~/.orta/gtk/Orta-Squared ~/.themes/Orta-Squared")
        if old_decorator :
            os.system("cp -r -f ~/.orta/gtk/Orta-Old-Squared ~/.themes/Orta-Old-Squared")
    if old_decorator :
        os.system("cp -r -f ~/.orta/gtk/Orta-Old ~/.themes/Orta-Old")
    return os.path.isdir("~/.themes/Orta")

#Settings Manager main class
class OrtaSettingsManager:

#method to create a default configuration ini
    def config_create(self, path):
        config = configparser.ConfigParser()

        config.add_section('Fixes')
        config.set('Fixes','midori','False')
        config.set('Fixes','opera','False')
        config.set('Fixes','menu_button','False')
        config.set('Fixes','pixbuf_bug','False')
        config.set('Fixes','globalmenu','False')
        config.set('Fixes','nogtk_transparent_tabs','False')
        config.set('Fixes','centered_title','False')
        config.set('Fixes','nautilus_fix','False')

        config.add_section('Panel')
        config.set('Panel','style','2')
        config.set('Panel','flat','False')

        config.add_section('Menu')
        config.set('Menu','style','4')

        config.add_section('Nautilus')
        config.set('Nautilus','style','1')
        config.set('Nautilus','breadcrumbs','1')

        config.add_section('Scrollbars')
        config.set('Scrollbars','size','2')

        config.add_section('Expanders')
        config.set('Expanders','style','1')

        config.add_section('Tabs')
        config.set('Tabs','style','1')
        config.set('Tabs','reverse','False')
        config.set('Tabs','smooth_nogtk','False')

        config.add_section('Gradients')
        config.set('Gradients','style','1')
        config.set('Gradients','nogtk','False')

        with open(path, "w") as configfile:
            configfile.write(_config_header)
            config.write(configfile)
            configfile.close()

#method that restores the previously saved settings on application startup
#Ohh sweet switch case, where are thou?
    def config_restore(self, path):
        config = configparser.ConfigParser()
        config.read(path)

        try :
            gradients_style = ["", "Default", "Short", "No"][config.getint('Gradients', 'style')] + "GradientButton"
            radio_gradient = self.builder.get_object(gradients_style)
            radio_gradient.set_active(True)
        except configparser.Error :
            radio_gradient = self.builder.get_object("NoGradientButton")
            radio_gradient.set_active(True)

        try :
            check_gradient = self.builder.get_object("NoGtkGradientButton")
            check_gradient.set_active(config.getboolean('Gradients', 'nogtk'))
        except configparser.Error :
            check_gradient = self.builder.get_object("NoGtkGradientButton")
            check_gradient.set_active(False)

        try:
            expanders_style = ["", "Default", "Arrow", "Simple", "Light", "Dark"][config.getint('Expanders', 'style')] + "ExpanderButton"
            radio_expanders = self.builder.get_object(expanders_style)
            radio_expanders.set_active(True)
        except configparser.Error :
            radio_expanders = self.builder.get_object("DefaultExpanderButton")
            radio_expanders.set_active(True)

        try:
            if config.getint('Tabs', 'style') == 1 :
                radio_tabs = self.builder.get_object("tabsRadio1Default")
                radio_tabs.set_active(True)
            elif config.getint('Tabs', 'style') == 2 :
                radio_tabs = self.builder.get_object("tabsRadio2Squared")
                radio_tabs.set_active(True)
            elif config.getint('Tabs', 'style') == 3 :
                radio_tabs = self.builder.get_object("tabsRadio3Light")
                radio_tabs.set_active(True)
            elif config.getint('Tabs', 'style') == 4 :
                radio_tabs = self.builder.get_object("SmoothTabsButton")
                radio_tabs.set_active(True)
            elif config.getint('Tabs', 'style') == 5 :
                radio_tabs = self.builder.get_object("UnifiedTabsButton")
                radio_tabs.set_active(True)
        except configparser.Error :
            radio_tabs = self.builder.get_object("tabsRadio1Default")
            radio_tabs.set_active(True)

        try :
            if config.getboolean('Tabs', 'reverse') :
                check_tabs = self.builder.get_object("ReversedLightTabsButton")
                check_tabs.set_active(True)
            else :
                check_tabs = self.builder.get_object("ReversedLightTabsButton")
                check_tabs.set_active(False)
        except configparser.Error :
            check_tabs = self.builder.get_object("ReversedLightTabsButton")
            check_tabs.set_active(False)

        try :
            check_smooth_tabs = self.builder.get_object("UseSmoothNoGtkButton")
            check_smooth_tabs.set_active(config.getboolean('Tabs', 'smooth_nogtk'))
        except configparser.Error :
            check_smooth_tabs = self.builder.get_object("UseSmoothNoGtkButton")
            check_smooth_tabs.set_active(False)

        try :
            if config.getint('Scrollbars', 'size') == 1 :
                radio_scrollbar = self.builder.get_object("scrollbarsRadio2Thin")
                radio_scrollbar.set_active(True)
            elif config.getint('Scrollbars', 'size') == 2 :
                radio_scrollbar = self.builder.get_object("scrollbarsRadio1Normal")
                radio_scrollbar.set_active(True)
            elif config.getint('Scrollbars', 'size') == 3 :
                radio_scrollbar = self.builder.get_object("scrollbarsRadio3Wide")
                radio_scrollbar.set_active(True)
            elif config.getint('Scrollbars', 'size') == 4 :
                radio_scrollbar = self.builder.get_object("scrollbarsRadio4Wider")
                radio_scrollbar.set_active(True)
            elif config.getint('Scrollbars', 'size') == 5 :
                radio_scrollbar = self.builder.get_object("scrollbarsRadio5Widest")
                radio_scrollbar.set_active(True)
        except configparser.Error :
            radio_scrollbar = self.builder.get_object("scrollbarsRadio1Normal")
            radio_scrollbar.set_active(True)

        try :
            if config.getint('Nautilus', 'style') == 1 :
                radio_nautilus = self.builder.get_object("nautilusRadio1Default")
                radio_nautilus.set_active(True)
            elif config.getint('Nautilus', 'style') == 2 :
                radio_nautilus = self.builder.get_object("nautilusRadio2Elementary")
                radio_nautilus.set_active(True)
            elif config.getint('Nautilus', 'style') == 3 :
                radio_nautilus = self.builder.get_object("nautilusRadio3ElementaryNM")
                radio_nautilus.set_active(True)
        except configparser.Error :
            radio_nautilus = self.builder.get_object("nautilusRadio1Default")
            radio_nautilus.set_active(True)

        try :
            if config.getint('Nautilus', 'breadcrumbs') == 1 :
                radio_breadcrumbs = self.builder.get_object("DefaultBreadcrumbsButton")
                radio_breadcrumbs.set_active(True)
            elif config.getint('Nautilus', 'breadcrumbs') == 2 :
                radio_breadcrumbs = self.builder.get_object("UnifiedBreadcrumbsButton")
                radio_breadcrumbs.set_active(True)
        except configparser.Error :
            radio_breadcrumbs = self.builder.get_object("DefaultBreadcrumbsButton")
            radio_breadcrumbs.set_active(True)

        try :
            if config.getint('Menu', 'style') == 1 :
                radio_menu = self.builder.get_object("DefaultMenuItemButton")
                radio_menu.set_active(True)
            elif config.getint('Menu', 'style') == 2 :
                radio_menu = self.builder.get_object("SquaredMenuItemButton")
                radio_menu.set_active(True)
            elif config.getint('Menu', 'style') == 3 :
                radio_menu = self.builder.get_object("SimpleMenuItemButton")
                radio_menu.set_active(True)
            elif config.getint('Menu', 'style') == 4 :
                radio_menu = self.builder.get_object("DarkRoundMenuItemButton")
                radio_menu.set_active(True)
            elif config.getint('Menu', 'style') == 5 :
                radio_menu = self.builder.get_object("DarkSquaredMenuItemButton")
                radio_menu.set_active(True)
        except configparser.Error :
            radio_menu = self.builder.get_object("DarkRoundMenuItemButton")
            radio_menu.set_active(True)

        try :
            if config.getint('Panel', 'style') == 1 :
                radio_panel = self.builder.get_object("panelRadio1Light")
                radio_panel.set_active(True)
            elif config.getint('Panel', 'style') == 2 :
                radio_panel = self.builder.get_object("PanelRadio2Dark")
                radio_panel.set_active(True)
        except configparser.Error :
            radio_panel = self.builder.get_object("PanelRadio2Dark")
            radio_panel.set_active(True)

        try :
            if config.getboolean('Panel', 'flat') :
                check_panel = self.builder.get_object("PanelNoBgButton")
                check_panel.set_active(True)
            else :
                check_panel = self.builder.get_object("PanelNoBgButton")
                check_panel.set_active(False)
        except configparser.Error :
            check_panel = self.builder.get_object("PanelNoBgButton")
            check_panel.set_active(False)

        try :
            if config.getboolean('Fixes', 'midori') :
                check_midori = self.builder.get_object("OrtaMidoriButton")
                check_midori.set_active(True)
            else :
                check_midori = self.builder.get_object("OrtaMidoriButton")
                check_midori.set_active(False)
        except configparser.Error :
            check_midori = self.builder.get_object("OrtaMidoriButton")
            check_midori.set_active(False)

        try :
            if config.getboolean('Fixes', 'opera') :
                check_opera = self.builder.get_object("OrtaOperaButton")
                check_opera.set_active(True)
            else :
                check_opera = self.builder.get_object("OrtaOperaButton")
                check_opera.set_active(False)
        except configparser.Error :
            check_opera = self.builder.get_object("OrtaOperaButton")
            check_opera.set_active(False)

        try :
            if config.getboolean('Fixes', 'menu_button') :
                check_menu_button = self.builder.get_object("OrtaMenuButton")
                check_menu_button.set_active(True)
            else :
                check_menu_button = self.builder.get_object("OrtaMenuButton")
                check_menu_button.set_active(False)
        except configparser.Error :
            check_menu_button = self.builder.get_object("OrtaMenuButton")
            check_menu_button.set_active(False)

        try :
            if config.getboolean('Fixes', 'pixbuf_bug') :
                check_pixbuf = self.builder.get_object("OrtaLucidButton")
                check_pixbuf.set_active(True)
            else :
                check_pixbuf = self.builder.get_object("OrtaLucidButton")
                check_pixbuf.set_active(False)
        except configparser.Error :
            check_pixbuf = self.builder.get_object("OrtaLucidButton")
            check_pixbuf.set_active(False)

        try :
            if config.getboolean('Fixes', 'globalmenu') :
                check_globalmenu = self.builder.get_object("OrtaGlobalMenuButton")
                check_globalmenu.set_active(True)
            else :
                check_globalmenu = self.builder.get_object("OrtaGlobalMenuButton")
                check_globalmenu.set_active(False)
        except configparser.Error :
            check_globalmenu = self.builder.get_object("OrtaLucidButton")
            check_globalmenu.set_active(False)

        try :
            if config.getboolean('Fixes', 'nogtk_transparent_tabs') :
                check_trans_tabs = self.builder.get_object("AllowTransTabsButton")
                check_trans_tabs.set_active(True)
            else :
                check_trans_tabs = self.builder.get_object("AllowTransTabsButton")
                check_trans_tabs.set_active(False)
        except configparser.Error :
            check_trans_tabs = self.builder.get_object("AllowTransTabsButton")
            check_trans_tabs.set_active(False)

        try :
            if config.getboolean('Fixes', 'centered_title') :
                check_center_title = self.builder.get_object("CenterTitleButton")
                check_center_title.set_active(True)
            else :
                check_center_title = self.builder.get_object("CenterTitleButton")
                check_center_title.set_active(False)
        except configparser.Error :
            check_center_title = self.builder.get_object("CenterTitleButton")
            check_center_title.set_active(False)

        try :
            if config.getboolean('Fixes', 'nautilus_fix') :
                check_nautilus_fix = self.builder.get_object("NautilusFixButton")
                check_nautilus_fix.set_active(True)
            else :
                check_nautilus_fix = self.builder.get_object("NautilusFixButton")
                check_nautilus_fix.set_active(False)
        except configparser.Error :
            check_nautilus_fix = self.builder.get_object("NautilusFixButton")
            check_nautilus_fix.set_active(False)


#buttons callback methods

    def on_remove_old_toggled(self, widget, data=None):
        global remove_old
        if remove_old :
            remove_old = False
        else :
            remove_old = True

    def on_ensure_permissions_toggled(self, widget, data=None):
        global ensure_permissions
        if ensure_permissions :
            ensure_permissions = False
        else :
            ensure_permissions = True

    def on_install_squared_toggled(self, widget, data=None):
        global install_squared
        if install_squared :
            install_squared = False
        else :
            install_squared = True

    def on_install_old_toggled(self, widget, data=None):
        global install_old
        if install_old :
            install_old = False
        else :
            install_old = True

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
        if nogtk_gradient :
            nogtk_gradient = False
        else :
            nogtk_gradient = True

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
        if reverse_light_tabs :
            reverse_light_tabs = False
        else :
            reverse_light_tabs = True

    def on_smooth_nogtk_toggled(self, widget, data=None):
        global smooth_nogtk
        if smooth_nogtk :
            smooth_nogtk = False
        else :
            smooth_nogtk = True

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
        global breadcrumbs
        breadcrumbs = 1

    def on_unified_breadcrumbs_toggled(self, widget, data=None):
        global breadcrumbs
        breadcrumbs = 2

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
        install_for_all_dialog = self.builder.get_object("InstallForAllUsers")
        install_for_all_dialog.show()
        set_home()
        os.system("tar -xvf " + _curdir + "/Orta.tar.gz -C ~/.orta/gtk")
        os.system("tar -xvf " + _curdir + "/Orta-Old.tar.gz -C ~/.orta/gtk")
        os.system("tar -xvf " + _curdir + "/Orta-Squared.tar.gz -C ~/.orta/gtk")
        os.system("tar -xvf " + _curdir + "/Orta-Old-Squared.tar.gz -C ~/.orta/gtk")

#installs on /usr/share/themes
    def on_install_for_all_yes_clicked(self, widget, data=None):
        global install_squared
        global install_old
        global ensure_permissions
        global remove_old

        uninstall_all = uninstall(True, False)
        install_for_all = install(install_squared, install_old, ensure_permissions, True)

        install_for_all_dialog = self.builder.get_object("InstallForAllUsers")
        install_for_all_dialog.hide()

#check if the theme is actually installed
        if install_for_all :
            installation_dialog = self.builder.get_object("InstallationSucceededDialog")
            installation_dialog.show()
        else :
            installation_aborted_dialog = self.builder.get_object("InstallationAbortedDialog")
            installation_aborted_dialog.show()

#install on ~/.themes
    def on_install_for_all_no_clicked(self, widget, data=None):
        global install_squared
        global install_old
        global ensure_permissions
        global remove_old

        uninstall_local = uninstall(False, False)
        install_local = install(install_squared, install_old, ensure_permissions, False)

        install_for_all_dialog = self.builder.get_object("InstallForAllUsers")
        install_for_all_dialog.hide()

#check if the theme is actually installed
        if install_local :
            installation_dialog = self.builder.get_object("InstallationSucceededDialog")
            installation_dialog.show()
        else :
            installation_aborted_dialog = self.builder.get_object("InstallationAbortedDialog")
            installation_aborted_dialog.show()

    
#installation canceled
    def on_install_cancel_clicked(self, widget, data=None):
        install_for_all_dialog = self.builder.get_object("InstallForAllUsers")
        install_for_all_dialog.hide()
        installation_aborted_dialog = self.builder.get_object("InstallationAbortedDialog")
        installation_aborted_dialog.show()

#installation successful
    def on_installation_ok_clicked(self, widget, data=None):
        installation_dialog = self.builder.get_object("InstallationSucceededDialog")
        installation_dialog.hide()

#try to launch gnome-appearance-properties
        try :
            subprocess.Popen('gnome-appearance-properties')
        except Exception :
            no_gnome_dialog = self.builder.get_object("GnomeNotFoundDialog")
            no_gnome_dialog.show()

#installation aborted
    def on_installation_aborted_close_clicked(self, widget, data=None):
            installation_aborted_dialog = self.builder.get_object("InstallationAbortedDialog")
            installation_aborted_dialog.hide()

#uninstall
    def on_uninstall_clicked(self, widget, data=None):
        uninstall_remove_dialog = self.builder.get_object("UninstallRemoveFiles")
        uninstall_remove_dialog.show()

#remove everything
    def on_remove_files_yes(self, widget, data=None):
        uninstall_remove_dialog = self.builder.get_object("UninstallRemoveFiles")
        uninstall_remove_dialog.hide()

        uninstall_all = uninstall(True, True)

        if uninstall_all :
            uninstall_dialog = self.builder.get_object("UninstallCompletedDialog")
            uninstall_dialog.show()
        else :
            uninstall_failed = self.builder.get_object("UninstallFailed")
            uninstall_failed.show()
#remove theme only
    def on_remove_files_no(self, widget, data=None):
        uninstall_remove_dialog = self.builder.get_object("UninstallRemoveFiles")
        uninstall_remove_dialog.hide()

        uninstall_theme = uninstall(True, False)

        if uninstall_theme :
            uninstall_dialog = self.builder.get_object("UninstallCompletedDialog")
            uninstall_dialog.show()
        else :
            uninstall_failed = self.builder.get_object("UninstallFailed")
            uninstall_failed.show()

    def on_uninstall_failed_close(self, widget, data=None):
        uninstall_failed = self.builder.get_object("UninstallFailed")
        uninstall_failed.hide()

    def on_uninstall_cancel_clicked(self, widget, data=None):
        uninstall_remove_dialog = self.builder.get_object("UninstallRemoveFiles")
        uninstall_remove_dialog.hide()

    def on_uninstall_completed_close_clicked(self, widget, data=None):
        uninstall_dialog = self.builder.get_object("UninstallCompletedDialog")
        uninstall_dialog.hide()
        

#saves the new settings
    def on_save_clicked(self, widget, data=None):
#our settings
        settings = ''
        settings_rc = '/usr/share/themes/Orta/gtk-2.0/settings.rc'
        settings_rc_local = "~/.themes/Orta/gtk-2.0/settings.rc"
        settings_backup = '/usr/share/themes/Orta/gtk-2.0/~settings.rc'
        settings_backup_local = os.getenv('HOME')+'/.themes/Orta/gtk-2.0/~settings.rc'
        settings_rc_temp = os.getenv('HOME')+'/.orta/settings.rc'

        settings_error = False  
    
        all_users = 3
        all_users_backup = 3

#make sure the theme is installed. Priority is given to a local installation
#since in the case that the theme is installed both globally and locally the
#local version will be the one used in most cases.
        if os.path.isfile(settings_rc_local) :
            all_users = 1
        elif os.path.isfile(settings_rc) :
            all_users = 2

#check for a backup settings file
        if os.path.isfile(settings_backup_local) :
            all_users_backup = 1
        elif os.path.isfile(settings_backup) :
            all_users_backup = 2


        if all_users < 3 :

            if gradient_type == 1 :
                if globalmenu :
                    settings += 'include "Styles/Gradients/Globalmenu/default-globalmenu.rc"\n'
                else :
                    settings += 'include "Styles/Gradients/Globalmenu/default.rc"\n'

                if fix_menubar :
                    settings += 'include "Styles/Menubar/menubar-default-fix.rc"\n'
                else :
                    settings += 'include "Styles/Menubar/menubar-default.rc"\n'

                if nogtk_gradient :
                    settings += 'include "Styles/Gradients/No-Gtk/gradient-default.rc"\n'

                    if fix_menubar :
                        settings += 'include "Styles/Menubar/No-Gtk/menubar-default-fix.rc"\n'
                    else :
                        settings += 'include "Styles/Menubar/No-Gtk/menubar-default.rc"\n'

            elif gradient_type == 2 :
                if globalmenu :
                    settings += 'include "Styles/Gradients/Globalmenu/short-globalmenu.rc"\n'
                else :
                    settings += 'include "Styles/Gradients/Globalmenu/short.rc"\n'

                if fix_menubar :
                    settings += 'include "Styles/Menubar/menubar-short-fix.rc"\n'
                else :
                    settings += 'include "Styles/Menubar/menubar-short.rc"\n'

                if nogtk_gradient :
                    settings += 'include "Styles/Gradients/No-Gtk/gradient-short.rc"\n'

                    if fix_menubar :
                        settings += 'include "Styles/Menubar/No-Gtk/menubar-short-fix.rc"\n'
                    else :
                        settings += 'include "Styles/Menubar/No-Gtk/menubar-short.rc"\n'

            elif gradient_type == 3 :
                if globalmenu :
                    settings += 'include "Styles/Gradients/Globalmenu/none-globalmenu.rc"\n'
                else :
                    settings += 'include "Styles/Gradients/Globalmenu/none.rc"\n'

                if fix_menubar :
                    settings += 'include "Styles/Menubar/menubar-flat-fix.rc"\n'
                else :
                    settings += 'include "Styles/Menubar/menubar-flat.rc"\n'


            if (not nogtk_gradient) or (gradient_type == 3) :
                if fix_menubar :
                    settings += 'include "Styles/Menubar/No-Gtk/menubar-flat-fix.rc"\n'
                else :
                    settings += 'include "Styles/Menubar/No-Gtk/menubar-flat.rc"\n'

            if tabs < 4 :
                if gradient_type == 1 :
                    settings += 'include "Styles/Notebook/notebook-default.rc"\n'
                elif gradient_type == 2 :
                    settings += 'include "Styles/Notebook/notebook-short.rc"\n'
                else :
                    settings += 'include "Styles/Notebook/notebook-flat.rc"\n'
            else :
                if gradient_type == 1 :
                    settings += 'include "Styles/Notebook/notebook-smooth-default.rc"\n'
                elif gradient_type == 2 :
                    settings += 'include "Styles/Notebook/notebook-smooth-short.rc"\n'
                else :
                    settings += 'include "Styles/Notebook/notebook-smooth-flat.rc"\n'
            
            if tabs == 1 :
                settings += 'include "Styles/Tabs/tabs-default.rc"\n'
            elif tabs == 2 :
                settings += 'include "Styles/Tabs/tabs-squared.rc"\n'
            elif tabs == 3 :
                if reverse_light_tabs :
                    settings += 'include "Styles/Tabs/tabs-light-reversed.rc"\n'
                else :
                    settings += 'include "Styles/Tabs/tabs-light.rc"\n'
            if tabs == 4 :
                if gradient_type == 3 :
                    settings += 'include "Styles/Tabs/tabs-smooth-flat.rc"\n'
                else : 
                    settings += 'include "Styles/Tabs/tabs-smooth.rc"\n'

            if tabs == 5 :
                if gradient_type == 3 :
                    settings += 'include "Styles/Tabs/tabs-smooth-dark-flat.rc"\n'
                else :
                    settings += 'include "Styles/Tabs/tabs-smooth-dark.rc"\n'


            if trans_tabs :
                if not smooth_nogtk :
                    settings += 'include "Styles/Notebook/No-Gtk/nogtk-flat.rc"\n'

                    if reverse_light_tabs :
                        settings += 'include "Styles/Tabs/No-Gtk/Transparent/tabs-light-reversed.rc"\n'
                    else :
                        settings += 'include "Styles/Tabs/No-Gtk/Transparent/tabs-light.rc"\n'

                else :
                    settings += 'include "Styles/Notebook/No-Gtk/nogtk-smooth-flat.rc"\n'
                    settings += 'include "Styles/Notebook/notebook-mozilla.rc"\n'
                    settings += 'include "Styles/Tabs/No-Gtk/Transparent/tabs-smooth.rc"\n'

            else :
                if not smooth_nogtk :
                    if reverse_light_tabs :
                        settings += 'include "Styles/Tabs/No-Gtk/tabs-light-reversed.rc"\n'
                        settings += 'include "Styles/Tabs/Mozilla/tabs-light-reversed.rc"\n'
                    else :
                        settings += 'include "Styles/Tabs/No-Gtk/tabs-light.rc"\n'
                        settings += 'include "Styles/Tabs/Mozilla/tabs-light.rc"\n'
                else :
                    settings += 'include "Styles/Tabs/No-Gtk/tabs-smooth.rc"\n'
                    settings += 'include "Styles/Notebook/notebook-mozilla.rc"\n'
                    settings += 'include "Styles/Tabs/Mozilla/tabs-smooth-flat.rc"\n'

            if scrollbars == 1 :
                settings += 'include "Styles/Sliders/scrollbars-thin.rc"\n'
            elif scrollbars == 2 :
                settings += 'include "Styles/Sliders/scrollbars-default.rc"\n'
            elif scrollbars == 3 :
                settings += 'include "Styles/Sliders/scrollbars-wide.rc"\n'
            elif scrollbars == 4 :
                settings += 'include "Styles/Sliders/scrollbars-wider.rc"\n'
            elif scrollbars == 5 :
                settings += 'include "Styles/Sliders/scrollbars-widest.rc"\n'

            if nautilus == 2 :
                if nautilus_fix :
                    settings += 'include "Styles/Nautilus/nautilus-with-menubar-solid.rc"\n'
                else :
                    settings += 'include "Styles/Nautilus/nautilus-with-menubar.rc"\n'

                if fix_menubar :
                    settings += 'include "Styles/Nautilus/nautilus-menubar-fix.rc"\n'
                else :
                    settings += 'include "Styles/Nautilus/nautilus-menubar.rc"\n'

            elif nautilus == 3 :
                if nautilus_fix :
                    settings += 'include "Styles/Nautilus/nautilus-without-menubar-solid.rc"\n'
                else :
                    settings += 'include "Styles/Nautilus/nautilus-without-menubar.rc"\n'

            if nautilus > 1 :
                if breadcrumbs ==1 :
                    settings += 'include "Styles/Nautilus/breadcrumbs-default.rc"\n'
                else :
                    settings += 'include "Styles/Nautilus/breadcrumbs-unified.rc"\n'

            if menu_item < 4 :
                if opera :
                    settings += 'include "Styles/Menu/opera-menu.rc"\n'
                else :
                    settings += 'include "Styles/Menu/menu.rc"\n'
            else :
                if opera :
                    settings += 'include "Styles/Menu/opera-menu-dark.rc"\n'
                else :
                    settings += 'include "Styles/Menu/menu-dark.rc"\n'

            if menu_item == 1 :
                    settings += 'include "Styles/Menu-Item/menu-item-default.rc"\n'
            if menu_item == 2 :
                    settings += 'include "Styles/Menu-Item/menu-item-squared.rc"\n'
            if menu_item == 3 :
                    settings += 'include "Styles/Menu-Item/menu-item-simple.rc"\n'
            if menu_item == 4 :
                    settings += 'include "Styles/Menu-Item/menu-item-dark-round.rc"\n'
            if menu_item == 5 :
                    settings += 'include "Styles/Menu-Item/menu-item-dark-squared.rc"\n'

            if panel == 1 :
                if flat_panel :
                    settings += 'include "Styles/Panel/panel-light-flat.rc"\n'
                else :
                    settings += 'include "Styles/Panel/panel-light-default.rc"\n'

            elif panel == 2 :
                if flat_panel :
                    settings += 'include "Styles/Panel/panel-dark-flat.rc"\n'
                else :
                    settings += 'include "Styles/Panel/panel-dark-default.rc"\n'

            if expanders == 2 :
                settings += 'include "Styles/Expanders/arrow.rc"\n'
            elif expanders == 3 :
                settings += 'include "Styles/Expanders/simple.rc"\n'
            elif expanders == 4 :
                settings += 'include "Styles/Expanders/light.rc"\n'
            elif expanders == 5 :
                settings += 'include "Styles/Expanders/dark.rc"\n'

            if midori :
                if reverse_light_tabs :
                    settings += 'include "Styles/Tabs/Midori/tabs-light-reversed.rc"\n'
                else :
                    settings += 'include "Styles/Tabs/Midori/tabs-light.rc"\n'

#tries to write the new settings into a temporary file                  
            try :               
                settings_file = open(settings_rc_temp, 'wt')
                settings_file.write(settings)
                settings_file.close()
            except Exception :
                settings_error = True


            if settings_error :
                error_dialog = self.builder.get_object("WriteErrorDialog")
                error_dialog.show()
#if there was no error          
            else :
#save the new settings to ini
                save = config_save
                save(self, _configpath, gradient_type, nogtk_gradient, tabs, reverse_light_tabs, smooth_nogtk, expanders, scrollbars, nautilus, breadcrumbs, menu_item, panel, flat_panel, midori, opera, remove_menu, fix_menubar, globalmenu, trans_tabs, center_title, nautilus_fix)

                if all_users == 1 :
#backup the old settings file
                    os.system('mv ' + settings_rc_local + ' ' + settings_backup_local)
#copy the new settings file
                    os.system('cp -f -T ' + settings_rc_temp + ' ' + settings_rc_local)

#select the right index.theme file for the panel color
#and the menu button preferences
                    if panel == 1 :
                        if remove_menu :
                            os.system("cp -f ~/.orta/panel/light/nomenu/index.theme ~/.themes/Orta/")
                        else :
                            os.system("cp -f ~/.orta/panel/light/index.theme ~/.themes/Orta/")
                    elif panel == 2 :
                        if remove_menu :
                            os.system("cp -f ~/.orta/panel/dark/nomenu/index.theme ~/.themes/Orta/")
                        else :
                            os.system("cp -f ~/.orta/panel/dark/index.theme ~/.themes/Orta/")
                    if center_title :
                        os.system("cp -f ~/.orta/metacity/round/center/metacity-theme-1.xml ~/.themes/Orta/metacity-1")
                        if os.path.isdir("~/.themes/Orta-Squared") :
                            os.system("cp -f ~/.orta/metacity/squared/center/metacity-theme-1.xml ~/.themes/Orta-Squared/metacity-1")
                    else :
                        os.system("cp -f ~/.orta/metacity/round/left/metacity-theme-1.xml ~/.themes/Orta/metacity-1")
                        if os.path.isdir("~/.themes/Orta-Squared") :
                            os.system("cp -f ~/.orta/metacity/squared/left/metacity-theme-1.xml ~/.themes/Orta-Squared/metacity-1")

                elif all_users == 2 :
                    os.system("gksu 'mv " + settings_rc + " "  + settings_backup + "'")
                    os.system("gksu 'cp -f -T " + settings_rc_temp + " " + settings_rc + "'")

                    if panel == 1 :
                        if remove_menu :
                            os.system("gksu 'cp -f ~/.orta/panel/light/nomenu/index.theme /usr/share/themes/Orta/'")
                        else :
                            os.system("gksu 'cp -f ~/.orta/panel/light/index.theme /usr/share/themes/Orta/'")
                    elif panel == 2 :
                        if remove_menu :
                            os.system("gksu 'cp -f ~/.orta/panel/dark/nomenu/index.theme /usr/share/themes/Orta/'")
                        else :
                            os.system("gksu 'cp -f ~/.orta/panel/dark/index.theme /usr/share/themes/Orta/'")

                    if center_title :
                        os.system("gksu 'cp -f ~/.orta/metacity/round/center/metacity-theme-1.xml /usr/share/themes/Orta/metacity-1'")
                        if os.path.isdir("/usr/share/themes/Orta-Squared") :
                            os.system("gksu 'cp -f ~/.orta/metacity/squared/center/metacity-theme-1.xml /usr/share/themes/Orta-Squared/metacity-1'")
                    else :
                        os.system("gksu 'cp -f ~/.orta/metacity/round/left/metacity-theme-1.xml /usr/share/themes/Orta/metacity-1'")
                        if os.path.isdir("/usr/share/themes/Orta-Squared") :
                            os.system("gksu 'cp -f ~/.orta/metacity/squared/left/metacity-theme-1.xml /usr/share/themes/Orta-Squared/metacity-1'")


            save_dialog = self.builder.get_object("SettingsSavedDialog")
            save_dialog.show()

        else :
            if all_users_backup == 1 :
                os.system('cp -f ' + settings_backup_local + ' ' + settings_rc_local)
                settings_restored_dialog = self.builder.get_object("SettingsRestoredDialog")
                settings_restored_dialog.show()
            elif all_users_backup == 2 :
                os.system("gksu 'cp -f " + settings_backup + " "  + settings_rc + "'")
                settings_restored_dialog = self.builder.get_object("SettingsRestoredDialog")
                settings_restored_dialog.show()
            else :
                warning_dialog = self.builder.get_object("OrtaNotInstalledDialog")
                warning_dialog.show()

    def on_settings_restore_close_clicked(self, widget, data=None):
        settings_restored_dialog = self.builder.get_object("SettingsRestoredDialog")
        settings_restored_dialog.hide()
        
    def on_error_dialog_close_clicked(self, widget, data=None):
        error_dialog = self.builder.get_object("WriteErrorDialog")
        error_dialog.hide()
    
    def on_settings_saved_ok_clicked(self, widget, data=None):
        save_dialog = self.builder.get_object("SettingsSavedDialog")
        save_dialog.hide()
        try :
            os.system("killall gnome-appearance-properties")
            subprocess.Popen('gnome-appearance-properties')
        except Exception :
            no_gnome_dialog = self.builder.get_object("GnomeNotFoundDialog")
            no_gnome_dialog.show()

#restore default settings
    def on_defaults_clicked(self, widget, data=None):

        radio_default_gradient = self.builder.get_object("DefaultGradientButton")
        radio_default_gradient.set_active(True)

        check_nogtk_gradient = self.builder.get_object("NoGtkGradientButton")
        if check_nogtk_gradient.get_active() :
            check_nogtk_gradient.set_active(False)

        radio_tabs = self.builder.get_object("tabsRadio1Default")
        radio_tabs.set_active(True)

        check_reverse_tabs = self.builder.get_object("ReversedLightTabsButton")
        if check_reverse_tabs.get_active() :
            check_reverse_tabs.set_active(False)

        check_light_tabs = self.builder.get_object("UseSmoothNoGtkButton")
        if check_light_tabs.get_active() :
            check_light_tabs.set_active(False)

        radio_expanders = self.builder.get_object("DefaultExpanderButton")
        radio_expanders.set_active(True)

        radio_scrollbars = self.builder.get_object("scrollbarsRadio1Normal")
        radio_scrollbars.set_active(True)

        radio_menu_item = self.builder.get_object("DefaultMenuItemButton")
        radio_menu_item.set_active(True)

        radio_nautilus = self.builder.get_object("nautilusRadio1Default")
        radio_nautilus.set_active(True)

        radio_breadcrumbs = self.builder.get_object("DefaultBreadcrumbsButton")
        radio_breadcrumbs.set_active(True)

        radio_panel = self.builder.get_object("panelRadio1Light")
        radio_panel.set_active(True)

        check_flat_panel = self.builder.get_object("PanelNoBgButton")
        if check_flat_panel.get_active() :
            check_flat_panel.set_active(False)

        check_midori = self.builder.get_object("OrtaMidoriButton")
        if check_midori.get_active() :
            check_midori.set_active(False)

        check_opera = self.builder.get_object("OrtaOperaButton")
        if check_opera.get_active() :
            check_opera.set_active(False)

        check_remove_menu = self.builder.get_object("OrtaMenuButton")
        if check_remove_menu.get_active() :
            check_remove_menu.set_active(False)
        
        check_fix_menubar = self.builder.get_object("OrtaLucidButton")
        if check_fix_menubar.get_active() :
            check_fix_menubar.set_active(False)

        check_globalmenu = self.builder.get_object("OrtaGlobalMenuButton")
        if check_globalmenu.get_active() :
            check_globalmenu.set_active(False)

        check_tabs_trans = self.builder.get_object("AllowTransTabsButton")
        if check_tabs_trans.get_active() :
            check_tabs_trans.set_active(False)

        check_center_title = self.builder.get_object("CenterTitleButton")
        if check_center_title.get_active() :
            check_center_title.set_active(False)

        check_nautilus_fix = self.builder.get_object("NautilusFixButton")
        if check_nautilus_fix.get_active() :
            check_nautilus_fix.set_active(False)

    def on_mainWindow_destroy(self, widget, data=None):
        gtk.main_quit()
    
    def on_quit_clicked(self, widget, data=None):
        gtk.main_quit()

    def on_warning_ok_clicked(self, widget, data=None):
        warning_dialog = self.builder.get_object("OrtaNotInstalledDialog")
        warning_dialog.hide()
    
    def __init__(self):
        self.builder = gtk.Builder()
        self.builder.add_from_file(os.path.join(_curdir, "orta/OrtaSettingsManager.ui"))
        self.builder.connect_signals(self)
        self.window = self.builder.get_object("mainWindow")
        self.window.show()
    
    def main_loop(self):
        gtk.main()
        return 0

def main():
    settings_manager = OrtaSettingsManager()
    set_home()
    if not os.path.isfile(_configpath) :
        settings_manager.config_create(_configpath)
    settings_manager.config_restore(_configpath)
    settings_manager.main_loop()
    
if __name__ == "__main__":
    main()

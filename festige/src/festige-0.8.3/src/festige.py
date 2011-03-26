#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Set Version
VERSION = "0.8.3"

# Imports
import os, signal, sys
from commands import getoutput
from functools import partial
from time import sleep
from PyQt4.QtCore import QFileInfo, QLocale, QProcess, QTimer, QThread, QTranslator, Qt, SIGNAL
from PyQt4.QtGui import QApplication, QCursor, QDialog, QDialogButtonBox, QFileDialog
from PyQt4.QtGui import QIcon, QMainWindow, QMenu, QMessageBox, QPixmap, QSplashScreen, QTableWidgetItem

# Load Resources
import icons_rc, ui_mainw, ui_settingsw

# Find fst binary
if (os.path.exists(sys.path[0]+"/../fst/fst.exe")):
  fst_exe = sys.path[0]+"/../fst/fst.exe"
  fstinfo_exe = sys.path[0]+"/../fst/fstinfo.exe"
elif (os.path.exists(sys.path[0]+"/fst/fst.exe")):
  fst_exe = sys.path[0]+"/fst/fst.exe"
  fstinfo_exe = sys.path[0]+"/fst/fstinfo.exe"
else:
  print "Error: Could not find fst binary!"
  exit(-1)

# Find Translations path
if (os.path.exists(sys.path[0]+"/lang/")):
  trans_path = sys.path[0]+"/lang/"
elif (os.path.exists(sys.path[0]+"/src/lang/")):
  trans_path = sys.path[0]+"/src/lang/"
else:
  trans_path = ""

# Connect to Jack, if possible
try:
  import jack
  haveJack = True
  try:
    jack.attach("FeSTige")
    jackIsGood = True
  except:
    jackIsGood = False
except:
  haveJack = False
  jackIsGood = False

# Connect to ladish, if possible
try:
  import dbus
  bus = dbus.SessionBus()
  studioBus = bus.get_object("org.ladish", "/org/ladish/Studio")
  appBus = dbus.Interface(studioBus, 'org.ladish.AppSupervisor')
  haveLadish = True
except:
  haveLadish = False


# Set Global Variables
global Utility, ExtraVstPath, WinePrefix, LadishFolder
global pref_cout, pref_cin, pref_cin_name, pref_wineServ, pref_showWarn
global pref_wineRT, pref_wineRTv, pref_wineSVRT, pref_wineSVRTv, pref_chrt, pref_args

# Lockless GUI
global timer_info
timer_info = [ "", "", False ]


# Parse Configuration Info
def parseConfigFile(fileRead, info, boolean=False):
  for i in range(len(fileRead)):
    if (info in fileRead[i]):
      if (boolean):
        ans = fileRead[i].replace(info, "")
        if (ans == "yes"):
          return True
        else:
          return False
      else:
        return fileRead[i].replace(info, "")

  print "Error while loading settings!\n" \
        "Please delete the festige folder in your home dir, and restart"
  sys.exit(-1)


# Read FeSTige settings
def readSettings():
  global Utility, ExtraVstPath, WinePrefix, LadishFolder
  global pref_cout, pref_cin, pref_cin_name, pref_wineServ, pref_showWarn
  global pref_wineRT, pref_wineRTv, pref_wineSVRT, pref_wineSVRTv, pref_chrt, pref_args
  fileCFG = os.getenv("HOME")+"/.festige/festige.cfg"
  if (os.path.exists(fileCFG)):
    fileRead = open(fileCFG).read().split("\n")
    Utility = parseConfigFile(fileRead, "Utility = ")
    ExtraVstPath = parseConfigFile(fileRead, "VST PATH = ").split(":")
    WinePrefix = parseConfigFile(fileRead, "WinePrefix = ")
    LadishFolder = parseConfigFile(fileRead, "Ladish PATH = ")
    pref_cout = parseConfigFile(fileRead, "Connect to output = ", True)
    pref_cin = parseConfigFile(fileRead, "Connect to input = ", True)
    pref_cin_name = parseConfigFile(fileRead, "Name to Connect input = ")
    pref_wineServ = parseConfigFile(fileRead, "Run <wineserver -p> = ", True)
    pref_showWarn = parseConfigFile(fileRead, "Show Warnings = ", True)
    pref_wineRT = parseConfigFile(fileRead, "WineRT enabled = ", True)
    pref_wineRTv = int(parseConfigFile(fileRead, "WineRT priority = "))
    pref_wineSVRT = parseConfigFile(fileRead, "WineSVRT enabled = ", True)
    pref_wineSVRTv = int(parseConfigFile(fileRead, "WineSVRT priority = "))
    pref_chrt = parseConfigFile(fileRead, "CHRT enabled = ", True)
    pref_args = parseConfigFile(fileRead, "Extra args = $")
  else:
    # Default Settings
    Utility = "fst"
    ExtraVstPath = []
    WinePrefix = ".wine"
    LadishFolder = os.getenv("HOME")+"/.festige"
    pref_cout = False
    pref_cin  = False
    pref_cin_name = ""
    pref_wineServ = False
    pref_showWarn = True
    pref_wineRT   = True
    pref_wineRTv  = 15
    pref_wineSVRT = True
    pref_wineSVRTv = 10
    pref_chrt = False
    pref_args = ""


# Return the final command to run
def getFinalLaunchArgs(plugin, folder="", short_name=""):
  cmd = ""
  if (pref_chrt): cmd += "chrt -f -p 1 "

  cmd += "env "
  if (Utility == "vsthost"): cmd += "VST_PATH='"+folder+"' "
  if (pref_wineRT): cmd += "WINE_RT="+str(pref_wineRTv)+" "
  if (pref_wineSVRT): cmd += "WINE_SRV_RT="+str(pref_wineSVRTv)+" "

  cmd += "WINEPREFIX="+os.getenv("HOME")+"/"+WinePrefix+" "

  if (Utility == "fst"):
    cmd += fst_exe+" '"
    cmd += LadishFolder+"/"+short_name+"' '"+plugin+"'"
  else:
    cmd += "vsthost "+plugin

  if (pref_args):
    cmd += " "+pref_args

  return cmd


# Main Window
class FeSTigeMainW(QMainWindow, ui_mainw.Ui_MainW):
    def __init__(self, *args):
        QMainWindow.__init__(self, *args)
        self.setupUi(self)
        self.setWindowIcon(QIcon(":/icons/logo.png"))

        # Global Variables
        self.customSorted = False

        # Internal Timer, for lockless GUI
        self.infoTimer = QTimer()
        self.infoTimer.setInterval(100)
        self.infoTimer.start()

        # Pre-Setup GUI
        self.act_launch.setEnabled(False)
        self.act_ladish.setEnabled(False)
        self.act_info.setEnabled(False)
        self.act_delete.setEnabled(False)
        self.b_launch.setEnabled(False)
        self.b_ladish.setEnabled(False)
        self.b_info.setEnabled(False)
        self.b_delete.setEnabled(False)
        self.b_copy.setEnabled(False)
        self.b_copy.setText("") #PyQt4 Bug
        self.listVST.setColumnWidth(0, name_cw)
        self.listVST.setColumnWidth(1, folder_cw)
        self.listVST.setContextMenuPolicy(Qt.CustomContextMenu)

        # Connect actions to functions
        self.connect(self.act_open, SIGNAL("triggered()"), self.func_open)
        self.connect(self.act_launch, SIGNAL("triggered()"), self.func_launch)
        self.connect(self.act_ladish, SIGNAL("triggered()"), self.func_ladish)
        self.connect(self.act_info, SIGNAL("triggered()"), self.func_info)
        self.connect(self.act_delete, SIGNAL("triggered()"), self.func_delete)
        self.connect(self.act_refresh, SIGNAL("triggered()"), self.refreshPluginList)
        self.connect(self.act_pref, SIGNAL("triggered()"), self.func_Settings)
        self.connect(self.act_about, SIGNAL("triggered()"), self.func_About)
        self.connect(self.b_launch, SIGNAL("clicked()"), self.func_launch)
        self.connect(self.b_ladish, SIGNAL("clicked()"), self.func_ladish)
        self.connect(self.b_info, SIGNAL("clicked()"), self.func_info)
        self.connect(self.b_delete, SIGNAL("clicked()"), self.func_delete)
        self.connect(self.b_copy, SIGNAL("clicked()"), self.func_copy)
        self.connect(self.b_refresh, SIGNAL("clicked()"), self.refreshPluginList)
        self.connect(self.listVST, SIGNAL("currentCellChanged(int, int, int, int)"), self.checkActions)
        self.connect(self.listVST, SIGNAL("cellDoubleClicked(int, int)"), self.doubleClickedList)
        self.connect(self.listVST, SIGNAL("customContextMenuRequested(QPoint)"), self.showCustomMenu)
        self.connect(self.line_cmd, SIGNAL("textChanged(QString)"), self.updateToolTip)
        self.connect(self.infoTimer, SIGNAL("timeout()"), self.checkInfoTimer)

        # Show Warnings, if enabled
        if (pref_showWarn):
          if not haveJack:
            QMessageBox.warning(self, "FeSTige", self.tr(""
            "%1PyJack is not available.%2You'll not be able to auto-connect.%3").arg("<div align=center>").arg("<br>").arg("</div>"))
          elif haveJack and not jackIsGood:
            QMessageBox.critical(self, "FeSTige", self.tr(""
            "%1Jack is not active.%2You'll not be able to start any VST.%3").arg("<div align=center>").arg("<br>").arg("</div>"))

        # Search for plugins
        self.refreshPluginList()

        # WineServer Hack
        if (pref_wineServ):
          splash.showMessage(self.tr("Loading WineServer..."))
          os.system("wineserver -p")

        # Stop Splash Screen
        splash.clearMessage()
        splash.close()


    def func_open(self):
        fileLocation = QFileDialog.getOpenFileName(self, self.tr("Open Windows VST Plugin"), "", self.tr(""
                                                   "Windows VST Plugins%1").arg(" (*dll *DLL *Dll)"))
        if not fileLocation.isEmpty():
          small = QFileInfo(fileLocation)
          mini  = small.fileName()
          if (Utility == "fst"):
            plugin = str(fileLocation)
            folder = ""
            short_name = mini.replace(".dll", "").replace(".DLL", "").replace(".Dll", "")
          else:
            plugin = mini.replace(" ","*")
            folderX = fileLocation.split("/")[0:-1]
            for x in range(len(folderX)):
              folder += folderX[x]+"/"
            short_name = ""

          os.system(getFinalLaunchArgs(plugin, folder, short_name)+" &")

    def func_exit(self):
        # Write down Window Properties
        file_prop = ("# FeSTige Window Properties\n"
                     "Width = "+str(self.width())+"\n"
                     "Height = "+str(self.height())+"\n"
                     "Name Column Width = "+str(self.listVST.columnWidth(0))+"\n"
                     "Folder Column Width = "+str(self.listVST.columnWidth(1))+"\n")
        f = open(os.getenv("HOME")+"/.festige/festigerc", "w")
        f.write(file_prop)
        f.close()

        # Disconnect from Jack
        jack.detach()

        # Kill all fst/vsthost processes ?
        procs = getoutput("ps -e").split()
        if ("fst" in procs or "fst.exe" in procs or "fst.exe.so" in procs or "vsthost" in procs):
            ask = QMessageBox.question(self, self.tr("Quit fst/dssi-vst too?"), self.tr(""
                              "Do you also want to close all plugin instances too?"), QMessageBox.Yes | QMessageBox.No)
            if (ask == QMessageBox.Yes):
                proc = QProcess()
                proc.start("killall", [ "fst", "fst.exe", "fst.exe.so", "fstinfo.exe", "fstinfo.exe.so", "vsthost"])
                #proc.start("killall", [ "-KILL", "fst", "fst.exe", "fst.exe.so", "fstinfo.exe", "fstinfo.exe.so", "vsthost"])

        sys.exit(0)

    def func_launch(self):
        cmd = str(self.line_cmd.text())
        if (cmd): os.system(cmd+" &")

        if (Utility == "fst"):
          if (pref_cout): self.func_connectSynth(str(self.listVST.item(self.listVST.currentRow(), 0).text()))
          if (pref_cin): self.func_connectMIDI(str(self.listVST.item(self.listVST.currentRow(), 0).text()))

    def func_ladish(self):
        if (Utility == "fst"):
          level = 1
        else:
          level = 0

        cmd = str(self.line_cmd.text())
        name = str(self.listVST.item(self.listVST.currentRow(), 0).text())
        if (cmd): appBus.RunCustom(False, cmd, name, level)

    def func_info(self):
        plugin = self.listVST.item(self.listVST.currentRow(), 0).text()
        command = "env WINEDEBUG=-all "+fstinfo_exe+" '"+str(self.listVST.item(self.listVST.currentRow(), 0).toolTip())+"'"
        self.statusBar.showMessage(self.tr("Getting info from plugin '%1'...").arg(plugin))

        # Use a new Thread to get the info, so the GUI doesn't lock
        thread = GetVSTInfo()
        thread._command = command
        thread._plugin = plugin
        thread.start()
        thread.exec_()

    def func_delete(self):
        ask = QMessageBox.question(self, self.tr("Delete?"), self.tr(""
                          "Are you sure you want to delete plugin '%1' ?%2(It will NOT be available in the trash!)%3"
                          "").arg(self.listVST.item(self.listVST.currentRow(), 0).text()).arg("<br><i>").arg("</i>"),
                          QMessageBox.Yes | QMessageBox.No)
        if (ask == QMessageBox.Yes):
            plugin = str(self.listVST.item(self.listVST.currentRow(), 0).toolTip())
            if (os.path.exists(plugin)):
              try:
                os.remove(plugin)
                self.refreshPluginList()
              except:
                QMessageBox.warning(self, self.tr("Warning"), self.tr(""
                "Could not delete selected plugin..."))
            else:
              QMessageBox.critical(self, self.tr("Error"), self.tr(""
              "Could not find the selected plugin..."))

    def func_copy(self):
        clipboard = app.clipboard()
        clipboard.setText(self.line_cmd.text())

    def func_Settings(self):
        ret = FestigeSettingsW().exec_()
        if (ret): self.refreshPluginList()

    def func_About(self):
        QMessageBox.about(self, "Festige v"+VERSION, self.tr(""
        "<b>FeSTige</b> is a GUI for 'fst' and 'dssi-vst',<br>"
        "allowing you to run Windows VST plugins on Linux.<p>"
        "FeSTige is being developed by falkTX,<br>"
        "and it's released under the terms of the GNU GPL v2 or superior."))


    def checkActions(self, currentRow, currentColumn, previousRow, previousColumn):
        if (currentRow >= 0):
          state = True
        else:
          state = False

        self.act_launch.setEnabled(state)
        self.act_info.setEnabled(state)
        self.act_delete.setEnabled(state)
        self.b_launch.setEnabled(state)
        self.b_info.setEnabled(state)
        self.b_delete.setEnabled(state)
        self.b_copy.setEnabled(state)
        if (haveLadish): self.act_ladish.setEnabled(state)
        if (haveLadish): self.b_ladish.setEnabled(state)

        if (currentRow >= 0):
          name = str(self.listVST.item(currentRow, 0).text())
          folder = str(self.listVST.item(currentRow, 1).text())
          tooltip = str(self.listVST.item(currentRow, 0).toolTip())

          if (Utility == "fst"):
            plugin = tooltip
          else:
            plugin = str(self.listVST.item(currentRow, 0).text()+".dll").replace(" ","*")

          cmd = getFinalLaunchArgs(plugin, folder, name)
          cmd_splitted = ""
          for i in range(len(cmd.split())):
            cmd_splitted += cmd.split()[i]+" "
            if (i and i % 4 == 0 and i != len(cmd.split())-1): cmd_splitted += "\n"
          self.line_cmd.setText(cmd)
          self.line_cmd.setToolTip(cmd_splitted)
          self.statusBar.showMessage(tooltip)
        else:
          self.line_cmd.setText("")
          self.line_cmd.setToolTip("")
          self.statusBar.showMessage("")

    def doubleClickedList(self, row, column):
        if (row >= 0):
          self.func_launch()

    def refreshPluginList(self):
        VST_PATH = []
        print "\nDoing Referesh Now..."

        # Disable sorting while changing content (Qt Bug ?)
        self.listVST.setSortingEnabled(False)

        # Remove Old Stuff
        self.listVST.clearContents()
        for i in range(self.listVST.rowCount()):
          self.listVST.removeRow(0)

        # Get More folders
        homeDir = os.getenv("HOME")
        extraHomePaths = [ "/vst", "/.vst", "/vst-linux",
                       "/"+WinePrefix+"/drive_c/Program Files/VstPlugins/",
                       "/"+WinePrefix+"/drive_c/Program Files/Steinberg/VstPlugins/",
                       "/"+WinePrefix+"/drive_c/Programas/VstPlugins/",
                       "/"+WinePrefix+"/drive_c/Programas/Steinberg/VstPlugins/" ]
        extraSysPaths = [ "/usr/local/lib/vst/", "/usr/lib/vst/", "/usr/lib32/vst/" ]

        if os.getenv("VST_PATH"):
            VST_PATH = os.getenv("VST_PATH").split(":")
            print "VST_PATH is set to:", VST_PATH

        # Check if they exist
        for i in range(len(extraHomePaths)):
            if (os.path.exists(homeDir+extraHomePaths[i]) and not (homeDir+extraHomePaths[i]) in VST_PATH):
                VST_PATH.append(homeDir+extraHomePaths[i])

        for j in range(len(extraSysPaths)):
            if (os.path.exists(extraSysPaths[j]) and not extraSysPaths[j] in VST_PATH and not extraSysPaths[j].split("/")[0:-1] in VST_PATH):
                VST_PATH.append(extraSysPaths[j])

        for m in range(len(ExtraVstPath)):
            if (os.path.exists(ExtraVstPath[m]) and not ExtraVstPath[m] in VST_PATH and not ExtraVstPath[m].split("/")[0:-1] in VST_PATH):
                VST_PATH.append(ExtraVstPath[m])

        # Add plugins to the list
        listOfAddedDLLs = []
        lastpos = 0
        for k in range(len(VST_PATH)):
            if(os.path.exists(VST_PATH[k])):
              print "Searching in", VST_PATH[k]
              splash.showMessage("Searching in "+VST_PATH[k])
              newList = getoutput("find '"+VST_PATH[k]+"' -name *.dll").split("\n")
              for l in range(len(newList)):
                if (newList[l]):
                  if not newList[l] in listOfAddedDLLs:
                      listOfAddedDLLs.append(newList[l])
                      folder = ""
                      folderX = newList[l].split("/")[0:-1]
                      for x in range(len(folderX)):
                        folder += folderX[x]+"/"
                      tw_name   = QTableWidgetItem(newList[l].split("/")[-1].split(".dll")[0])
                      tw_folder = QTableWidgetItem(folder)
                      self.listVST.insertRow(lastpos)
                      self.listVST.setItem(lastpos, 0, tw_name)
                      self.listVST.setItem(lastpos, 1, tw_folder)
                      self.listVST.item(lastpos, 0).setStatusTip(newList[l])
                      self.listVST.item(lastpos, 0).setToolTip(newList[l])
                      lastpos += 1
        print "Search finished"

        # Re-Enable Sorting Back again
        self.listVST.setSortingEnabled(True)

        # Sort by folder, then name
        if (not self.customSorted):
          self.listVST.sortByColumn(0, Qt.AscendingOrder)
          self.listVST.sortByColumn(1, Qt.AscendingOrder)

        # Auto-Select first plugin, if there are any
        if (self.listVST.rowCount() > 0):
          self.listVST.setCurrentCell(0, 0)

    def updateToolTip(self, text):
        if (text.isEmpty()):
          self.line_cmd.setToolTip("")
          self.act_launch.setEnabled(False)
          self.act_ladish.setEnabled(False)
          self.b_launch.setEnabled(False)
          self.b_ladish.setEnabled(False)
        elif (self.listVST.rowCount() > 0):
          cmd_splitted = ""
          for i in range(len(text.split(" "))):
            cmd_splitted += text.split(" ")[i]+" "
            if (i and i % 4 == 0 and i != len(text.split(" "))-1): cmd_splitted += "\n"
          self.line_cmd.setToolTip(cmd_splitted)
          self.act_launch.setEnabled(True)
          self.act_ladish.setEnabled(True)
          self.b_launch.setEnabled(True)
          self.b_ladish.setEnabled(True)

    def showCustomMenu(self, pos):
        # Create Menu
        cMenu = QMenu()
        cMenu.addAction(self.act_launch)
        cMenu.addAction(self.act_ladish)
        cMenu.addAction(self.act_info)
        cMenu.addAction(self.act_delete)
        cMenu.addSeparator()
        cMenu.addAction(self.act_refresh)
        cMenu.addSeparator()
        sMenu = QMenu(self.tr("Sort By"))
        act_x_sort_name_asc = sMenu.addAction(self.tr("Name (Ascending)"))
        act_x_sort_name_desc = sMenu.addAction(self.tr("Name (Descending)"))
        act_x_sort_folder_asc = sMenu.addAction(self.tr("Folder (Ascending)"))
        act_x_sort_folder_desc = sMenu.addAction(self.tr("Folder (Descending)"))
        cMenu.addMenu(sMenu)

        # Set Properties
        self.connect(act_x_sort_name_asc,  SIGNAL("triggered()"), partial(self.func_sortList, 0, Qt.AscendingOrder))
        self.connect(act_x_sort_name_desc,  SIGNAL("triggered()"), partial(self.func_sortList, 0, Qt.DescendingOrder))
        self.connect(act_x_sort_folder_asc,  SIGNAL("triggered()"), partial(self.func_sortList, 1, Qt.AscendingOrder))
        self.connect(act_x_sort_folder_desc,  SIGNAL("triggered()"), partial(self.func_sortList, 1, Qt.DescendingOrder))

        # Show Menu at cursor position
        newPos = QCursor.pos()
        cMenu.setGeometry(newPos.x(), newPos.y(), 0, 0)
        cMenu.exec_()

    def func_sortList(self, column, mode):
        self.listVST.sortByColumn(column, mode)
        self.customSorted = True

    def func_connectSynth(self, name):
        for i in range(50):
          ports = jack.get_ports()
          if (name+":out1" in ports):
              if (name+":out2" in ports): #Stereo
                jack.connect(name+":out1", "system:playback_1")
                jack.connect(name+":out2", "system:playback_2")
                return
              else: #Mono
                jack.connect(name+":out1", "system:playback_1")
                jack.connect(name+":out1", "system:playback_2")
                return
          sleep(0.1)
        else:
          if (pref_showWarn and pref_cout):
            QMessageBox.warning(self, "FeSTige", self.tr("Could not connect Audio output of \"%1\" to System output.").arg(name))

    def func_connectMIDI(self, name):
        for i in range(35):
          midi = pref_cin_name
          ports = jack.get_ports()
          if (name+":midi-in" in ports and midi in ports):
              jack.connect(midi, name+":midi-in")
              return
          sleep(0.1)
        else:
          if (pref_showWarn and pref_cin):
            QMessageBox.warning(self, "FeSTige", self.tr("Could not connect Midi output '%1' to VST Midi input of '%2'.").arg(midi).arg(name))

    def checkInfoTimer(self):
        global timer_info
        if (timer_info[0]):
          QMessageBox.information(self, self.tr("VST Plugin Info"), self.tr(""
            "Info from plugin %1").arg("<b>"+timer_info[1]+"</b>:<p>"+timer_info[2].replace("\n","<br>")))

          # Reset All
          timer_info = [ "", "", False ]

    def close(self):
        self.func_exit()

    def closeEvent(self, event):
        self.func_exit()

    def reject(self):
        self.func_exit()


# New Thread for getting info from plugin, so it doesn't lock the GUI
class GetVSTInfo(QThread):
    def __init__(self):
        QThread.__init__(self)

    def run(self):
        self.func_closeAll()
        self.func_getInfo(self._command, self._plugin)
        self.func_closeAll()

    def func_getInfo(self, command, plugin):
        global timer_info
        timer_info[1] = plugin
        timer_info[2] = getoutput(command)
        timer_info[0] = True

    def func_closeAll(self):
        proc = QProcess()
        proc.start("killall", [ "fstinfo.exe", "fstinfo.exe.so"])


# Settings Window
class FestigeSettingsW(QDialog, ui_settingsw.Ui_SettingsW):
    def __init__(self, *args):
        QDialog.__init__(self, *args)
        self.setupUi(self)
        self.setWindowIcon(QIcon(":/icons/logo.png"))

        # Change GUI according to system status
        if haveJack:
          if jackIsGood:
            self.l_pyjack.setText(self.tr("PyJack is installed and Jack is running"))
            self.l_pyjack_ico.setPixmap(QPixmap(":/icons/dialog-information.png"))
            ports = jack.get_ports()
            for i in range(len(ports)):
              if ((jack.get_port_flags(ports[i]) & jack.IsOutput) and jack.get_port_type_id(ports[i]) == 1): #midi = 1
                    self.co_midiin.addItem(ports[i])
          else:
            self.l_pyjack.setText(self.tr("PyJack is installed but Jack is not running"))
            self.l_pyjack_ico.setPixmap(QPixmap(":/icons/dialog-warning.png"))
        else:
          self.gr_con.setEnabled(False)
          self.l_pyjack.setText(self.tr("PyJack is not installed!"))
          self.l_pyjack_ico.setPixmap(QPixmap(":/icons/dialog-error.png"))

        # Pre-Setup GUI
        self.b_edit.setEnabled(False)
        self.b_remove.setEnabled(False)
        self.func_loadSettings()
        self.func_updateFinalCommand()
        self.func_updateFST(self.ch_fst.isChecked())

        for i in range(len(ExtraVstPath)):
          if (ExtraVstPath[i]):
            self.listPaths.addItem(ExtraVstPath[i])

        # Connect actions to functions
        self.connect(self.b_add,  SIGNAL("clicked()"), self.func_addDir)
        self.connect(self.b_remove,  SIGNAL("clicked()"), self.func_deleteDir)
        self.connect(self.b_edit,  SIGNAL("clicked()"), self.func_editDir)
        self.connect(self.listPaths, SIGNAL("currentRowChanged(int)"), self.changedDirRow)
        self.connect(self.b_reset_wine,  SIGNAL("clicked()"), self.func_resetWinePrefix)
        self.connect(self.b_reset_ladish,  SIGNAL("clicked()"), self.func_resetLadishFolder)
        self.connect(self.buttonBox, SIGNAL("accepted()"), self.func_saveSettings)

        # Update final command
        self.connect(self.ch_fst, SIGNAL("clicked()"), self.func_updateFinalCommand)
        self.connect(self.ch_vsthost, SIGNAL("clicked()"), self.func_updateFinalCommand)
        self.connect(self.lineWinePrefix, SIGNAL("textChanged(QString)"), self.func_updateFinalCommand)
        self.connect(self.lineLadishFolder, SIGNAL("textChanged(QString)"), self.func_updateFinalCommand)
        self.connect(self.ch_winert, SIGNAL("stateChanged(int)"), self.func_updateFinalCommand)
        self.connect(self.ch_winesvrt, SIGNAL("stateChanged(int)"), self.func_updateFinalCommand)
        self.connect(self.spinRT, SIGNAL("valueChanged(int)"), self.func_updateFinalCommand)
        self.connect(self.spinSVRT, SIGNAL("valueChanged(int)"), self.func_updateFinalCommand)
        self.connect(self.ch_chrt, SIGNAL("stateChanged(int)"), self.func_updateFinalCommand)
        self.connect(self.lineArgs, SIGNAL("textChanged(QString)"), self.func_updateFinalCommand)

        # Enable/Disable fst specific functionality
        self.connect(self.ch_fst, SIGNAL("clicked()"), partial(self.func_updateFST, 1))
        self.connect(self.ch_vsthost, SIGNAL("clicked()"), partial(self.func_updateFST, 0))


    def func_addDir(self):
        folderLocation = QFileDialog.getExistingDirectory(self, self.tr("VST Plugins Folder"), "")
        if not folderLocation.isEmpty() and os.path.exists(folderLocation):
          self.listPaths.addItem(folderLocation)

    def func_deleteDir(self):
        if (self.listPaths.currentRow() >= 0):
          self.listPaths.takeItem(self.listPaths.currentRow())
          self.listPaths.setCurrentRow(-1)

    def func_editDir(self):
        if (self.listPaths.currentRow() >= 0):
          folderLocation = QFileDialog.getExistingDirectory(self, self.tr("VST Plugins Folder"), self.listPaths.currentItem().text())
          if not folderLocation.isEmpty() and os.path.exists(folderLocation):
            self.listPaths.currentItem().setText(folderLocation)

    def changedDirRow(self, row):
        if (row < 0):
          state = False
        else:
          state = True
        self.b_remove.setEnabled(state)
        self.b_edit.setEnabled(state)

    def func_resetWinePrefix(self):
        self.lineWinePrefix.setText(".wine")

    def func_resetLadishFolder(self):
        self.lineLadishFolder.setText(os.getenv("HOME")+"/.festige")

    def func_updateFinalCommand(self):
        if (self.ch_fst.isChecked()):
          new_utility = "fst"
        else:
          new_utility = "vsthost"

        cmd = ""
        if (self.ch_chrt.isChecked()): cmd += "chrt -f -p -10 "

        cmd += "env "
        if (new_utility == "vsthost"): cmd += "VST_PATH='<plugin-folder>' "
        if (self.ch_winert.isChecked()): cmd += "WINE_RT="+str(self.spinRT.value())+" "
        if (self.ch_winesvrt.isChecked()): cmd += "WINE_SRV_RT="+str(self.spinSVRT.value())+" "

        cmd += "WINEPREFIX="+os.getenv("HOME")+"/"+self.lineWinePrefix.text()+" "

        if (new_utility == "fst"):
          cmd += fst_exe+" '"
          cmd += self.lineLadishFolder.text()+"/<plugin-name>' '<plugin-path>'"
        else:
          cmd += "vsthost <plugin-name>"

        if (not self.lineArgs.text().isEmpty()):
          cmd += " "+self.lineArgs.text()

        cmd_splitted = ""
        for i in range(len(cmd.split(" "))):
          cmd_splitted += cmd.split(" ")[i]+" "
          if (i and i % 4 == 0 and i != len(cmd.split(" "))-1): cmd_splitted += "\n"

        self.lineFinal.setText(cmd)
        self.lineFinal.setToolTip(cmd_splitted)

    def func_updateFST(self, state):
        self.label_ladish.setEnabled(state)
        self.lineLadishFolder.setEnabled(state)
        self.b_reset_ladish.setEnabled(state)

        if (state):
          self.i_nogui.setPixmap(QPixmap(":/icons/dialog-cancel.png"))
          self.i_presets.setPixmap(QPixmap(":/icons/dialog-ok-apply.png"))
          self.i_lash.setPixmap(QPixmap(":/icons/dialog-ok-apply.png"))
          self.i_tempo.setPixmap(QPixmap(":/icons/dialog-ok-apply.png"))
          self.i_midi.setText("Jack")
          if (haveJack):
            self.gr_con.setEnabled(True)
          else:
            self.gr_con.setEnabled(False)
        else:
          self.i_nogui.setPixmap(QPixmap(":/icons/dialog-ok-apply.png"))
          self.i_presets.setPixmap(QPixmap(":/icons/dialog-cancel.png"))
          self.i_lash.setPixmap(QPixmap(":/icons/dialog-cancel.png"))
          self.i_tempo.setPixmap(QPixmap(":/icons/dialog-cancel.png"))
          self.i_midi.setText("ALSA")
          self.gr_con.setEnabled(False)

    def func_loadSettings(self):
        if (Utility == "vsthost"):
          self.ch_vsthost.setChecked(True)
        else:
          self.ch_fst.setChecked(True)

        self.lineWinePrefix.setText(WinePrefix)
        self.lineLadishFolder.setText(LadishFolder)
        self.spinRT.setValue(pref_wineRTv)
        self.spinSVRT.setValue(pref_wineSVRTv)
        self.lineArgs.setText(pref_args)

        if (pref_cout): self.ch_sysout.setChecked(True)
        if (pref_cin): self.ch_midiin.setChecked(True)
        if (pref_wineServ): self.ch_midiin.setChecked(True)
        if (pref_showWarn): self.ch_warn.setChecked(True)
        if (pref_wineRT): self.ch_winert.setChecked(True)
        if (pref_wineSVRT): self.ch_winesvrt.setChecked(True)
        if (pref_chrt): self.ch_chrt.setChecked(True)

        for i in range(self.co_midiin.count()):
          if (pref_cin_name == self.co_midiin.itemText(i)):
            self.co_midiin.setCurrentIndex(i)
            break
          elif (i+1 == self.co_midiin.count() and pref_cin_name):
            self.co_midiin.addItem(pref_cin_name)
            self.co_midiin.setCurrentIndex(i+1)
            break

    def func_saveSettings(self):
        file_autoCon = file_midiCon = file_wineServ = file_showWarn = "no"
        file_winert = file_winesvrt = file_chrt = "no"

        if (self.ch_sysout.isChecked()): file_autoCon = "yes"
        if (self.ch_midiin.isChecked()): file_midiCon = "yes"
        if (self.ch_wineserver.isChecked()): file_wineServ = "yes"
        if (self.ch_warn.isChecked()): file_showWarn = "yes"
        if (self.ch_winert.isChecked()): file_winert = "yes"
        if (self.ch_winesvrt.isChecked()): file_winesvrt = "yes"
        if (self.ch_chrt.isChecked()): file_chrt = "yes"

        if (self.ch_midiin.isChecked()):
          file_midiConTo = str(self.co_midiin.currentText())
        else:
          file_midiConTo = ""

        if (self.ch_fst.isChecked()):
          file_util = "fst"
        else:
          file_util = "vsthost"

        file_paths = ""
        for i in range(self.listPaths.count()):
            if (file_paths): file_paths += ":"
            file_paths += (str(self.listPaths.item(i).text()))

        fileContent = (""
                      "## FeSTige Configuration File ##"
                      "\nUtility = "+file_util+
                      "\nVST PATH = "+file_paths+
                      "\nWinePrefix = "+str(self.lineWinePrefix.text())+
                      "\nLadish PATH = "+str(self.lineLadishFolder.text())+
                      "\n"+
                      "\nConnect to output = "+file_autoCon+
                      "\nConnect to input = "+file_midiCon+
                      "\nName to Connect input = "+file_midiConTo+
                      "\nRun <wineserver -p> = "+file_wineServ+
                      "\nShow Warnings = "+file_showWarn+
                      "\nWineRT enabled = "+file_winert+
                      "\nWineRT priority = "+str(self.spinRT.value())+
                      "\nWineSVRT enabled = "+file_winesvrt+
                      "\nWineSVRT priority = "+str(self.spinSVRT.value())+
                      "\nCHRT enabled = "+file_chrt+
                      "\nExtra args = $"+str(self.lineArgs.text())+
                      "\n")

        fileCFG = os.getenv("HOME")+"/.festige/festige.cfg"
        if not os.path.exists(fileCFG): os.mknod(fileCFG)
        f = open(fileCFG, "w")
        f.write(fileContent)
        f.close()

        readSettings()


#--------------- main ------------------
if __name__ == '__main__':

    # App initialization
    app = QApplication(sys.argv)
    splash = QSplashScreen(QPixmap(sys.path[0]+"/splash.png"))
    splash.show()

    # Translations
    locale = QLocale.system().name()
    appTranslator = QTranslator()
    if appTranslator.load(locale, trans_path):
        app.installTranslator(appTranslator)

    # Read FeSTige Settings
    splash.showMessage(app.translate("Main", "Loading Settings..."))
    readSettings()

    # Do not close on SIGUSR1
    signal.signal(signal.SIGUSR1, signal.SIG_IGN)

    # Pre-Load Wine
    splash.showMessage(app.translate("Main", "Pre-Loading Wine..."))
    os.system("env WINEPREFIX="+os.getenv("HOME")+"/"+WinePrefix+" wineboot")

    # Prepare home folder
    splash.showMessage(app.translate("Main", "Preparing home folder..."))
    if (not os.path.exists(os.getenv("HOME")+"/.festige")):
      os.mkdir(os.getenv("HOME")+"/.festige")

    # Get Window Properties
    fileRC = os.getenv("HOME")+"/.festige/festigerc"
    if (os.path.exists(fileRC)):
      fileRead = open(fileRC).read().split("\n")
      app_width = int(parseConfigFile(fileRead, "Width = "))
      app_height = int(parseConfigFile(fileRead, "Height = "))
      name_cw = int(parseConfigFile(fileRead, "Name Column Width = "))
      folder_cw = int(parseConfigFile(fileRead, "Folder Column Width = "))
    else:
      app_width = 520
      app_height = 400
      name_cw = 250
      folder_cw = 270

    # Show Main Window
    splash.showMessage(app.translate("Main", "Loading Main Window..."))
    mainWindow = FeSTigeMainW()
    mainWindow.resize(app_width, app_height)
    mainWindow.show()

    # App-Loop
    ret = app.exec_()

    # Close Jack
    jack.detach()

    # Exit properly
    sys.exit(ret)

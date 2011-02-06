

begin
  $rubygems = false
  require 'rubygems'
  $rubygems = true
rescue LoadError
end

def no_fox
  $stderr.puts ERR_NO_FOX
  if $rubygems
    $stderr.puts ERR_HAS_GEMS
  end
  exit(1)
end

def get_fox
  ##### ARRRGH!!!! Why does Lyle keep changing the fxruby name on each
  ##### release!
  foxes = [ 'fox16', 'fox14', 'fox12', 'fox' ]
  foxes.each { |fox|
    begin
      require "#{fox}"
      require "#{fox}/colors"
      break
    rescue LoadError
      no_fox if fox == foxes[-1]
    end
  }
  
  # verify fxruby version
  ver, rev, = Fox::fxrubyversion().split('.')
  no_fox if ver.to_i < 1 or rev.to_i < 2
end


get_fox
include Fox

require 'IFMapper/FXMap'
require 'IFMapper/FXMapperSettings'
require 'IFMapper/FXWarningBox'


class FXMapperWindow < FXMainWindow

  PROGRAM_NAME = "Interactive Fiction Mapper"
  VERSION      = '1.0.5'
  AUTHOR = "Gonzalo Garramuno"

  @@copy_buffer = nil
  @@default_options = FXMapperSettings.new

  LANGUAGES = {
    'English'  => 'en',
    'Espanol' => 'es',
    # todo1
    'Deutsch'  => 'de',
    'Italiano' => 'it',
    'Francais' => 'fr',
    # todo2
    'Japanese' => 'ja',
    'Chinese'  => 'ch',
    'Korean'   => 'ko',
    'Arabic'   => 'ar',
  }

  def open_map(file)
    tmp = nil
    begin
      f = File.open(file, 'rb')
      tmp = Marshal.load(f)
      f.close
      tmp.filename = file
    rescue => e
      tmp = e
    end
    return tmp
  end

  def open_ifm(file, map)
    require 'IFMapper/IFMReader'
    begin
      IFMReader.new(file, map)
    rescue => e
      return "#{e} #{e.backtrace}"
    end
    return map
  end

  def open_tads(file, map)
    require 'IFMapper/TADSReader'
    begin
      TADSReader.new(file, map)
    rescue => e
      return "#{e}"
    end
    return map
  end

  def open_inform(file, map)
    require 'IFMapper/InformReader'
    begin
      InformReader.new(file, map)
    rescue => e
      return "#{e}"
    end
    return map
  end

  def open_guemap(file, map)
    require 'IFMapper/GUEReader'
    begin
      GUEReader.new(file, map)
    rescue => e
      return "#{e}"
    end
    return map
  end

  #
  # Start automapping from a transcript
  #
  def start_automap_cb(sender, sel, ptr)
    map = current_map
    return if not map
    map.start_automap
  end

  #
  # Properties of the automapper callback
  #
  def automap_properties_cb(sender, sel, ptr)
    map = current_map
    return if not map or not map.automap
    map.automap.properties(true)
  end

  #
  # Stop automapping from a transcript
  #
  def stop_automap_cb(sender, sel, ptr)
    map = current_map
    return if not map
    map.stop_automap
  end


  #
  # Callback to Open File
  #
  def open_cb(sender, sel, ptr)
    require 'IFMapper/FXMapFileDialog'
    file = FXMapFileDialog.new(self, MSG_LOAD_MAP).filename
    return if file == ''

    # First, make sure we don't have it loaded already...
    @maps.each { |m|
      if m.filename == file
	@mdiclient.setActiveChild(m.window)
	return
      end
    }

    # Then, check if we have a single and empty map.
    # If so, we can just use that one to load the file in.
    # If not, we need to create a new map
    make_new_map = false
    if @maps.size == 1
      @maps[0].sections.each { |p|
	if p.rooms.size != 0
	  make_new_map = true
	  break
	end
      }
    else
      make_new_map = true
    end

    if make_new_map
      map = new_map
    else
      map = @maps[0]
    end
    status "#{MSG_LOADING} '#{file}'..."

    tmp = nil
    if file =~ /\.ifm$/i
      tmp = open_ifm(file, map)
    elsif file =~ /\.inf$/i
      tmp = open_inform(file, map)
    elsif file =~ /\.t$/i or file =~ /\.t3m$/
      tmp = open_tads(file, map)
    elsif file =~ /\.gmp$/
      tmp = open_guemap(file, map)
    else
      tmp = open_map(file)
    end

    if not tmp.kind_of?(Map) and not tmp.kind_of?(FXMap)
      $stderr.puts tmp
      w = FXWarningBox.new( self, 
			   "#{tmp}")
      w.execute
      status "#{ERR_COULD_NOT_LOAD} '#{file}'." 
      if make_new_map
	if map.close_cb
	  @maps.delete(map)
	  GC.start
	end
      end
      sleep 2
      return
    end
    
    map.copy(tmp)
    map.options.replace( @@default_options.merge(map.options) )
    map.verify_integrity
    map.fit
    map.window.create
    map.modified = false
    update_map
    status "#{MSG_LOADED} '#{file}'."
  end

  #
  # Write a message to the status bar
  #
  def status(msg)
    @statusbar.statusLine.text = msg
  end

  #
  # Returns current active map or nil if no maps
  #
  def current_map
    window = @mdiclient.activeChild
    return nil unless window

    @maps.each { |m|
      return m if m.window == window
    }
    return nil
  end

  #
  # Callback for Save
  #
  def save_cb(sender, sel, ptr)
    map = current_map
    return unless map
    map.save
  end

  #
  # Callback for Save As
  #
  def save_as_cb(sender, sel, ptr)
    map = current_map
    return unless map
    map.save_as
  end

  #
  # Callback used to create new map
  #
  def new_map_cb(*args)
    m = new_map
    m.window.create
  end

  #
  # Callback used to change language
  #
  def language_cb(sender, msg, opts)
    @@default_options['Language'] = LANGUAGES[sender.text]
    
    require "IFMapper/locales/#{language}/Messages.rb"
    recreate
  end

  #
  # Create a new map
  #
  def new_map
    mapname  = "#{MSG_EMPTY_MAP} \##{@maps.size+1}"
    @maps.push( FXMap.new(mapname, @mdiclient, @@default_options.dup,
			  @mdiicon, @mdimenu, MDI_NORMAL, 0, 0, 790, 500) )
    map = @maps[-1]
    map.window.connect(SEL_PAINT) {
      map.draw
    }
    map.window.connect(SEL_CLOSE) {
      if map.close_cb
	@maps.delete(map)
      end
      if @maps[-1]
	@maps[-1].update_roomlist
      else
	FXMap::no_maps
      end
    }

    # Make it active
    @mdiclient.setActiveChild(map.window)
    map.update_roomlist
    return map
  end

  #
  # Load the named PNG icon from a file
  #
  def load_icon(filename)
    begin
      filename = File.join("icons", filename) + ".png"
      icon = nil
      File.open(filename, "rb") { |f|
        icon = FXPNGIcon.new(getApp(), f.read)
      }
      icon
    rescue
      raise RuntimeError, "#{ERR_NO_ICON} #{filename}"
    end
  end

  #
  # Start a complex connection
  #
  def complex_connection_cb(sender, sel, msg)
    map = current_map
    return unless map
    map.complex_connection
  end

  #
  # Delete selected elements in map
  #
  def delete_selected_cb(sender, sel, msg)
    map = current_map
    return unless map
    map.delete_selected
  end

  #
  # Popup a printer dialog and return the settings or false if user cancels
  #
  def printer_dialog(title = MSG_PRINT_MAP)
    map = current_map
    dlg = FXPrintDialog.new(self, title + " for #{map.name}")
    dlg.printer.flags |= PRINT_DEST_PAPER 
    return dlg.printer if dlg.execute != 0
    return false
  end

  #
  # Print out all the locations in map
  #
  def print_locations_cb(sender, sel, msg)
    map = current_map
    return unless map

    w = FXWarningBox.new( self, ERR_NO_PRINTING)
    w.execute
    return

    printer = printer_dialog MSG_PRINT_LOC
    map.print_locations( printer ) if printer
  end

  #
  # Export current map as an IFM file
  #
  def ifm_export_cb(sender, sel, msg)
    map = current_map
    return unless map

    require 'IFMapper/FXMapFileDialog'
    d = FXMapFileDialog.new(self, MSG_SAVE_MAP_AS_IFM, 
			    [
			      FMT_IFM
			    ])
    map.export_ifm(d.filename) if d.filename != ''
  end

  #
  # Export current map as an Inform source file
  #
  def inform_export_cb(sender, sel, msg)
    map = current_map
    return unless map

    require 'IFMapper/FXMapFileDialog'
    d = FXMapFileDialog.new(self, MSG_SAVE_MAP_AS_INFORM, 
			    [
			      FMT_INFORM,
			    ])
    map.export_inform( d.filename ) if d.filename != ''
  end


  #
  # Export current map as a TADs source file
  #
  def tads_export_cb(sender, sel, msg)
    map = current_map
    return unless map

    require 'IFMapper/TADSWriter'
    require 'IFMapper/FXMapFileDialog'
    d = FXMapFileDialog.new(self, MSG_SAVE_MAP_AS_TADS, 
			    [
			      FMT_TADS
			    ])
    map.export_tads( d.filename ) if d.filename != ''
  end


  #
  # Export current map as Acrobat PDF
  #
  def pdf_export_cb(sender, sel, msg)
    map = current_map
    return unless map

    begin
      require 'IFMapper/PDFMapExporter'
    rescue LoadError => e
      w = FXWarningBox.new( self, "#{e}")
      w.execute
      return
    end
    
    # PRE: Let's ask for a page size and orientation for the PDF
    #      and whether the user wants to include location numbers
    map.pdfpapersize = 0
    map.pdflocationnos = 1
    require 'IFMapper/FXPDFMapExporterOptionsDialogBox'
    FXPDFMapExporterOptionsDialogBox.new(self, MSG_SAVE_MAP_AS_PDF, map).execute

    require 'IFMapper/FXMapFileDialog'
    d = FXMapFileDialog.new(self, MSG_SAVE_MAP_AS_PDF, 
			    [
			      FMT_PDF
			    ])
    if d.filename != ''
      map.pdf_export(d.filename)
    end
  end

  #
  # Print current map graphically
  #
  def print_cb(sender, sel, msg)
    map = current_map
    return unless map

    w = FXWarningBox.new( self, ERR_NO_PRINTING )
    w.execute
    return
    require 'IFMapper/MapPrinting'

    printer = printer_dialog
    map.print( printer ) if printer
  end

  def update_map
    map = current_map
    return unless map
    map.update_roomlist
    update_section
  end

  #
  # Creates the MDI (multi-document) client
  #
  def create_mdiclient
    # MDI Client
    @maps = []

    @mdiclient = FXMDIClient.new(self, LAYOUT_FILL_X|LAYOUT_FILL_Y)
    @mdiclient.connect(SEL_CHANGED) { 
      update_map
    }

    # MDI buttons in menu:- note the message ID's!!!!!
    # Normally, MDI commands are simply sensitized or desensitized;
    # Under the @menubar, however, they're hidden if the MDI Client is
    # not maximized.  To do this, they must have different ID's.
    FXMDIWindowButton.new(@menubar, @mdimenu, @mdiclient,
      FXMDIClient::ID_MDI_MENUWINDOW, LAYOUT_LEFT)
    FXMDIDeleteButton.new(@menubar, @mdiclient,
      FXMDIClient::ID_MDI_MENUCLOSE, FRAME_RAISED|LAYOUT_RIGHT)
    FXMDIRestoreButton.new(@menubar, @mdiclient,
      FXMDIClient::ID_MDI_MENURESTORE, FRAME_RAISED|LAYOUT_RIGHT)
    FXMDIMinimizeButton.new(@menubar, @mdiclient,
      FXMDIClient::ID_MDI_MENUMINIMIZE, FRAME_RAISED|LAYOUT_RIGHT)

    # Icon for MDI Child
    @mdiicon = load_icon("winapp")

    # Make MDI Window Menu
    @mdimenu = FXMDIMenu.new(self, @mdiclient)
  end

  #
  # Return the copied elements 
  #
  def self.copy_buffer
    return @@copy_buffer
  end

  #
  # Copy selected elements
  #
  def self.copy_selected(map)
    sect = map.sections[map.section]

    # Get all selected rooms
    rooms = sect.rooms.find_all { |r| r.selected }
    return if rooms.size < 1

    # Get all selected connections
    links = sect.connections.find_all { |c| c.selected }

    # Make sure we store only those connections for
    # those rooms we selected
    delete = []
    links.each { |c|
      if not rooms.include?(c.roomA) or 
	  (c.roomB and not rooms.include?(c.roomB))
	delete << c
      end
    }
    links -= delete

    selection = [ rooms, links ]

    @@copy_buffer = selection
  end

  #
  # Cut selected elements
  #
  def self.cut_selected(map)
    FXMapperWindow::copy_selected(map)
    map.cut_selected
  end

  #
  # Paste selected elements
  #
  def self.paste_selected(map)
    return if not @@copy_buffer
    return map.navigation_warning if map.navigation

    sel = @@copy_buffer
    pos = map.find_empty_area( sel[0] )
    if not pos
      w = FXWarningBox.new( map.window, ERR_NO_FREE_ROOM)
      w.execute
    else
      map.clear_selection

      # Add rooms
      r_to_nr = {}  # orig room to new room hash
      rooms = sel[0]
      rooms.each { |r|
	nr = map.new_room(r.x + pos[0], r.y + pos[1])
	nr.selected = true
	nr.copy(r) # copy the room data
	r_to_nr[r] = nr
      }

      if rooms.empty?
	# Add connections only (no rooms copied)
	sel[1].each { |c|
	  exitA, exitB = c.dirs
	  roomA = c.roomA
	  roomB = c.roomB
	  sect  = map.sections[map.section]
	  if not sect.rooms.include?(roomA) or 
	      (roomB and not sect.rooms.include?(roomB))
	    next
	  end
	  begin
	    nc = map.new_connection(roomA, exitA, roomB, exitB)
	    nc.selected = true
	    nc.dir = c.dir
	    nc.type = c.type
	  rescue
	  end
	}
      else
	# Add connections
	sel[1].each { |c|
	  exitA, exitB = c.dirs
	  roomA = r_to_nr[c.roomA]
	  if c.roomB
	    roomB = r_to_nr[c.roomB]
	  else
	    roomB = nil
	  end
	  next if not roomA
	  begin
	    nc = map.new_connection(roomA, exitA, roomB, exitB)
	    nc.selected = true
	    nc.dir  = c.dir
	    nc.type = c.type
	  rescue Section::ConnectionError => e
	    puts c
	    puts e
	  end
	}
      end

      map.create_pathmap
      map.draw
    end
  end

  def cut_selected_cb(*o)
    map = current_map
    return unless map
    FXMapperWindow::cut_selected(map)
  end

  def copy_selected_cb(*o)
    map = current_map
    return unless map
    FXMapperWindow::copy_selected(map)
  end

  def paste_selected_cb(*o)
    map = current_map
    return if not map or not @@copy_buffer
    FXMapperWindow::paste_selected(map)
  end


  #
  # Hilite matches after a search
  #
  def hilite_matches(map, matches, re, idx = 0 )
    if matches.size == 0
      status "#{ERR_NO_MATCHES} '#{re}'."
      return
    end

    # sort matches by section
    matches.sort_by { |a| a[0] }

    # Jump to first section of match
    map.section = matches[idx][0]
    map.sections.each { |s|
      s.rooms.each { |r| r.selected = false }
    }

    matches.each { |p, r| 
      next if p != map.section
      r.selected = true
    }

    num = matches.find_all { |p, r| p == matches[idx][0] }
    room = matches[idx][1]
    map.center_view_on_room( room )
    update_section

    status "'#{room.name}' #{MSG_MATCHES}. #{matches.size} #{MSG_MATCHES_IN_MAP}, #{num.size} #{MSG_MATCHES_IN_SECTION}."
    map.draw
  end

  #
  # Find location in map
  #
  def find_in_map(s, m, e)
    map = current_map
    return unless map

    re = /#{s.text}/
    matches = []
    (0...map.sections.size).each { |p|
      map.sections[p].rooms.each { |r|
	next unless r.name =~ re
	matches.push( [p, r] )
      }
    }
    idx = @search.index
    @search.index = matches.size-1 if idx >= matches.size
    hilite_matches(map, matches, re, @search.index)
  end

  def find_in_map_cb(s, m, e)
    map = current_map
    return unless map

    title = MSG_FIND_LOCATION_IN_MAP
    if not @search
      require 'IFMapper/FXSearchDialogBox'
      @search = FXSearchDialogBox.new(self)
    end
    @search.proc  = method(:find_in_map)
    @search.title = title
    @search.text  = ''
    @search.show
  end

  #
  # Find location in section
  #
  def find_in_section(s, m, e)
    map = current_map
    return unless map

    re = /#{s.text}/
    matches = []
    map.sections[map.section].rooms.each { |r|
      next unless r.name =~ re
      matches.push( [ map.section, r] )
    }
    hilite_matches(map, matches, re)
  end

  #
  # Callback
  #
  def find_in_section_cb(s, m, e)
    map = current_map
    return unless map

    title = MSG_FIND_LOCATION_IN_SECTION
    if not @search
      require 'IFMapper/FXSearchDialogBox'
      @search = FXSearchDialogBox.new(self)
    end
    @search.proc  = method(:find_in_section)
    @search.title = title
    @search.text  = ''
    @search.show
  end

  #
  # Find object in map
  #
  def find_object_in_map(s, m, e)
    map = current_map
    return unless map

    re = /#{s.text}/
    matches = []
    (0...map.sections.size).each { |p|
      map.sections[p].rooms.each { |r|
	next unless r.objects =~ re
	matches.push( [p, r] )
      }
    }
    idx = @search.index
    @search.index = matches.size-1 if idx >= matches.size
    hilite_matches(map, matches, re, @search.index)
  end

  #
  # Find task in map
  #
  def find_task_in_map(s, m, e)
    map = current_map
    return unless map

    re = /#{s.text}/
    matches = []
    (0...map.sections.size).each { |p|
      map.sections[p].rooms.each { |r|
	next unless r.tasks =~ re
	matches.push( [p, r] )
      }
    }
    idx = @search.index
    @search.index = matches.size-1 if idx >= matches.size
    hilite_matches(map, matches, re, @search.index)
  end

  #
  # Find object in map
  #
  def find_object_in_map_cb(s, m, e)
    map = current_map
    return unless map

    title = MSG_FIND_OBJECT_IN_MAP
    if not @search
      require 'IFMapper/FXSearchDialogBox'
      @search = FXSearchDialogBox.new(self)
    end
    @search.proc  = method(:find_object_in_map)
    @search.title = title
    @search.text  = ''
    @search.show
  end

  #
  # Find task in map
  #
  def find_task_in_map_cb(s, m, e)
    map = current_map
    return unless map

    title = MSG_FIND_TASK_IN_MAP
    if not @search
      require 'IFMapper/FXSearchDialogBox'
      @search = FXSearchDialogBox.new(self)
    end
    @search.proc  = method(:find_task_in_map)
    @search.title = title
    @search.text  = ''
    @search.show
  end

  #
  # Find task in map
  #
  def find_desc_in_map(s, m, e)
    map = current_map
    return unless map

    re = /#{s.text}/
    matches = []
    (0...map.sections.size).each { |p|
      map.sections[p].rooms.each { |r|
	next unless r.desc =~ re
	matches.push( [p, r] )
      }
    }
    idx = @search.index
    @search.index = matches.size-1 if idx >= matches.size
    hilite_matches(map, matches, re, @search.index)
  end

  #
  # Find description in map
  #
  def find_desc_in_map_cb(s, m, e)
    map = current_map
    return unless map

    title = MSG_FIND_DESCRIPTION_IN_MAP
    if not @search
      require 'IFMapper/FXSearchDialogBox'
      @search = FXSearchDialogBox.new(self)
    end
    @search.proc  = method(:find_desc_in_map)
    @search.title = title
    @search.text  = ''
    @search.show
  end


  #
  # Pop-up color preferences
  #
  def colors_cb(sender, id, msg)
    map = current_map
    return if not map

    if not @colors
      require 'IFMapper/FXMapColorBox'
      @colors = FXMapColorBox.new(self)
    else
      @colors.show
    end
    @colors.copy_from(map)
  end

  #
  # Unselect all
  #
  def select_none_cb( sender, id, event )
    map = current_map
    return if not map
    map.clear_selection
  end

  #
  # Select all
  #
  def select_all_cb( sender, id, event )
    map = current_map
    return if not map
    sect = map.sections[map.section]
    sect.rooms.each { |r|
      r.selected = true
    }
    sect.connections.each { |c|
      c.selected = true
    }
  end

  def roomlist(sender, sel, event)
    map = current_map
    return unless map
    map.show_roomlist
  end


  def about_cb(sender, id, event )
    require 'IFMapper/FXAboutDialogBox'
    FXAboutDialogBox.new(self, MSG_ABOUT_SOFTWARE, 
			 eval("\"#{MSG_ABOUT}\"")).execute
  end


  def create_menus
    # Construct these icons
    newdoc    = load_icon("filenew")
    opendoc   = load_icon("fileopen")
    savedoc   = load_icon("filesave")
    saveasdoc = load_icon("filesaveas")

    # File Menu
    filemenu = FXMenuPane.new(self)
    FXMenuTitle.new(@menubar, MENU_FILE, nil, filemenu)
    cmd = FXMenuCommand.new(filemenu, MENU_NEW, newdoc)
    cmd.connect(SEL_COMMAND, method(:new_map_cb))

    cmd = FXMenuCommand.new(filemenu, MENU_OPEN, opendoc)
    cmd.connect(SEL_COMMAND, method(:open_cb))
    cmd = FXMenuCommand.new(filemenu, MENU_SAVE, savedoc)
    cmd.connect(SEL_COMMAND, method(:save_cb))
    cmd = FXMenuCommand.new(filemenu, MENU_SAVE_AS,
			    saveasdoc)
    cmd.connect(SEL_COMMAND, method(:save_as_cb))

    # Export submenu
    submenu = FXMenuPane.new(self)

    cmd = FXMenuCommand.new(submenu, MENU_EXPORT_PDF, nil)
    cmd.connect(SEL_COMMAND, method(:pdf_export_cb))

    cmd = FXMenuCommand.new(submenu, MENU_EXPORT_IFM, nil)
    cmd.connect(SEL_COMMAND, method(:ifm_export_cb))

    cmd = FXMenuCommand.new(submenu, MENU_EXPORT_INFORM, nil)
    cmd.connect(SEL_COMMAND, method(:inform_export_cb))

    cmd = FXMenuCommand.new(submenu, MENU_EXPORT_TADS, nil)
    cmd.connect(SEL_COMMAND, method(:tads_export_cb))

    FXMenuCascade.new(filemenu, MENU_EXPORT, nil, submenu)


    submenu = FXMenuPane.new(self)
    cmd = FXMenuCommand.new(submenu, MENU_PRINT_MAP, nil)
    cmd.connect(SEL_COMMAND, method(:print_cb))

    cmd = FXMenuCommand.new(submenu, MENU_PRINT_LOCATIONS, nil)
    cmd.connect(SEL_COMMAND, method(:print_locations_cb))
    FXMenuCascade.new(filemenu, MENU_PRINT, nil, submenu)

    cmd = FXMenuCommand.new(filemenu, MENU_QUIT, nil)
    cmd.connect( SEL_COMMAND, method(:close_cb) )

    # Edit Menu
    editmenu = FXMenuPane.new(self)
    FXMenuTitle.new(@menubar, MENU_EDIT, nil, editmenu)
    cmd = FXMenuCommand.new(editmenu, MENU_COPY, nil)
    cmd.connect(SEL_COMMAND, method(:copy_selected_cb))
    cmd = FXMenuCommand.new(editmenu, MENU_CUT, nil)
    cmd.connect(SEL_COMMAND, method(:cut_selected_cb))
    cmd = FXMenuCommand.new(editmenu, MENU_PASTE, nil) 
    cmd.connect(SEL_COMMAND, method(:paste_selected_cb))

    # Select submenu
    FXMenuSeparator.new(editmenu)
    submenu = FXMenuPane.new(self)
    cmd = FXMenuCommand.new( submenu, MENU_SELECT_ALL )
    cmd.connect(SEL_COMMAND, method(:select_all_cb))
    cmd = FXMenuCommand.new( submenu, MENU_SELECT_NONE )
    cmd.connect(SEL_COMMAND, method(:select_none_cb))
    FXMenuCascade.new( editmenu, MENU_SELECT, nil, submenu )

    # Searching submenu
    FXMenuSeparator.new(editmenu)
    submenu = FXMenuPane.new(self)
    cmd = FXMenuCommand.new(submenu, MENU_SEARCH_MAP)
    cmd.connect(SEL_COMMAND, method(:find_in_map_cb))
    cmd = FXMenuCommand.new(submenu, MENU_SEARCH_SECTION)
    cmd.connect(SEL_COMMAND, method(:find_in_section_cb))
    cmd = FXMenuCommand.new(submenu, MENU_SEARCH_OBJECT)
    cmd.connect(SEL_COMMAND, method(:find_object_in_map_cb))
    cmd = FXMenuCommand.new(submenu, MENU_SEARCH_TASK)
    cmd.connect(SEL_COMMAND, method(:find_task_in_map_cb))
    cmd = FXMenuCommand.new(submenu, MENU_SEARCH_DESCRIPTION)
    cmd.connect(SEL_COMMAND, method(:find_desc_in_map_cb))
    FXMenuCascade.new(editmenu, MENU_SEARCH, nil, submenu)

    # Complex Connection
    FXMenuSeparator.new(editmenu)
    cmd = FXMenuCommand.new(editmenu, MENU_COMPLEX_CONNECTION, nil)
    cmd.connect( SEL_COMMAND, method(:complex_connection_cb) )

    FXMenuSeparator.new(editmenu)
    cmd = FXMenuCommand.new(editmenu, MENU_DELETE, nil)
    cmd.connect( SEL_COMMAND, method(:delete_selected_cb) )

    # Map menu
    mapmenu = FXMenuPane.new(self)

    cmd = FXMenuCommand.new(mapmenu, MENU_MAP_INFO)
    cmd.connect(SEL_COMMAND) {  map_properties }

    cmd = FXMenuCommand.new(mapmenu, MENU_ROOM_LIST)
    cmd.connect(SEL_COMMAND, method(:roomlist) )

    # Automap submenu
    #
    submenu = FXMenuPane.new(self)
    cmd = FXMenuCommand.new(submenu, MENU_AUTOMAP_START)
    cmd.connect(SEL_COMMAND, method(:start_automap_cb))
    cmd = FXMenuCommand.new(submenu, MENU_AUTOMAP_STOP)
    cmd.connect(SEL_COMMAND, method(:stop_automap_cb))
    FXMenuSeparator.new(submenu)
    cmd = FXMenuCommand.new(submenu, MENU_AUTOMAP_PROPERTIES)
    cmd.connect(SEL_COMMAND, method(:automap_properties_cb))
    FXMenuCascade.new(mapmenu, MENU_AUTOMAP, nil, submenu)

    # Sections submenu
    submenu = FXMenuPane.new(self)
    cmd = FXMenuCommand.new(submenu, MENU_NEXT_SECTION)
    cmd.connect(SEL_COMMAND) { 
      next_section
    }
    cmd = FXMenuCommand.new(submenu, MENU_PREVIOUS_SECTION)
    cmd.connect(SEL_COMMAND) { 
      previous_section
    }
    FXMenuSeparator.new(submenu)
    cmd = FXMenuCommand.new(submenu, MENU_ADD_SECTION)
    cmd.connect(SEL_COMMAND) { 
      map = current_map
      if map
	map.new_section
	map.modified = true
	update_section
      end
    }
    cmd = FXMenuCommand.new(submenu, MENU_RENAME_SECTION)
    cmd.connect(SEL_COMMAND) { 
      map = current_map
      if map
	map.rename_section
	map.modified = true
      end
    }
    FXMenuSeparator.new(submenu)
    cmd = FXMenuCommand.new(submenu, MENU_DELETE_SECTION)
    cmd.connect(SEL_COMMAND) { 
      map = current_map
      if map
	map.delete_section
	map.modified = true
	update_section
      end
    }
    FXMenuCascade.new(mapmenu, MENU_SECTIONS, nil, submenu)
    
    #
    # Zoom submenu
    #
    submenu = FXMenuPane.new(self)
    [25, 50, 75, 100, 125].each { |v| 
      cmd = FXMenuCommand.new(submenu, eval("\"#{MENU_ZOOM_PERCENT}\""))
      cmd.connect(SEL_COMMAND) { 
	map = current_map
	if map
	  map.zoom = v / 100.0
	  map.draw
	end
      }
    }
    FXMenuCascade.new(mapmenu, MENU_ZOOM, nil, submenu)

    submenu = FXMenuPane.new(self)

    cmd = FXMenuCheck.new(submenu, MENU_EDIT_ON_CREATION)
    cmd.check = @@default_options['Edit on Creation']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Edit on Creation'] = (s.check == true)
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Edit on Creation'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_AUTOMATIC_CONNECTION)
    cmd.check = @@default_options['Automatic Connection']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Automatic Connection'] = (s.check == true)
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Automatic Connection'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_CREATE_ON_CONNECTION)
    cmd.check = @@default_options['Create on Connection']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      map.options['Create on Connection'] = s.check if map
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Create on Connection'] if map
    }

    FXMenuCascade.new(mapmenu, MENU_OPTIONS, nil, submenu)

    ##########################
    # Display submenu
    #########################
    submenu = FXMenuPane.new(self)
    cmd = FXMenuCheck.new(submenu, MENU_USE_ROOM_CURSOR)
    cmd.check = @@default_options['Use Room Cursor']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Use Room Cursor'] = (s.check == true)
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Use Room Cursor'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_PATHS_AS_CURVES)
    cmd.check = @@default_options['Paths as Curves']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Paths as Curves'] = (s.check == true)
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Paths as Curves'] if map
    }
    cmd = FXMenuCheck.new(submenu, MENU_LOCATION_NUMBERS)
    cmd.check = @@default_options['Location Numbers']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Location Numbers'] = (s.check == true)
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Location Numbers'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_LOCATION_TASKS)
    cmd.check = @@default_options['Location Tasks']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Location Tasks'] = (s.check == true)
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Location Tasks'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_LOCATION_DESC)
    cmd.check = @@default_options['Location Description']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Location Description'] = (s.check == true)
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Location Description'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_BOXES)
    cmd.check = @@default_options['Grid Boxes']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Grid Boxes'] = (s.check == true)
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Grid Boxes'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_STRAIGHT_CONN)
    cmd.check = @@default_options['Grid Straight Connections']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Grid Straight Connections'] = (s.check == true)
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Grid Straight Connections'] if map
    }

    cmd = FXMenuCheck.new(submenu, MENU_DIAGONAL_CONN)
    cmd.check = @@default_options['Grid Diagonal Connections']
    cmd.connect(SEL_COMMAND) { |s, m, e|
      map = current_map
      if map
	map.options['Grid Diagonal Connections'] = s.check
	map.draw
      end
    }
    cmd.connect(SEL_UPDATE) { |s, m, e|
      map = current_map
      s.check = map.options['Grid Diagonal Connections'] if map
    }

    FXMenuCascade.new(mapmenu, MENU_DISPLAY, nil, submenu)

    submenu = FXMenuPane.new(self)

    cmd = FXMenuCommand.new(submenu, MENU_COLORS)
    cmd.connect(SEL_COMMAND, method(:colors_cb))

#     langmenu = FXMenuPane.new(self)
#     LANGUAGES.each { |k, v|
#       next unless File.exists?( "lib/IFMapper/locales/#{v}/Messages.rb" )
#       cmd = FXMenuCheck.new(langmenu, k)
#       cmd.connect(SEL_COMMAND, method(:language_cb))
#     }

#     FXMenuCascade.new(mapmenu, MENU_LANGUAGE, nil, langmenu)
    

    FXMenuSeparator.new(submenu)
    cmd = FXMenuCommand.new(submenu, MENU_SAVE_PREFS)
    cmd.connect(SEL_COMMAND) { 
      map = current_map
      map.options.write if map
    }
    FXMenuCascade.new(mapmenu, MENU_PREFS, nil, submenu)

    FXMenuTitle.new(@menubar, MENU_MAP, nil, mapmenu)

    # Window menu
    windowmenu = FXMenuPane.new(self)
    FXMenuCommand.new(windowmenu, MENU_TILE_HORIZONTALLY, nil,
      @mdiclient, FXMDIClient::ID_MDI_TILEHORIZONTAL)
    FXMenuCommand.new(windowmenu, MENU_TILE_VERTICALLY, nil,
      @mdiclient, FXMDIClient::ID_MDI_TILEVERTICAL)
    FXMenuCommand.new(windowmenu, MENU_CASCADE, nil,
      @mdiclient, FXMDIClient::ID_MDI_CASCADE)
    FXMenuCommand.new(windowmenu, MENU_CLOSE, nil,
      @mdiclient, FXMDIClient::ID_MDI_CLOSE)
    sep1 = FXMenuSeparator.new(windowmenu)
    sep1.setTarget(@mdiclient)
    sep1.setSelector(FXMDIClient::ID_MDI_ANY)
    FXMenuCommand.new(windowmenu, nil, nil, @mdiclient, FXMDIClient::ID_MDI_1)
    FXMenuCommand.new(windowmenu, nil, nil, @mdiclient, FXMDIClient::ID_MDI_2)
    FXMenuCommand.new(windowmenu, nil, nil, @mdiclient, FXMDIClient::ID_MDI_3)
    FXMenuCommand.new(windowmenu, nil, nil, @mdiclient, FXMDIClient::ID_MDI_4)
    FXMenuCommand.new(windowmenu, MENU_OTHERS, nil, @mdiclient, 
		      FXMDIClient::ID_MDI_OVER_5)
    FXMenuTitle.new(@menubar, MENU_WINDOW, nil, windowmenu)

    # Help menu
    helpmenu = FXMenuPane.new(self)
    cmd = FXMenuCommand.new(helpmenu, MENU_HOTKEYS, nil)
    cmd.connect(SEL_COMMAND, method(:hotkeys))
    cmd = FXMenuCommand.new(helpmenu, MENU_INSTRUCTIONS, nil)
    cmd.connect(SEL_COMMAND, method(:docs))
    FXMenuSeparator.new(helpmenu)
    cmd = FXMenuCommand.new(helpmenu, MENU_ABOUT, nil)
    cmd.connect(SEL_COMMAND, method(:about_cb))

    cmd = FXMenuCommand.new(helpmenu, MENU_RESOURCE, nil)
    cmd.connect(SEL_COMMAND) {
      require 'IFMapper/FXMapFileDialog'
      file = FXMapFileDialog.new(self, "Resource a Ruby File", 
				 ['Ruby File (*.rb)']).filename
      if file != ''
	begin
	  Kernel.load file
	rescue => e
	  p e
	end
      end
    }
    FXMenuTitle.new(@menubar, MENU_HELP, nil, helpmenu)
  end

  def language
    return @@default_options['Language']
  end

  def docs(*opts)
    browsers = [ 'firefox', 'opera', 'explorer' ]
    address  = 'docs/' + language + '/start.html'
    status "#{MSG_OPENING_WEB_PAGE} #{address}..."
    ok = false
    browsers.each { |cmd|
      if RUBY_PLATFORM =~ /mswin/
	ok = system("start #{cmd} #{address}")
      else
	ok = system("#{cmd} #{address} &")
      end
      break if ok
    }
    if not ok
      status ERR_COULD_NOT_OPEN_WEB_BROWSER
    end
  end


  def hotkeys(*opts)
    require 'IFMapper/FXAboutDialogBox'
    FXAboutDialogBox.new(self, BOX_HOTKEYS, MSG_HOTKEYS).show
  end

  def create_toolbar(toolbar)

    # Construct these icons
    newdoc = load_icon("filenew")
    opendoc = load_icon("fileopen")
    savedoc = load_icon("filesave")
    saveasdoc = load_icon("filesaveas")

    # File manipulation
    cmd = FXButton.new(toolbar, ICON_NEW, newdoc, nil, 0,
		       FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND, method(:new_map_cb))

    cmd = FXButton.new(toolbar, ICON_OPEN, opendoc, nil, 0,
      FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND, method(:open_cb))

    cmd = FXButton.new(toolbar, ICON_SAVE, savedoc, nil, 0,
      FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND, method(:save_cb))
    cmd.connect(SEL_UPDATE) { |sender, sel, ptr|
      map = current_map
      message = map ? FXWindow::ID_ENABLE : FXWindow::ID_DISABLE
      sender.handle(self, MKUINT(message, SEL_COMMAND), nil)
    }
    cmd = FXButton.new(toolbar, ICON_SAVE_AS,
      saveasdoc, nil, 0, FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND, method(:save_as_cb))
    cmd.connect(SEL_UPDATE) { |sender, sel, ptr|
      map = current_map
      message = map ? FXWindow::ID_ENABLE : FXWindow::ID_DISABLE
      sender.handle(self, MKUINT(message, SEL_COMMAND), nil)
    }

    # Print
    FXFrame.new(toolbar,
      LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, 0, 0, 4, 20)
    cmd = FXButton.new(toolbar, ICON_PRINT,
		       load_icon("printicon"), @mdiclient, FXGLViewer::ID_PRINT_IMAGE,
		       BUTTON_AUTOGRAY|FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND, method(:print_cb))
    cmd.connect(SEL_UPDATE) { |sender, sel, ptr|
      map = current_map
      message = map ? FXWindow::ID_ENABLE : FXWindow::ID_DISABLE
      sender.handle(self, MKUINT(message, SEL_COMMAND), nil)
    }
  
    # Editing
    FXFrame.new(toolbar,
      LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, 0, 0, 4, 20)
    cmd = FXButton.new(toolbar, ICON_CUT, load_icon("cut"), @mdiclient,
      FXGLViewer::ID_CUT_SEL, (BUTTON_AUTOGRAY|FRAME_THICK|FRAME_RAISED|
      LAYOUT_TOP|LAYOUT_LEFT))
    cmd.connect(SEL_COMMAND, method(:cut_selected_cb))
    cmd.connect(SEL_UPDATE) { |sender, sel, ptr|
      map = current_map
      message = map ? FXWindow::ID_ENABLE : FXWindow::ID_DISABLE
      sender.handle(self, MKUINT(message, SEL_COMMAND), nil)
    }
    cmd = FXButton.new(toolbar, ICON_COPY, load_icon("copy"), @mdiclient,
      FXGLViewer::ID_COPY_SEL, (BUTTON_AUTOGRAY|FRAME_THICK|FRAME_RAISED|
      LAYOUT_TOP|LAYOUT_LEFT))
    cmd.connect(SEL_COMMAND, method(:copy_selected_cb))
    cmd.connect(SEL_UPDATE) { |sender, sel, ptr|
      map = current_map
      message = map ? FXWindow::ID_ENABLE : FXWindow::ID_DISABLE
      sender.handle(self, MKUINT(message, SEL_COMMAND), nil)
    }
    cmd = FXButton.new(toolbar, ICON_PASTE, load_icon("paste"), @mdiclient,
      FXGLViewer::ID_PASTE_SEL, (BUTTON_AUTOGRAY|FRAME_THICK|FRAME_RAISED|
      LAYOUT_TOP|LAYOUT_LEFT))
    cmd.connect(SEL_COMMAND, method(:paste_selected_cb))
    cmd.connect(SEL_UPDATE) { |sender, sel, ptr|
      map = current_map
      message = (map and @@copy_buffer) ? FXWindow::ID_ENABLE : FXWindow::ID_DISABLE
      sender.handle(self, MKUINT(message, SEL_COMMAND), nil)
    }

    # Zooming
    FXFrame.new(toolbar,
      LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, 0, 0, 4, 20)
    cmd = FXButton.new(toolbar, ICON_ZOOM_IN, load_icon("zoom"), @mdiclient,
		       0, FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND) { zoom_in }

    cmd = FXButton.new(toolbar, ICON_ZOOM_OUT, load_icon("zoom"), @mdiclient, 
		       0, FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND) { zoom_out }


    # Section travel
    frame = FXHorizontalFrame.new(toolbar,
				  LAYOUT_RIGHT|FRAME_THICK|FRAME_RAISED)
    cmd = FXButton.new(frame, ICON_PREV_SECTION, load_icon("prevpage"), 
		       @mdiclient,
		       0, FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND) { previous_section }

    @section = FXTextField.new(frame, 5, nil, 0, 
			    TEXTFIELD_INTEGER|LAYOUT_FILL_ROW)
    @section.text = '1'
    @section.connect(SEL_COMMAND) { |s,m,e| 
      v = s.text.to_i
      map = current_map
      if map
	map.section = v - 1
	map.draw
	update_section
      end
    }
    @section.connect(SEL_UPDATE) {  |s,m,e| 
      v = s.text.to_i
      map = current_map
      update_section if map
    }

    cmd = FXButton.new(frame, ICON_NEXT_SECTION, load_icon("nextpage"), 
		       @mdiclient,
		       0, FRAME_THICK|FRAME_RAISED|LAYOUT_TOP|LAYOUT_LEFT)
    cmd.connect(SEL_COMMAND) { next_section }    
  end

  #
  # Update section # in toolbar widget
  #
  def update_section
    map = current_map
    return unless map
    @section.text = (map.section + 1).to_s
  end

  #
  # Go to next section in current map
  #
  def next_section
    map = current_map
    map.next_section if map
    update_section
  end

  #
  # Go to previous section in current map
  #
  def previous_section 
    map = current_map
    map.previous_section if map
    update_section
  end

  #
  # Zoom in into current map
  #
  def zoom_in
    map = current_map
    if map
      map.zoom_in
      map.draw
    end
  end

  #
  # Zoom out from current map
  #
  def zoom_out
    map = current_map
    if map
      map.zoom_out
      map.draw
    end
  end

  #
  # Bring up the map property requester for current map
  #
  def map_properties
    map = current_map
    map.properties if map
  end

  #
  # In case of crash or runtime error, autosave all maps, so user
  # does not loose any data.
  #
  def autosave
    @maps.each { |m|
      m.save
    }
  end


  def create_widgets
    # Menubar
    @menubar = FXMenuBar.new(self, LAYOUT_SIDE_TOP|LAYOUT_FILL_X)

    FXHorizontalSeparator.new(self,
			      LAYOUT_SIDE_TOP|SEPARATOR_GROOVE|LAYOUT_FILL_X)
    toolbar = FXToolBar.new(self, LAYOUT_SIDE_TOP|LAYOUT_FILL_X,
      0, 0, 0, 0, 4, 4, 0, 0, 0, 0)
  
    # Status bar
    @statusbar = FXStatusBar.new(self,
				 LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|
				 STATUSBAR_WITH_DRAGCORNER)


    create_mdiclient
    create_menus
    create_toolbar(toolbar)
    new_map

    self.connect(SEL_CLOSE, method(:close_cb))
    show
  end

  def initialize(app)
    super(app, eval("\"#{TITLE}\""), nil, nil, DECOR_ALL, 0, 0, 800, 600)
  
    @colors = nil
    @mdimenu = nil

    create_widgets

    # Trap CTRL-C signals and exit nicely
    trap('SIGINT') {
      close_cb
      exit(0)
    }
  end

  def close_cb(*args)
      exit = true
      @maps.each { |m| 
	if not m.close_cb
	  exit = false
	  break
	else
	  @maps.delete(m)
	end
      }
      self.close if exit
  end

end

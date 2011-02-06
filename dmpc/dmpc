#!/bin/dash
### DMPC (MPD Actions) ###########
# Version 0.2.3 by Scott Garrett #
# Wintervenom [(at)] gmail.com   #
##################################
# Changelog                      #
# 0.2.1   + Minor bug-fixes.     #
# 0.2.2   + Deal with spaces in  #
#           playlist filenames.  #
# 0.2.3   + Read DMENU_OPTIONS   #
#           for color settings.  #
#         + Don't depend on Exo  #
#           anymore.             #
##################################
# TODO: Directory chooser for    #
# music/playlist directories.    #
##################################

###################
##### Globals #####
###################

# Path to the configuration file.
config="$XDG_CONFIG_HOME/mpd-actions/settings.conf"

# Path to the current user's trash folder.
trash="$XDG_DATA_HOME/Trash/files"

# Path to the current user's MPD configuration file.
mpd_conf="$XDG_CONFIG_HOME/mpd/mpd.conf"

# File name for our backup playlist.
backup_playlist="zz.`basename "$0"`.saved"

# Dmenu command.
dm="dmenu -i $DMENU_OPTIONS"

# Menu items for the [Current Song] submenu.
menu_current='[Add to Playlist]
[Move to Trash]
[Open Directory]'

# Menu items for the [Search for Song] submenu.
menu_search='Title
Artist
Album
Genre'

#####################
##### Functions #####
#####################

# Feeding menu items and a prompt to Dmenu the regular way gets messy.
# To save sanity, this function makes it as simple as:
#   menu "Your Prompt" "Item A" ["Item B" "Item C" ...]
menu () {
  # We grab the prompt message...
  prompt="$1"
  # ...then shift to the next argument.
  shift
  # We will now iterate through the rest of the arguments...
  until [ -z "$1" ]; do
    # ...add the menu item to the list we're going to feed to Dmenu...
    items="$items$1\n"
    # ...move on to the next argument...
    shift
  # ...and keep doing this until there are no more arguments.
  done
  # Now that we're done with that, we can feed the hungry Dmenu.
  # We feed the list though `head -c-1` first, to get rid of that
  # trailing newline, since Dmenu isn't smart enough to ignore it.
  echo "$items" | head -c-1 | $dm -p "$prompt"
}

# We can use menu() function for yes/no prompts.
confirm () {
  menu "$*" 'No' 'Yes'
}

# And we can even use it for a simple notice.
alert () {
  menu "$*" 'OK'
}

# A function to prompt the user for a playlist.  But it does so much
# more than that!  It will also let the user create new playlists and
# populate them with the current MPD playlist or his or her entire
# music library.  It will also let the user play and delete playlists.
playlist_manager () {
  # We'll loop forever (unless something breaks out) so when the user
  # wants to return to the playlist selection, he or she does not have
  # to restart the whole program.
  while :; do
    # We ask the user to choose a playlist.  We get our playlist list
    # from MPC, sort this, and feed the list as arguments to menu().
    # We put the answer from the user into $playlist.
    playlist=`menu 'Choose a playlist:' "$(mpc lsplaylists | sort)" '[Create New]'`
    # If the user chose the create a new playlist...
    if [ "$playlist" = '[Create New]' ]; then
      # Ask him or her what he or she wishes to name it...
      playlist=`menu 'Enter name of new playlist:' $(mpc lsplaylists | sort)`
      # ...and if anything was said...
      if [ "$playlist" ]; then
        # ...we need to make sure that there's not already a file by
        # the name he or she gave us.
        if [ -f "$playlist_dir/$playlist.m3u" ]; then
          # If there is, ask the user if he or she wants to replace it.
          if [ "`confirm 'Replace existing playlist?'`" = 'Yes' ]; then
            # Get rid of it if they tell us "Yes."
            mpc rm "$playlist"
          fi
        fi
        # We check again to see if there's a file by the same name.
        # If the file is still there, then the user has already told
        # us "no" to replacing it, and we skip this.
        if [ ! -f "$playlist_dir/$playlist.m3u" ]; then
          # Otherwise, we ask if he or she wants to populate the new
          # playlist with something or leave it empty.
          action=`menu "Populate \"$playlist\"?" '[Leave Empty]' '[With MPD Playlist]' '[With Library]'`
          # If chosen to populate it with the current MPD playlist...
          if [ "$action" = '[With MPD Playlist]' ]; then
            # ...we make a new file containing the playlist header...
            echo "#EXTM3U" > "$playlist_dir/$playlist.m3u"
            # ...and get the list of the files MPD has on its playlist
            # and tack the path to the user's music library onto the
            # beginning of each entry so we have absolute paths.  We
            # then append this to the playlist file.
            mpc -f '%file%' playlist | sed "s:^:$music_dir/:" >> "$playlist_dir/$playlist.m3u"
          # If chosen to populate the playlist with the library...
          elif [ "$action" = '[With Library]' ]; then
            # ...we do the same thing as from the MPD playlist, except
            # we grab the list of files in the user's music library.
            echo "#EXTM3U" > "$playlist_dir/$playlist.m3u"
            mpc -f '%file%' listall | sed "s:^:$music_dir/:" > "$playlist_dir/$playlist.m3u"
          # Finally, if they chose to not populate the playlist...
          else
            # ...we'll just create an empty playlist.
            echo "#EXTM3U" > "$playlist_dir/$playlist.m3u"
          fi
        else
          # Forget the user selected anything so it won't get sent
          # to the caller by accident.
          unset playlist
        fi
      fi
    fi
    # If the user chose a playlist and not '[Create New]' ages ago...
    if [ "$playlist" ]; then
      # Ask him or her what is to be done with the playlist.
      action=`menu "$playlist:" '[Select]' '[Go Back]' '[Play]' '[Edit]' '[Delete]'`
      case "$action" in
        *'Play'*) # If the user wants to play it...
          load_playlist "$playlist"
          # Forget the user ever selected anything so that whoever
          # called this function won't try to do anything to the list
          # the user only wanted to play.  Actually, I could have just
          # said `break` here, and have been done with it.
          unset playlist
        ;;
        *'Delete'*) # If the user chose the delete the playlist...
          # Make sure he or she really wants to do this, and if yes,
          # kill it.
          [ "`confirm "Delete \"$playlist\"?"`" = 'Yes' ] && mpc rm "$playlist"
        ;;
        *'Edit'*)
          if which exo-open; then
            exo-open --launch TerminalEmulator vim "$playlist_dir/$playlist.m3u" &
          elif which urxvt; then
            urxvt -e vim "$playlist_dir/$playlist.m3u" &
          else
            xterm -e vim "$playlist_dir/$playlist.m3u" &
          fi
          unset playlist
          break
        ;;
        # If the user chose to do anything else, other than go back to
        # the playlist selection prompt, we break out of the `while`
        # loop.
        *'Back'*)
        ;;
        *)
          [ -z "$action" ] && unset playlist
          break
        ;;
      esac
    else
      # And if the user didn't choose a playlist, we break out of the
      # loop, assuming the user wants to exit.
      break
    fi
  done
  # Return whatever playlist (if any) the user selected to the caller.
  echo "$playlist"
}

# I could really do without making these next two functions.
# But it'll make the main code look more aeshetically pleasing to me.

check_for_mpc () {
  # If MPC does not adknowledge its existance, we'll assume the user
  # must not have it installed.  Yes, I could have used `which` here,
  # but I didn't.  So shush.
  if ! mpc > /dev/null; then
    alert 'MPC must be installed.'
    exit 1
  fi
}

exit_if_mpd_stopped () {
  if ! mpc | grep -qE 'playing|paused'; then
    # We obviously can't get any information when nothing is playing!
    alert 'You are not playing anything.'
    exit 1
  fi
}

# Grabs some information about the current song:
get_song_info () {
  mpc | grep -q '[stopped]' && song_title=`mpc --format '%title%' | head -1` || song_title='[MPD stopped.]'
  song_rpath=`mpc --format '%file%' | head -1`  # Relative path
  song_apath="$music_dir/$song_rpath"           # and absolute path.
}

save_config () {
  # Store the settings in a way that we can just source the config
  # when we want to recall them.
  echo "music_dir=\"$music_dir\"
playlist_dir=\"$playlist_dir\"
last_list_pos=\"$last_list_pos\"
last_time_pos=\"$last_time_pos\"" > "$config"
}

load_config () {
  # Create the configuration directory if it does not exist.
  mkdir -p "`dirname "$config"`"
  # Create the configuration file if it does not exist.
  touch "$config"  # You've been a naughty file.
  # Read in [source] the configuration.
  . "$config" 
  # If we don't have one set yet, ask where the user is keeping his or
  # her musical goods at.
  if [ -z "$music_dir" ] || [ ! -d "$music_dir" ]; then
    music_dir=`menu 'Path to your music library:'`
    # If the user didn't enter anything, assume they wanted to exit.
    [ -z "$music_dir" ] && exit
    # If we don't find the directory the user gave us (or it turns out
    # to be something else other than a directory), bitch about this...
    if [ ! -d "$music_dir" ]; then
      alert 'No such directory.'
      # ...and promptly exit.
      exit 1
    fi
  fi
  # Save this to our config file.
  save_config

  # Now, we do the same thing for the playlists directory.
  if [ -z "$playlist_dir" ] || [ ! -d "$playlist_dir" ]; then
    playlist_dir=`menu 'Path to your playlists:'`
    [ -z "$playlist_dir" ] && exit
    if [ ! -d "$playlist_dir" ]; then
      alert 'No such directory.'
      exit 1
    fi
  fi
  save_config
}

backup_playlist () {
  # Remember where we left off.
  last_list_pos=`mpc | sed -n 2p | cut -d'#' -f2 | cut -d'/' -f1`
  last_time_pos=`mpc | sed -n 2p | cut -d' ' -f5 | cut -d'/' -f1`
  save_config
  # Shift down backups of backups and get rid of the old backup
  # playlist, if it exists.
  [ -f "$playlist_dir/$backup_playlist.1.m3u" ] && mv "$playlist_dir/$backup_playlist.1.m3u" "$playlist_dir/$backup_playlist.2.m3u"
  if [ -f "$playlist_dir/$backup_playlist.m3u" ]; then
    mv "$playlist_dir/$backup_playlist.m3u" "$playlist_dir/$backup_playlist.1.m3u"
    mpc rm "$backup_playlist"
  fi
  # ...save the current MPD playlist over it...
  mpc save "$backup_playlist"
}

restore_playlist () {
  # Stop and clear the current MPD playlist...
  mpc stop
  mpc clear
  mpc load $backup_playlist
  # ...recall where we left last left off.
  load_config
  mpc play $last_list_pos
  mpc seek $last_time_pos
}

# Backs up current playlist, then loads and plays argument.
load_playlist () {
  backup_playlist
  mpc stop
  mpc clear
  mpc load "$1"
  mpc play
}

################
##### Main #####
################

# Check for MPC and load configuration.
check_for_mpc
load_config


while :; do
# Menu items for the main menu.
menu_main="[Current Song]
[Search for Song]
[Playlists]
[Toggle]
[Previous]
[Next]
[Seek -10s]
[Seek +10s]
[Replay]
[Random: `mpc | sed 's/volume://' | sed -n 3p | awk '{print $5}'`]
[Repeat: `mpc | sed 's/volume://' | sed -n 3p | awk '{print $3}'`]
[Single: `mpc | sed 's/volume://' | sed -n 3p | awk '{print $7}'`]
[Consume: `mpc | sed 's/volume://' | sed -n 3p | awk '{print $9}'`]
[Crossfade: `mpc crossfade | awk '{print $2}'`]
[Restore List]
[Backup List]
[Update Database]
[Restart Server]
[Set Directories]"

get_song_info
action=`menu "$song_title:" "$menu_main"`
case "$action" in
  *'Current'*) #[Current Song]
    exit_if_mpd_stopped
    get_song_info
    # Now, we ask the user what they want to do.
    action=`menu "$song_title:" "$menu_current"`
    case "$action" in
      *'Add'*) #[Add to Playlist]
        # We ask for a playlist to append to.
        # I'm lazy.  We'll re-use $action.
        action=`playlist_manager`
        [ -z "$action" ] && exit
        # We append the absolute path to the selected playlist...
        echo "$song_apath" >> "$playlist_dir/$action.m3u"
        # ...then sort the playlist, removing duplicates.
        sort -u "$playlist_dir/$action.m3u" -o "$playlist_dir/$action.m3u"
      ;;
      *'Trash'*) #[Move to Trash]
        # If the user really wants to...
        if [ "`confirm 'Delete playing song?'`" = 'Yes' ]; then
          # We remove the current song from the MPD playlist...
          mpc del 0
          # ...create the trash folder if it doesn't exist...
          mkdir -p "$trash"
          # ...and move the song to said trash folder.
          mv "$song_apath" "$trash"
        fi
      ;;
      *'Open'*) #[Open Directory]
        if which exo-open; then
          exo-open "`dirname "$song_apath"`" &
        elif which nautilus; then
          nautilus "`dirname "$song_apath"`" &
        elif which dolphin; then
          dolphin "`dirname "$song_apath"`" &
        elif which thunar; then
          thunar "`dirname "$song_apath"`" &
        else
          alert "Couldn't detect file manager."
        fi
      ;;
    esac
    break
  ;;
  *'Search'*)
    exact='off' # Exact match flag.
    append='off' # Append results flag.
    # Loop in case the user wants to do multiple searches.
    # Other actions can break out of this loop.
    while :; do
      # We ask the user what field to search.
      # Use a loop so he or she can toggle exact match.
      while :; do
        action=`menu 'Search:' "[Exact Match: $exact]" "[Append Results: $append]" "$menu_search"`
        case "$action" in
          *'[Exact'*)
            exact=`[ $exact = off ] && echo on || echo off`
          ;;
          *'[Append'*)
            append=`[ $append = off ] && echo on || echo off`
          ;;
          *)
            break
          ;;
        esac
      done
      [ -z "$action" ] && exit
      # Now, we ask what they want to search for.
      query=`menu 'Enter search query:'`
      [ -z "$query" ] && exit
      # We're going overwrite the results to the MPD playlist.
      # We don't want to just kill what the user has going on there,
      # so we will back his or her current playlist up and remember
      # which song and what time position MPD was at.
      backup_playlist
      if [ "$append" = 'off' ]; then
        last_item=1
        mpc stop
        mpc clear
      else
        last_item=$((`mpc | sed -n 2p | cut -d' ' -f2 | cut -d'/' -f2` + 1))
      fi
      # Search the MPD database for what the user seeks and add the
      # results to the MPD playlist.
      mpc `[ $exact = off ] && echo search || echo find` "$action" "$query" | mpc add
      mpc play $last_item
      # Give the user a chance to search again or restore their
      # playlist and preview the results.
      while :; do
        action=`menu "Preview: $(mpc -f '%title%' | head -1)" '[Continue]' '[Search Again]' '[Previous]' '[Next]' '[Skip -10s]' '[Skip +10s]' "[Random: $(mpc | sed -n 3p | awk '{print $6}')]" '[Restore Playlist]'`
        case "$action" in
          *'Previous'*)
            mpc prev
          ;;
          *'Next'*)
            mpc next
          ;;
          *'+10s'*)
            mpc seek +10
          ;;
          *'-10s'*)
            mpc seek -10
          ;;
          *'Random'*)
            mpc random
          ;;
          *)
            break
          ;;
        esac
      done
      [ "$action" != '[Continue]' ] && restore_playlist
      # If the user doesn't want to search again, break out of the
      # `while` loop.
      [ "$action" != '[Search Again]' ] && break
    done
  ;;
  *'Playlist'*) #[Playlists]
    # Since the playlist manager pretty much covers everything...
    action=`playlist_manager`
    [ -z "$action" ] && exit
    load_playlist "$action"
    break
  ;;
  *'Toggle'*)
    mpc toggle
  ;;
  *'Previous'*)
    mpc prev
  ;;
  *'Next'*)
    mpc next
  ;;
  *'+10s'*)
    mpc seek +10
  ;;
  *'-10s'*)
    mpc seek -10
  ;;
  *'Replay'*)
    mpc stop
    mpc play
  ;;
  *'Random'*)
    mpc random
  ;;
  *'Repeat'*)
    mpc repeat
  ;;
  *'Single'*)
    mpc single
  ;;
  *'Consume'*)
    mpc consume
  ;;
  *'Crossfade'*)
    action=`menu 'Crossfade time:' 0 1 2 3 4 5 6 7 8 9 10`
    [ -z "$action" ] && exit
    mpc crossfade "$action"
  ;;
  *'Restore'*)
    [ "`confirm 'Restore last saved playlist?'`" = 'Yes' ] && restore_playlist
  ;;
  *'Backup'*)
    [ "`confirm 'Backup current playlist?'`" = 'Yes' ] && backup_playlist 
  ;;
  *'Update'*) #[Update Database]
    mpc update
    alert 'Database update started.'
  ;;
  *'Restart'*) #[Restart Server]
    if [ "`confirm 'Are you sure?'`" = 'Yes' ]; then
      notify-send -t 5000 'Restarting MPD server, please wait...'
      # Ask MPD to politely commit suicide.
      mpd --kill "$mpd_conf"
      # Wait patiently.
      sleep 5
      # See if MPD is still alive.
      mpd_pid=`pidof mpd`
      if [ "$mpd_pid" ]; then
        # If it is, commit murder.
        kill -9 $mpd_pid
        sleep 1
      fi
      # Resurrect the dead.
      mpd "$mpd_conf"
      alert 'MPD server restarted.'
    fi
  ;;
  *'Directories'*) #[Set Directories]
    if [ "`confirm 'Are you sure?'`" = 'Yes' ]; then
      # Forget what we know about where the user's music and playlists
      # are and ask again.
      rm "$config"
      unset music_dir
      unset playlist_dir
      load_config
    fi
  ;;
  *)
    break
  ;;
esac
done

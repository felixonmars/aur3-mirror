#!/bin/bash

about="
### Dmen File Manager #############################################
# Version 0.1.2 by Scott Garrett <wintervenom [(a)] archlinux.us> #
###################################################################"

### Changelog #####################################################
# 0.1.0 # * Initial version                                       #
# 0.1.1 # + Option 'Open last used dir'                           #
#       # + Options 'Always open dirs' and 'Always open files'    #
# 0.1.2 # + Config moved to $XDG_CONFIG_HOME                      #
#       # + Options for dmenu styling                             #
#       # + Option to change executor                             #
#       # + Option to open file manager in current directory      #
#       # + Plugins support                                       #
###################################################################

function defaults {
    show_hidden=0
    show_backup=0
    always_open_files=0
    always_open_dirs=0
    open_last=1
    dmenu_caseinsens=1
    dmenu_onbottom=1
    dmenu_bg='#000000'
    dmenu_fg='#9999CC'
    dmenu_sbg='#000066'
    dmenu_sfg='#FFFFFF'
    executor='exo-open'
    editor='geany'
    filemanager='thunar'
}

function saveconfig {
    echo "show_hidden=$show_hidden
show_backup=$show_backup
always_open_dirs=$always_open_dirs
always_open_files=$always_open_files
open_last=$open_last
dmenu_caseinsens=$dmenu_caseinsens
dmenu_onbottom=$dmenu_onbottom
dmenu_bg='$dmenu_bg'
dmenu_fg='$dmenu_fg'
dmenu_sbg='$dmenu_sbg'
dmenu_sfg='$dmenu_sfg'
editor=\"$editor\"
executor='exo'
filemanager=\"$filemanager\"
last_dir=\"$(pwd)\"
" > "$config"
}

function setmenu {
    menu="$menu $([ "$dmenu_caseinsens" == '1' ] && echo '-i') $([ "$dmenu_onbottom" == '1' ] && echo '-b') -nb $dmenu_bg -nf $dmenu_fg -sb $dmenu_sbg -sf $dmenu_sfg"
}

file=1
config_file="preferences"
config_dir="$XDG_CONFIG_HOME/dmenfm"
config="$config_dir/$config_file"
plugins_dir="$XDG_CONFIG_HOME/dmenfm/plugins"
menu='dmenu'

[ ! -d "$config_dir" ] && mkdir "$config_dir"
[ ! -d "$plugins_dir" ] && mkdir "$plugins_dir"
[ ! -d "$plugins_dir/browser" ] && mkdir "$plugins_dir/browser"
[ ! -d "$plugins_dir/operations" ] && mkdir "$plugins_dir/operations"
[ ! -d "$plugins_dir/preferences" ] && mkdir "$plugins_dir/preferences"
[ -e "$HOME/.dmanfs" ] && mv "$HOME/.dmanfs" "$config"

defaults
touch "$config"
source "$config"
setmenu
[[ "$last_dir" && "$open_last" == 1 ]] && cd "$last_dir"

while [ "$file" ]; do
    file=$((echo -e '..\n.'; ls $([[ "$show_hidden" == '1' ]] && echo '-A') $([[ "$show_backup" == '1' ]] && echo '-B'); echo -e "[Preferences]\n[Open in $filemanager]"; ls -B "$plugins_dir/browser") | $menu -p "$(basename $(pwd))")
    if [ "$file" ]; then
        if [ -e "$file" ]; then
            if $([ -d "$file" ] && [[ "$always_open_dirs" != '1' && "$file" != "." && "$file" != ".." ]]) || $([ -f "$file" ] && [[ "$always_open_files" != '1' ]]); then
                owd=$(pwd)
                opt=$((echo 'Open'; ([ -f "$file" ] && echo 'Edit'); echo -e 'Copy\nMove\nRename\nDelete'; ls -B "$plugins_dir/operations") | $menu -p "<$file>")
            else
                opt='Open'
            fi
            case "$opt" in
                'Open')
                    if [ -d "$file" ]; then
                        cd "$file"
                    else
                        if [ "$executor" ] && which "$executor" &> /dev/null; then
                            exec "$executor" "$owd/$file" &
                            unset file
                        elif which exo-open &> /dev/null; then
                            exo-open "$owd/$file"
                            unset file
                        elif gnome-open &> /dev/null; then
                            gnome-open "$owd/$file"
                            unset file
                        else
                            xmessage 'No executor found.  Set one in [Preferences].'
                        fi
                    fi
                ;;
                'Edit')
                    if [ "$editor" ] && which "$editor" &> /dev/null; then
                        exec "$editor" "$owd/$file" &
                        unset file
                    elif which geany &> /dev/null; then
                        exec geany "$owd/$file"
                        unset file
                    elif which gedit &> /dev/null; then
                        exec gedit "$owd/$file"
                        unset file
                    elif which kwrite &> /dev/null; then
                        exec kwrite "$owd/$file"
                        unset file
                    else
                        xmessage 'No editor found.  Set one in [Preferences].'
                    fi
                ;;
                'Copy')
                    cdir=1
                    while [ "$cdir" ]; do
                        cdir=$((echo -e '..\n.'; ls $([[ "$show_hidden" == 1 ]] && echo "-A") $([[ "$show_backup" == 1 ]] && echo "-B") -d */) | $menu -p "Copy <$file> to:")
                        if [[ "$cdir" ]]; then
                            opt=$(echo -e 'Open\nCopy' | $menu -p "Copy <$file> to <$cdir>:")
                            if [[ "$opt" == "Open" ]]; then
                                cd "$cdir"
                            elif [[ "$opt" == "Copy" ]]; then
                                echo "$file"
                                [ -e "$cdir/$file" ] && opt=$(echo -e "No\nYes" | $menu -p "Replace existing <$file>?")
                                [[ "$opt" == "Copy" || "$opt" == "Yes" ]] && cp -af "$owd/$file" "$cdir/$file"
                                unset cdir
                            fi
                        fi
                    done
                ;;
                'Move')
                    cdir=1
                    while [ "$cdir" ]; do
                        cdir=$((echo -e '..\n.' && ls $([[ "$show_hidden" == 1 ]] && echo "-A") $([[ "$show_backup" == 1 ]] && echo "-B") -d */) | $menu -p "Move <$file> to:")
                        if [[ "$cdir" ]]; then
                            opt=$(echo -e 'Open\nMove' | $menu -p "Move <$file> to <$cdir>:")
                            if [[ "$opt" == "Open" ]]; then
                                cd "$cdir"
                            elif [[ "$opt" == "Move" ]]; then
                                echo "$file"
                                [ -e "$cdir/$file" ] && opt=$(echo -e "No\nYes" | $menu -p "Replace existing <$file>?")
                                [[ "$opt" == "Move" || "$opt" == "Yes" ]] && mv -f "$owd/$file" "$cdir/$file"
                                unset cdir
                            fi
                        fi
                    done
                ;;
                'Rename')
                    opt=$(echo "" | $menu -p "Rename <$file> to:")
                    [ "$opt" ] && mv -f "$file" "$opt"
                ;;
                'Delete')
                    opt=$(echo -e "No\nYes" | $menu -p "Really delete <$file>?")
                    [[ "$opt" == "Yes" ]] && rm -rf "$file"
                ;;
                *) [ "$opt" ] && [ -e "$plugins_dir/operations/$opt" ] && source "$plugins_dir/operations/$opt" ;;
            esac
        elif [[ "$file" =~ '[Open in' ]]; then
            which "$filemanager" &> /dev/null && exec "$filemanager" . &
            unset file
        elif [[ "$file" == '[Preferences]' ]]; then
            opt=1
            while [ "$opt" ]; do
                opt=$((echo "[$show_hidden] Show hidden files
[$show_backup] Show backup files
[$always_open_dirs] Always open dirs
[$always_open_files] Always open files
[$open_last] Open last used dir
[$dmenu_caseinsens] Case-insensitive
[$dmenu_onbottom] Display on bottom
[$dmenu_bg] Background
[$dmenu_fg] Foreground
[$dmenu_sbg] Selected background
[$dmenu_sfg] Selected foreground
[$executor] Executor
[$editor] Editor
[$filemanager] File manager
Set defaults
About"; ls -B "$plugins_dir/preferences") | $menu -p "Preferences")
                case "$opt" in
                    *'hidden files') (('show_hidden=!show_hidden')) ;;
                    *'backup dirs') (('show_backup=!show_backup')) ;;
                    *'open dirs') (('always_open_dirs=!always_open_dirs')) ;;
                    *'open files') (('always_open_files=!always_open_files')) ;;
                    *'used dir') (('open_last=!open_last')) ;;
                    *'insensitive') (('dmenu_caseinsens=!dmenu_caseinsens')) ;;
                    *'on bottom') (('dmenu_onbottom=!dmenu_onbottom')) ;;
                    *'Background')
                        opt=$(echo -e "$dmenu_bg\n[Default]" | $menu -p "Background:")
                        [[ "$opt" == '[Default]' ]] && opt='000000'
                        [ "$opt" ] && dmenu_bg="$opt"
                        dmenu_test=1
                    ;;
                    *'Foreground')
                        opt=$(echo -e "$dmenu_fg\n[Default]" | $menu -p "Foreground:")
                        [[ "$opt" == '[Default]' ]] && opt='9999CC'
                        [ "$opt" ] && dmenu_fg="$opt"
                        dmenu_test=1
                    ;;
                    *'Selected background')
                        opt=$(echo -e "$dmenu_bg\n[Default]" | $menu -p "Selected background:")
                        [[ "$opt" == '[Default]' ]] && opt='000066'
                        [ "$opt" ] && dmenu_sbg="$opt"
                        dmenu_test=1
                    ;;
                    *'Selected foreground')
                        opt=$(echo -e "$dmenu_bg\n[Default]" | $menu -p "Selected foreground:")
                        [[ "$opt" == '[Default]' ]] && opt='FFFFFF'
                        [ "$opt" ] && dmenu_sfg="$opt"
                        dmenu_test=1
                    ;;
                    *'Executor')
                        opt=$(echo -e "$executor\n[Default]" | $menu -p "Executor:")
                        [[ "$opt" == '[Default]' ]] && opt='exo'
                        [ "$opt" ] && editor="$opt"
                    ;;
                    *'Editor')
                        opt=$(echo -e "$editor\n[Default]" | $menu -p "Editor:")
                        [[ "$opt" == '[Default]' ]] && opt='geany'
                        [ "$opt" ] && editor="$opt"
                    ;;
                    *'File manager')
                        opt=$(echo -e "$filemanager\n[Default]" | $menu -p "File manager:")
                        [[ "$opt" == '[Default]' ]] && opt='thunar'
                        [ "$opt" ] && filemanager="$opt"
                    ;;
                    *'defaults')
                        opt=$(echo -e "No\nYes" | $menu -p "Really set defaults?")
                        [[ "$opt" == "Yes" ]] && defaults
                    ;;
                    'About') xmessage -maxWidth 80 -maxHeight 80 "$about" ;;
                    *)
                        [ "$opt" ] && [ -e "$plugins_dir/preferences/$opt" ] && source "$plugins_dir/preferences/$opt"
                    ;;
                esac
            done
            menu="$menu $([ "$dmenu_caseinsens" == '1' ] && echo '-i') $([ "$dmenu_onbottom" == '1' ] && echo '-b') -nb $dmenu_bg -nf $dmenu_fg -sb $dmenu_sbg -sf $dmenu_sfg"
            if [[ "$dmenu_test" == '1' ]]; then
                if [[ "OK" != "$(echo 'OK' | $menu -p 'Dmenu settings changed.')" ]]; then
                    defaults
                    source "$config"
                    setmenu
                    echo 'OK' | $menu -p 'Error in Dmenu settings.  Reverted.'
                fi
            fi
            saveconfig
        elif [ -e "$plugins_dir/browser/$file" ]; then
            source "$plugins_dir/browser/$file"
        fi
    fi
done

saveconfig

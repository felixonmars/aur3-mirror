#!/bin/sh

if [ -d ~/.limbo ]; then
        # .limbo folder exists, assuming configuration is ok and launching LIMBO...
        export WINEPREFIX=~/.limbo/limbo
        cd ~/.limbo/limbo/drive_c/Program\ Files/limbo/
        export WINEDEBUG=-all
        wine limbo.exe

else
        echo ".limbo folder does not exist, configuring LIMBO, please wait..."

        # create wineprefix
        mkdir ~/.limbo
        export WINEARCH=win32
        export WINEPREFIX=~/.limbo/limbo
        wineboot

        # configure wineprefix

        # symlink sounds
        cd ~/.limbo/limbo/drive_c/Program\ Files/
        mkdir -p limbo/data/audio/pc
        cd limbo/data/audio/pc
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/145441027.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/217485067.wav
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/288041556.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/351312017.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/36509593.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/386678257.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/410947880.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/54189208.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/574929999.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/58923886.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/66327209.wav
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/714585267.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/721828432.wav
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/744911790.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/77911966.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/932068112.ogg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/Init.bnk
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/l_default.bnk
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/data/audio/pc/l_intro.bnk

        # symlink pictures
        cd ~/.limbo/limbo/drive_c/Program\ Files/limbo
        mkdir -p titledata/bootscreen
        cd titledata/bootscreen
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/dot.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/limbo_title.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_br.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_de.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_es.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_fr.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_it.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_ja.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_ko.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_pl.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_pt.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_ru.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_sz.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_tr.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_uk.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/loading_zh.png
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/titledata/bootscreen/pc_logo.png

        # symlink exe, pkg
        cd ~/.limbo/limbo/drive_c/Program\ Files/limbo
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/limbo_boot.pkg limbo_boot.pkg
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/limbo.exe limbo.exe
        ln -s /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/limbo_runtime.pkg limbo_runtime.pkg

        # copy settings.txt for per-user configuration
        cp /opt/limbo/support/limbo/drive_c/Program\ Files/limbo/settings.txt settings.txt
        
        # install directX
        # seems not needed
        #winetricks d3dx9
        
        # disable creation of .desktop files by default
        echo -e "[HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides]\n\"winemenubuilder.exe\"=\"\"\n" | wine regedit -
        
        # disable "Allow the window manager to decorate the windows" by default for better performances in fullscreen
        echo -e "[HKEY_CURRENT_USER\\Software\\Wine\\X11 Driver\\]\n\"Decorated\"=\"N\"\n" | wine regedit -
        
        # language choice - need zenity
        if [ -f /usr/bin/zenity ]; then
                lang=`zenity --list \
                --title="Choose LIMBO language" \
                --text="It's the first time you run LIMBO, please select your language :" \
                --column="N" --column="Language" \
                sz "Chinese - Simplified (简体字)" \
                zh "Chinese - Traditional (繁體字)" \
                uk "English (English)" \
                fr "French (Français)" \
                de "German (Deutsch)" \
                it "Italian (Italiano)" \
                ja "Japanese (日本語)" \
                ko "Korean (한국어)" \
                pl "Polish (język polski)" \
                pt "Portuguese (Português)" \
                br "Portuguese-Brazil (Português brasileiro)" \
                ru "Russian (русский язык)" \
                es "Spanish (Español)" \
                tr "Turkish (Türkçe)"`

                if test -n "$lang"; then
                        echo "
# Override system language
# Options are: fr, zh, pt, uk, de, ko, it, es, ja, br, pl, ru, sz, tr
language = \""$lang"\"
" >> ~/.limbo/limbo/drive_c/Program\ Files/limbo/settings.txt
                fi
        fi
        
        # launch LIMBO
        export WINEDEBUG=-all
        wine ~/.limbo/limbo/drive_c/Program\ Files/limbo/limbo.exe


fi


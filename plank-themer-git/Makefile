# Variables
_plank1 = $(HOME)/.config/plank/dock1
_dest = build
_install = /usr/share/plank-themer

all: 
	$(MAKE) plank-themer

plank-themer:
	# Create build directory and import files
	mkdir -p $(_dest)/theme_index/{plank-themer-ondock,updater-icon,theme-icons}
	cp -a theme_index/updater-icon/*.svg $(_dest)/theme_index/updater-icon/
	cp -a theme_index/updater-icon/*.svg $(_dest)/theme_index/theme-icons/
	cp -a plank-themer.sh $(_dest)/theme_index/
	ls /usr/share/plank/themes > $(_dest)/theme_index/themes.list
	# TODO: Ask for confirmation to install community themes
	ls themes-repo/Themes/ >> $(_dest)/theme_index/themes.list
	# Create new .desktop files for each theme
	while IFS= read -r file; \
		do \
			echo \[Desktop Entry\] >> $(_dest)/theme_index/plank-themer-ondock/$$file.desktop; \
			echo Type=Application >> $(_dest)/theme_index/plank-themer-ondock/$$file.desktop; \
			echo Terminal=false >> $(_dest)/theme_index/plank-themer-ondock/$$file.desktop; \
			echo Name="$$file" >> $(_dest)/theme_index/plank-themer-ondock/$$file.desktop; \
			echo Icon=$(_install)/theme_index/theme-icons/plank_theme.svg >> $(_dest)/theme_index/plank-themer-ondock/$$file.desktop; \
			echo Exec=$(_install)/theme_index/$$file.sh >> $(_dest)/theme_index/plank-themer-ondock/$$file.desktop; \
		done < $(_dest)/theme_index/themes.list
	# Create new .sh application scripts for each theme
	while IFS= read -r file; \
		do \
			echo "#!/bin/bash" > $(_dest)/theme_index/$$file.sh; \
			echo sed -i \'s/Theme=.*$$/Theme=$$file/g\' $(_plank1)/settings >> $(_dest)/theme_index/$$file.sh; \
		done < $(_dest)/theme_index/themes.list
	# Create (re)inital setup .desktop
	echo \[Desktop Entry\] > $(_dest)/theme_index/plank-themer.desktop
	echo Type=Application >> $(_dest)/theme_index/plank-themer.desktop
	echo Terminal=false >> $(_dest)/theme_index/plank-themer.desktop
	echo Name="Plank themer" >> $(_dest)/theme_index/plank-themer.desktop
	echo Icon=$(_install)/theme_index/update-theme-list.svg >> $(_dest)/theme_index/plank-themer.desktop
	echo Exec=$(_install)/theme_index/plank-themer.sh >> $(_dest)/theme_index/plank-themer.desktop
	# Create new plank themer dockitem...
	echo \[PlankItemsDockItemPreferences\] > $(_dest)/theme_index/plank-themer-ondock.dockitem
	echo Launcher=file://$(_install)/theme_index/plank-themer-ondock >> $(_dest)/theme_index/plank-themer-ondock.dockitem

install: 
	$(MAKE) install-recursive

install-recursive:
	# TODO: Ask for confirmation to install community themes
	$(MAKE) install-plank-themes install-plank-themer
	
install-plank-themer:
	install -Dd $(DESTDIR)/$(_install)/theme_index/plank-themer-ondock $(DESTDIR)/$(_install)/theme_index/updater-icon $(DESTDIR)/$(_install)/theme_index/theme-icons $(DESTDIR)/usr/share/applications/
	install -Dm644 $(_dest)/theme_index/updater-icon/*.svg $(DESTDIR)/$(_install)/theme_index/updater-icon/
	install -Dm644 $(_dest)/theme_index/theme-icons/*.svg $(DESTDIR)/$(_install)/theme_index/theme-icons/
	install -Dm755 $(_dest)/theme_index/plank-themer-ondock/*.desktop $(DESTDIR)/$(_install)/theme_index/plank-themer-ondock/
	install -Dm755 $(_dest)/theme_index/*.sh $(DESTDIR)/$(_install)/theme_index/
	install -Dm755 $(_dest)/theme_index/plank-themer.desktop $(DESTDIR)/usr/share/applications/
	#install -Dm755 $(_dest)/theme_index/plank-themer.sh $(DESTDIR)/$(_install)/theme_index/
	install -Dm644 $(_dest)/theme_index/plank-themer-ondock.dockitem $(DESTDIR)/$(_install)/theme_index/

install-plank-themes:
	#install -Dd $(DESTDIR)/usr/share/plank/themes
	for i in themes-repo/Themes/*/; \
		do \
			install -Dd $(DESTDIR)/usr/share/plank/themes/$$(basename $$i); \
			install -Dm664 $$i/* $(DESTDIR)/usr/share/plank/themes/$$(basename $$i)/; \
		done


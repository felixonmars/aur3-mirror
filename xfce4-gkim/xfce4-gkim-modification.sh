#!bin/sh
if [ $1 == 'install' ] 
then
	echo "backup of uca.xml"
	cp ~/.config/Thunar/uca.xml ~/.config/Thunar/uca.xml_backup
	echo "modification of thunar menu in uca.xml"
	if [ $LANG == 'fr_FR.UTF-8' ] 
	then
		sed -i 's#</actions>#<action><icon></icon><name>Diaporama Gkim</name><command>/usr/share/GKIM/GKIM_slideshow %F</command><description>Creer un diaporama pour internet</description><patterns>*.JPG;*.jpg</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon>gnome-session-reboot</icon><name>Rotation auto</name><command>/usr/share/GKIM/GKIM_autorotate %F</command><description>Auto rotation des images suivant données EXIF</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon></icon><name>Gallerie Gkim</name><command>/usr/share/GKIM/GKIM_gallery %F</command><description>Creer une gallerie pour internet</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon></icon><name>Decouper le pdf</name><command>stapler split %f</command><description>Découpe en page le fichier pdf</description><patterns>*.pdf</patterns><other-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon></icon><name>Fusionner pdf</name><command>/usr/share/GKIM/GKIM_fusionpdf %F</command><description>Fusionne les fichiers pdf en un seul</description><patterns>*.pdf</patterns><other-files/><text-files/></action></actions>#g' ~/.config/Thunar/uca.xml
   	sed -i 's#</actions>#<action><icon></icon><name>Album Gkim</name><command>/usr/share/GKIM/GKIM_album %F</command><description>Creer un album pdf</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
   	sed -i 's#</actions>#<action><icon></icon><name>Gkim resize</name><command>/usr/share/GKIM/GKIM_resize %F</command><description>Resize image</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
   else
		sed -i 's#</actions>#<action><icon></icon><name>Gkim slideshow</name><command>/usr/share/GKIM/GKIM_slideshow %F</command><description>Gkim make slideshow</description><patterns>*.JPG;*.jpg</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon>gnome-session-reboot</icon><name>auto rotate</name><command>/usr/share/GKIM/GKIM_autorotate %F</command><description>auto rotate image with EXIF informations</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon></icon><name>Gkim gallery</name><command>/usr/share/GKIM/GKIM_gallery %F</command><description>Make gallery</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon></icon><name>splitter pdf</name><command>stapler split %f</command><description>Split the pdf file</description><patterns>*.pdf</patterns><other-files/></action></actions>#g' ~/.config/Thunar/uca.xml
		sed -i 's#</actions>#<action><icon></icon><name>fusion pdf</name><command>/usr/share/GKIM/GKIM_fusionpdf %F</command><description>Fusion pdf file</description><patterns>*.pdf</patterns><other-files/><text-files/></action></actions>#g' ~/.config/Thunar/uca.xml
   	sed -i 's#</actions>#<action><icon></icon><name>Gkim album</name><command>/usr/share/GKIM/GKIM_album %F</command><description>Create pdf album</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
   	sed -i 's#</actions>#<action><icon></icon><name>Gkim resize</name><command>/usr/share/GKIM/GKIM_resize %F</command><description>Resize image</description><patterns>*</patterns><image-files/></action></actions>#g' ~/.config/Thunar/uca.xml
   	
   fi
fi

if [ $1 == 'remove' ] 
then
	echo "restauration of uca.xml's backup "
	mv ~/.config/Thunar/uca.xml_backup ~/.config/Thunar/uca.xml

fi

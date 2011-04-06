#!/bin/bash 
DIR="/usr/share/icons/AwOken"
CONFIG_FILE="$DIR/.AwOkenrc"
HOMEDIR="${DIR}"
folder_type='s11'
start_here='arch4'
trash_type='trash2'
color_type='no-color'
gedit_type='gedit2'
computer_type='computer2'
home_type='home2'
FOLDER='blue'

customize_awoken()
{
if [ $2 ]; then
	ICONSDIR=$2
else
	ICONSDIR=${DIR}
fi

cd "${HOMEDIR}"

case $1 in
	folder-*)

		TIPO=${1##folder-}
		TARGET_KEY="folder_type"

		echo "Changing folder type to $TIPO..."
	
	cd $ICONSDIR/clear/128x128/places/$TIPO/
	for f in *; do
		cd $HOMEDIR/clear/128x128/places
		ln -fs $HOMEDIR/clear/128x128/places/$TIPO/$f $f
		cd $ICONSDIR/clear/128x128/places/$TIPO/
	done

	cd $ICONSDIR/clear/24x24/places/$TIPO/
	for f in *; do
		cd $HOMEDIR/clear/24x24/places
		ln -fs $HOMEDIR/clear/24x24/places/$TIPO/$f $f
		cd $ICONSDIR/clear/24x24/places/$TIPO/
	done


		cd $HOMEDIR/clear/128x128/places/$TIPO
		ln -fs $HOMEDIR/clear/128x128/places/s11-folders/$FOLDER".png" "folder.png"
		cd $HOMEDIR/clear/24x24/places/$TIPO
		ln -fs $HOMEDIR/clear/24x24/places/s11-folders/$FOLDER".png" "folder.png"
	;;

	start-here*)

		TIPO=${1##start-here-}
		TARGET_KEY="start_here"

		echo "Changing start here logo to $TIPO..."

		cd clear/128x128/places
		ln -fs ../start-here/$1.png start-here.png
		cd ../../../	
	
		cd clear/24x24/places
		ln -fs ../start-here/$1.png start-here.png
		cd ../../../	
	;;	
	
	trash*)

		TIPO=$1
		TARGET_KEY="trash_type"

		echo "Changing trash icon to $TIPO..."

		cd clear/128x128/places
		ln -fs user-$1.png user-trash.png
		ln -fs user-$1-full.png user-trash-full.png
		cd ../../../
		cd clear/24x24/places
		ln -fs user-$1.png user-trash.png
		ln -fs user-$1-full.png user-trash-full.png
		cd ../../../
	;;
	
	no-color)

		TIPO=$1
		TARGET_KEY="color_type"

		echo "Changing color type to $TIPO..."

		cd clear/128x128/actions
		for i in *2.png; do
			if [ $i != viewmag2.png ]; then
				ln -fs $i ${i%2.*}.png
			fi
		done
		
		cd ../apps
		for i in *2.png; do
			if [ $i = wincloser32.png -o $i = texmaker32x32.png -o $i = texmaker22x22.png -o $i = quake2.png -o $i = netbeans2.png \
			-o $i = glade-2.png -o $i = gnome-robots2.png -o $i = kexi-2.png -o $i = kexi2.png -o $i = glade2.png -o $i = gnobots2.png \
			-o $i = config-date2.png -o $i = blueclock32.png -o $i = glippy2.png -o $i = it.vodafone* -o $i = nm-stage01-connecting02.png \
			-o $i = nm-stage01-connecting12.png -o $i = nm-stage02-connecting02.png -o $i = nm-stage02-connecting12.png \
			-o $i = nm-stage03-connecting02.png -o $i = nm-stage03-connecting12.png -o $i = ubuntuone-client2.png -o $i = onboard2.png ]
			then
			:
			else
				ln -fs $i ${i%2.*}.png
			fi
		done
		cd ../categories
		for i in *2.png; do
			ln -fs $i ${i%2.*}.png
		done
		cd ../devices
		for i in *2.png; do
			ln -fs $i ${i%2.*}.png
		done
		cd ../places
		for i in *2.png; do
			if [ $i = folder-linux2.png -o $i = user-trash2.png ]; then
			:
			else
				ln -fs $i ${i%2.*}.png
			fi
		done
		cd ../../../
		cd clear/24x24/actions
		for i in *2.png; do
			if [ $i != viewmag2.png ]; then
				ln -fs $i ${i%2.*}.png
			fi
		done
		cd ../apps
		for i in *2.png; do
			if [ $i = wincloser32.png ] || [ $i = texmaker32x32.png ] || [ $i = texmaker22x22.png ] || [ $i = quake2.png ] || [ $i = netbeans2.png ] || [ $i = glade-2.png ] || [ $i = gnome-robots2.png ] ||  [ $i = kexi-2.png ] || [ $i = kexi2.png ] ||  [ $i = glade2.png ] || [ $i = gnobots2.png ] || [ $i = config-date2.png ] || [ $i = blueclock32.png ] || [ $i = glippy2.png ] || [ $i = it.vodafone* ] || [ $i = nm-stage01-connecting02.png ] || [ $i = nm-stage01-connecting12.png ] || [ $i = nm-stage02-connecting02.png ] || [ $i = nm-stage02-connecting12.png ] || [ $i = nm-stage03-connecting02.png ] || [ $i = nm-stage03-connecting12.png ] || [ $i = ubuntuone-client2.png ] || [ $i = onboard2.png ]; then
			:
			else
				ln -fs $i ${i%2.*}.png
			fi
		done
		cd ../categories
		for i in *2.png; do
			ln -fs $i ${i%2.*}.png
		done
		cd ../devices
		for i in *2.png; do
			ln -fs $i ${i%2.*}.png
		done
		cd ../places
		for i in *2.png; do
			if [ $i = folder-linux2.png ] || [ $i = user-trash2.png ]; then
			:
			else
				ln -fs $i ${i%2.*}.png
			fi
		done
	;;

	gedit*)

		TIPO=$1
		TARGET_KEY="gedit_type"

		echo "Changing gedit icon to $TIPO..."

		cd clear/128x128/apps
		ln -fs $TIPO.png gedit.png
		cd ../../../
		cd clear/24x24/apps
		ln -fs $TIPO.png gedit.png
	;;

	computer*)

		TIPO=$1
		TARGET_KEY="computer_type"
		NOME=${1:8}

		echo "Changing computer icon to $TIPO..."

		cd clear/128x128/places
		ln -fs user-desktop$NOME.png user-desktop.png
		cd ../../../
		cd clear/24x24/places
		ln -fs user-desktop$NOME.png user-desktop.png
	;;

	home*)

		TIPO=$1
		TARGET_KEY="home_type"

		echo "Changing home icon to $TIPO..."

		cd clear/128x128/places
		ln -fs user-$TIPO.png user-home.png
		cd ../../../
		cd clear/24x24/places
		ln -fs user-$TIPO.png user-home.png
	;;

esac
}

recover_awoken()
{
  VALORE="folder-"$folder_type
	customize_awoken $VALORE $ICONSDIR

  VALORE="start-here-"$start_here
	customize_awoken $VALORE $ICONSDIR

  VALORE=$trash_type
	customize_awoken $VALORE $ICONSDIR

  VALORE=$color_type
	customize_awoken $VALORE $ICONSDIR

  VALORE=$gedit_type
	customize_awoken $VALORE $ICONSDIR

  VALORE=$computer_type
	customize_awoken $VALORE $ICONSDIR

  VALORE=$home_type
	customize_awoken $VALORE $ICONSDIR	
}

post_install()
{
	
echo "  Customize awoken icon theme..."
recover_awoken 
echo "DONE!"

echo "  This icon theme comes with a customization script to tune some"
echo "  aspects of it such as folder or start here icons for example."
echo ""
echo "  The customizations are performed for the user running the script,"
echo "  so they wont afect the other users."
echo ""
echo "  To launch it simply run: "
echo "  awoken-icon-theme-customization"


echo "Installing AwOken icon theme for pidgin and wicd..."

# почистим backup директории, если они есть
[ -d /usr/share/pixmaps/pidgin/statusbk ] && rm -rf /usr/share/pixmaps/pidgin/statusbk
[ -d /usr/share/pixmaps/pidgin/traybk ] && rm -rf /usr/share/pixmaps/pidgin/traybk
[ -d /usr/share/pixmaps/wicd_bk ] && rm -rf /usr/share/pixmaps/wicd_bk

# сделаем backup старых иконок
mv /usr/share/pixmaps/pidgin/status /usr/share/pixmaps/pidgin/statusbk
mv /usr/share/pixmaps/pidgin/tray /usr/share/pixmaps/pidgin/traybk
mv /usr/share/pixmaps/wicd /usr/share/pixmaps/wicd_bk/

# закинем  новую тему
cp -rf "${DIR}"/extra/pidgin/status /usr/share/pixmaps/pidgin/
chmod -R 755 /usr/share/pixmaps/pidgin/status
chmod 755 /usr/share/pixmaps/pidgin/status/*
cp -rf "${DIR}"/extra/pidgin/tray /usr/share/pixmaps/pidgin/
chmod 755 /usr/share/pixmaps/pidgin/tray
chmod 755 /usr/share/pixmaps/pidgin/tray/*
cp -rf "${DIR}"/extra/wicd /usr/share/pixmaps/

echo DONE!
}

post_upgrade()
{
post_install $1
}


post_remove()
{
echo "Restore original icon theme for pidgin and wicd..."

# почитстим директории   приемники
rm -rf  /usr/share/pixmaps/pidgin/status
rm -rf  /usr/share/pixmaps/pidgin/tray
rm -rf /usr/share/pixmaps/wicd

# восстановим иконки из backup
mv /usr/share/pixmaps/pidgin/statusbk /usr/share/pixmaps/pidgin/status
mv /usr/share/pixmaps/pidgin/traybk /usr/share/pixmaps/pidgin/tray
mv /usr/share/pixmaps/wicd_bk /usr/share/pixmaps/wicd

echo DONE!
}

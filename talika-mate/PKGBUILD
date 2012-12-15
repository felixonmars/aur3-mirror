# Contributor: zhuqin
# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=talika
pkgname="${_pkgname}-mate"
pkgver=0.50
pkgrel=1
pkgdesc="MATE panel applet to switch between open windows using icons."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/talika/"
license=('GPL2')
depends=('mate-panel' 'libmatecomponent' 'mate-conf')
makedepends=('intltool')
install=$_pkgname.install
source=(http://sourceforge.net/projects/talika/files/$_pkgname-$pkgver/${_pkgname}_${pkgver}-1.tar.gz)
md5sums=('4108e366cc3de8247bd2baad3d9f2509')
options=('!docs')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

	DIR_LIST=`ls -c`" "$(for F in `ls -c src`;do echo "src/$F ";done;)

	echo $DIR_LIST
	for FILENAME in ${DIR_LIST}; do
		# check if its a folder
		if [ -f "${FILENAME}" ]; then
			echo "patching file $FILENAME"
			sed -i "s/panel-applet/mate-panel-applet/g" ${FILENAME}
			sed -i "s/panelapplet/matepanelapplet/g" ${FILENAME}
			sed -i "s/panel_applet/mate_panel_applet/g" ${FILENAME}
			sed -i "s/PANEL_APPLET/MATE_PANEL_APPLET/g" ${FILENAME}
			sed -i "s/PanelApplet/MatePanelApplet/g" ${FILENAME}

			sed -i "s/mate-mate-panel-applet/mate-panel-applet/g" ${FILENAME}
			sed -i "s/matematepanelapplet/matepanelapplet/g" ${FILENAME}
			sed -i "s/mate_mate_panel_applet/mate_panel_applet/g" ${FILENAME}
			sed -i "s/MATE_MATE_PANEL_APPLET/MATE_PANEL_APPLET/g" ${FILENAME}
			sed -i "s/MateMatePanelApplet/MatePanelApplet/g" ${FILENAME}

			sed -i "s/gnome/mate/g" ${FILENAME}
			sed -i "s/GNOME/MATE/g" ${FILENAME}
			sed -i "s/Gnome/Mate/g" ${FILENAME}

			sed -i "s/Metacity/Marco/g" ${FILENAME}
			sed -i "s/metacity/marco/g" ${FILENAME}
			sed -i "s/METACITY/MARCO/g" ${FILENAME}

			sed -i "s/Nautilus/Caja/g" ${FILENAME}
			sed -i "s/nautilus/caja/g" ${FILENAME}
			sed -i "s/NAUTILUS/CAJA/g" ${FILENAME}

			sed -i "s/Zenity/MateDialog/g" ${FILENAME}
			sed -i "s/zenity/matedialog/g" ${FILENAME}
			sed -i "s/ZENITY/MATEDIALOG/g" ${FILENAME}

			sed -i "s/MATE|Utilities/GNOME|Utilities/g" ${FILENAME}
			sed -i "s/MATE|Desktop/GNOME|Desktop/g" ${FILENAME}
			sed -i "s/MATE|Applets/GNOME|Applets/g" ${FILENAME}
			sed -i "s/MATE|Applications/GNOME|Applications/g" ${FILENAME}
			sed -i "s/MATE|Multimedia/GNOME|Multimedia/g" ${FILENAME}

			sed -i "s/libnotify/libmatenotify/g" ${FILENAME}
			sed -i "s/LIBNOTIFY/LIBMATENOTIFY/g" ${FILENAME}
			sed -i "s/Libnotify/Libmatenotify/g" ${FILENAME}

			sed -i "s/bonobo/matecomponent/g" ${FILENAME}
			sed -i "s/Bonobo/MateComponent/g" ${FILENAME}
			sed -i "s/BONOBO/MATECOMPONENT/g" ${FILENAME}
			sed -i "s/bonoboui/matecomponentui/g" ${FILENAME}
			sed -i "s/BONOBOUI/MATECOMPONENTUI/g" ${FILENAME}

			sed -i "s/gconf/mateconf/g" ${FILENAME}
			sed -i "s/GConf/MateConf/g" ${FILENAME}
			sed -i "s/GCONF/MATECONF/g" ${FILENAME}

			sed -i "s/pkmateconfig/pkgconfig/g" ${FILENAME}
			sed -i "s/PKMATECONFIG/PKGCONFIG/g" ${FILENAME}

			sed -i "s/gweather/mateweather/g" ${FILENAME}
			sed -i "s/GWeather/MateWeather/g" ${FILENAME}
			sed -i "s/GWEATHER/MATEWEATHER/g" ${FILENAME}

			sed -i "s/ORBit/MateCORBA/g" ${FILENAME}
			sed -i "s/orbit/matecorba/g" ${FILENAME}
			sed -i "s/ORBIT/MATECORBA/g" ${FILENAME}

			sed -i "s/panel-applet/mate-panel-applet/g" ${FILENAME}
			sed -i "s/panelapplet/matepanelapplet/g" ${FILENAME}
			sed -i "s/panel_applet/mate_panel_applet/g" ${FILENAME}
			sed -i "s/PANEL_APPLET/MATE_PANEL_APPLET/g" ${FILENAME}
			sed -i "s/PanelApplet/MatePanelApplet/g" ${FILENAME}

			sed -i "s/mate-mate-panel-applet/mate-panel-applet/g" ${FILENAME}
			sed -i "s/matematepanelapplet/matepanelapplet/g" ${FILENAME}
			sed -i "s/mate_mate_panel_applet/mate_panel_applet/g" ${FILENAME}
			sed -i "s/MATE_MATE_PANEL_APPLET/MATE_PANEL_APPLET/g" ${FILENAME}
			sed -i "s/MateMatePanelApplet/MatePanelApplet/g" ${FILENAME}

			sed -i "s/soup-mate/soup-gnome/g" ${FILENAME}
			sed -i "s/SOUP_TYPE_MATE_FEATURES_2_26/SOUP_TYPE_GNOME_FEATURES_2_26/g" ${FILENAME}
			sed -i "s/mateconfaudiosink/gconfaudiosink/g" ${FILENAME}
			sed -i "s/mateconfvideosink/gconfvideosink/g" ${FILENAME}

			sed -i "s/TAMATECONFIG/TAGCONFIG/g" ${FILENAME}
		fi
	done
    LIBS+=' -lm' ./configure --prefix=/usr \
	--libexecdir=/usr/lib/$_pkgname \
	--with-mateconf-schema-file-dir=/usr/share/mateconf/schemas || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}

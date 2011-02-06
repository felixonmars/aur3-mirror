#Mainteiner dieghen89 <dieghen89@gmail.com>

pkgname=ubuntuwintv
pkgver=0.7.1
pkgrel=3
pkgdesc="An utility to see a lot of TV and radio channels in streaming, written in python"
arch=('i686' 'x86_64')
url="http://ubuntuwin.altervista.org"
depends=('python2' 'vlc' 'zenity' 'gtk2' 'python-wnck' 'python-xlib')
#depends=('python' 'vlc' 'zenity' 'gtk2' 'gnome-python-desktop' 'python-xlib')
license=('GPL')
source=(${pkgname}_all-${pkgver}-0ubuntu1.tar.gz
	#http://ubuntuwin.altervista.org/fileadmin/user_upload/${pkgname}/all/${pkgname}_all-${pkgver}-0ubuntu1.tar.gz
	ubuntuwintv.desktop)
md5sums=('6ca07e81bf5bed94fde89ff81a2e41ce'
         'd2c1c4f2222d37f3c9cffa6a2def7a1b')
install=ubuntuwintv.install

build()
{
cd ${srcdir}/src/
sed -i -e "s:/usr/share/common-licenses/GPL-3:/usr/share/licenses/common/GPL3/license.txt:g" ubuntuwintv.py
sed -i -e "s|#!/usr/bin/python|#!/usr/bin/python2|g" ubuntuwintv.py
#sed -i -e "s:Categories=Utility;:Categories=GTK;AudioVideo;Video:g" ubuntuwintv.desktop
install -D -m755 ubuntuwintv.py "${pkgdir}/usr/bin/ubuntuwintv.py" || return 1
install -D -m644 ubuntuwintv.png "${pkgdir}/usr/share/icons/ubuntuwintv.png" || return 1
install -D -m644 ubuntuwintvlingua_it.txt "${pkgdir}/usr/share/ubuntuwintvlingua_it.txt" || return 1
install -D -m644 ../ubuntuwintv.desktop "${pkgdir}/usr/share/applications/ubuntuwintv.desktop" || return 
install -D -m644 ubuntuwintvlingua_en.txt "${pkgdir}/usr/share/ubuntuwintvlingua_en.txt" || return 1
#echo "Icon=/usr/share/icons/ubuntuwintv.png" >> ${pkgdir}/usr/share/applications/ubuntuwintv.desktop
# Install icons
cd icons
for i in *.png; do
  install -D -m644 $i "${pkgdir}/usr/share/ubuntuwintv/$i" || return 1
done
}

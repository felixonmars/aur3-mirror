# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

pkgname=gerix-wifi-cracker-ng
pkgver=r20
pkgrel=4
pkgdesc="A really complete GUI for Aircrack-NG which includes useful extras."
arch=('i686' 'x86_64')
url="http://backtrack.it/~emgent/hackstuff/Gerix-Wifi-Cracker-NG/"
license=('GPL2')
depends=('aircrack-ng' 'xterm' 'zenity' 'pyqt3')
optdepends=('gksu: to run gerix directly from menu')

# I don't know why but gerix is not avaible...
#source=('gerix.desktop' 'gerix' http://www.backtrack.it/~emgent/hackstuff/old_gerix_wifi_cracker_ng/download/${pkgname}-${pkgver}.tar)

# There is my downloaded gerix
source=('gerix.desktop' 'gerix' "${pkgname}-${pkgver}.tar")

md5sums=('c01945b0c73888f917491c6f2746ed3b'
         '7e1ee6cf123172fa34399fdd7e5ecea7'
         '991f87ae351389d43596f726b441200f')

m_appname=gerix

build() {
	cd $srcdir/${pkgname}-${pkgver}/
	mkdir -p $pkgdir/usr/share/$pkgname | return 0 
	mkdir -p $pkgdir/usr/bin | return 0
	mkdir -p $pkgdir/usr/share/applications | return 0
	make
	install -D -m755 $startdir/$m_appname $pkgdir/usr/bin/
	install -D -m644 $startdir/${m_appname}.desktop $pkgdir/usr/share/applications/
	install -D -m755 $srcdir/${pkgname}-${pkgver}/${m_appname}*.py $pkgdir/usr/share/$pkgname/ | return 0
	install -D -m644 $srcdir/${pkgname}-${pkgver}/${m_appname}*.ui $pkgdir/usr/share/$pkgname/ | return 0
	install -D -m644 $srcdir/${pkgname}-${pkgver}/${m_appname}*.ui.h $pkgdir/usr/share/$pkgname/ | return 0
	install -D -m644 $srcdir/${pkgname}-${pkgver}/${m_appname}*.png $pkgdir/usr/share/$pkgname/ | return 0
	return 0
}
 

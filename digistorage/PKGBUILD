#Contributor: Mihai Coman <mihai@m1x.ro>

pkgname=digistorage
pkgver=1
pkgrel=2
pkgdesc="Client for Digi Storage cloud service"
arch=('i686' 'x86_64')
depends=('libudev.so.0')
url="http://digistorage.rcs-rds.ro/"
license=('custom')
install=digistorage.install

if test "$CARCH" == x86_64; then
  source=('digistorage.tar.gz::https://storage.rcs-rds.ro/dl/apps/linux64')
  md5sums=('0b17f2b78f51f92a02f1e9a689703cc0'
	   'e1a1969c514ff3b412a4a8d147673a56')
fi

if test "$CARCH" == i686; then
  source=('digistorage.tar.gz::https://storage.rcs-rds.ro/dl/apps/linux32')
  md5sums=('fcb2073fc7207f6af861289d36b9cb5b'
         'e1a1969c514ff3b412a4a8d147673a56')
fi

source+=(digistorage.desktop)

PKGEXT='.pkg.tar'

package() {
	install -d ${pkgdir}/usr/share/digistorage
	install -d ${pkgdir}/etc/xdg/autostart
	install -d ${pkgdir}/usr/bin
	cp -R ${srcdir}/* ${pkgdir}/usr/share/digistorage/
	install -Dm644 ${srcdir}/icon.png ${pkgdir}/usr/share/pixmaps/digistorage.png
	install -Dm644 ${srcdir}/digistorage.desktop ${pkgdir}/usr/share/applications/digistorage.desktop
	install -Dm644 ${srcdir}/digistorage.desktop ${pkgdir}/etc/xdg/autostart/digistorage.desktop
	ln -s /usr/share/digistorage/storagegui ${pkgdir}/usr/bin/digistorage
	rm ${pkgdir}/usr/share/digistorage/digistorage.{desktop,tar.gz}
}

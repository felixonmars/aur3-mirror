# Maintainer: Alexey Khromov <zxalexis AT gmail.com>

pkgname=deadwood
pkgver=3.2.07
pkgrel=1
pkgdesc="resolver for MaraDNS server"
arch=('i686' 'x86_64')
url="http://maradns.org/"
depends=()
license=('custom')
source=(http://maradns.org/deadwood/stable/deadwood-$pkgver.tar.bz2
		'Deadwood.service')
md5sums=('7dcb8c131c12bd14fbec8ee741d74b22'
		 'b708f867586d2105cf49238a5a545b0d')

build() {
  cd ${srcdir}/deadwood-${pkgver}/src
  make
}

package() {
  cd ${srcdir}/deadwood-${pkgver}
  install -dm0755 $pkgdir/{etc/deadwood,usr/lib/systemd/system,usr/{sbin,share/{man/man{1,5,8},licenses/Deadwood,doc/Deadwood}}}
  chown 99:99 $pkgdir/etc/deadwood
  install -Dm755 src/Deadwood ${pkgdir}/usr/sbin/Deadwood
  install -Dm644 doc/Deadwood.1 ${pkgdir}/usr/share/man/man1
  install -Dm644 doc/dwood3rc ${pkgdir}/etc
  install -Dm644 Copying.txt ${pkgdir}/usr/share/licenses/Deadwood/
  install -Dm644 "${startdir}/Deadwood.service" ${pkgdir}/usr/lib/systemd/system/
  cp -r ${srcdir}/deadwood-${pkgver}/doc/* $pkgdir/usr/share/doc/Deadwood
}

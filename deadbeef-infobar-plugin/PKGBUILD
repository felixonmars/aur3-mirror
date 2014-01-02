pkgname=deadbeef-infobar-plugin
pkgver=1.4
pkgrel=1
pkgdesc="DeaDBeeF Infobar Plugin"
arch=("i686" "x86_64")
license=('GPL2')
url="https://bitbucket.org/dsimbiriatin/deadbeef-infobar"
depends=('deadbeef')
source=('https://bitbucket.org/dsimbiriatin/deadbeef-infobar/downloads/deadbeef-infobar-1.4.tar.gz')
md5sums=('SKIP')

build() {
 cd "${srcdir}/deadbeef-infobar-${pkgver}"
 make gtk2
 #make gtk3
}

package() {
  cd "${srcdir}/deadbeef-infobar-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/deadbeef/"
  install -D -m644 ${srcdir}/deadbeef-infobar-${pkgver}/gtk2/ddb_infobar_gtk2.so ${pkgdir}/usr/lib/deadbeef/ddb_infobar_gtk2.so
  #install -D -m644 ${srcdir}/deadbeef-infobar-${pkgver}/gtk3/ddb_infobar_gtk3.so ${pkgdir}/usr/lib/deadbeef/ddb_infobar_gtk3.so
}

# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=tile-windows
_realname=tile
pkgver=0.7.4
pkgrel=3
pkgdesc="Tool for tiling windows horizontally or vertically"
arch=('i686' 'x86_64')
url="http://www.sourcefiles.org/Utilities/Miscellaneous/tile_0.7.4.tar.gz.shtml"
license=('GPL')
depends=('libx11' 'libxcb' 'libsm')
install=${pkgname}.install
#source=('http://ftp.unixdev.net/pub/debian-udev/pool/main/t/tile/${_realname}_$pkgver.tar.gz')
source=("http://www.sourcefiles.org/Utilities/Miscellaneous/${_realname}_${pkgver}.tar.gz")
md5sums=('ee78feb2c825a1f12944cc701ce323b7')
sha256sums=('89bd41cb2abe813f7ab51ad7760cc17ff3a1ce7cd06ee283b42a79ec9ecb9317')

build() {
  cd "${srcdir}/${_realname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}"
  install -v -D -m 0755 tile "${pkgdir}/usr/bin/tile"
  install -v -D -m 0644 tile.1 "${pkgdir}/usr/share/man/man1/tile.1"
  install -v -D -m 0644 wmprofiles "${pkgdir}/etc/tile/wmprofiles"
  install -v -m 0644 rc "${pkgdir}/etc/tile/"
  install -v -D -m 0644 horizontal.desktop "${pkgdir}/usr/share/applications/horizontal.desktop"
  install -v -m 0644 vertical.desktop "${pkgdir}/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:

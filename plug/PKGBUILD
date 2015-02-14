# Maintainer: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=plug
pkgver=1.2
pkgrel=1
pkgdesc="Linux software for Fender Mustang amplifiers"
arch=('i686' 'x86_64')
url="http://piorekf.org/plug/"
license=('GPL3')
depends=('qt4' 'libusb')
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/piorekf/plug/get/v${pkgver}.tar.gz)
md5sums=('16341455a3eb07cffb255cfb2daa92d7')

build() {
  cd "$srcdir"/piorekf-plug-*/plug

  qmake-qt4 target.path=/usr/bin plug.pro
  make
}

package() {
  cd "$srcdir"/piorekf-plug-*/plug

  make INSTALL_ROOT="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/doc/plug/"
  cp LICENSE "$pkgdir/usr/share/doc/plug/"
  cp README "$pkgdir/usr/share/doc/plug/"
  # Remove empty directory
  rm -r "$pkgdir/usr/local/"
}

# vim:set ts=2 sw=2 et:

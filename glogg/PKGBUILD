# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=glogg
pkgver=0.9.2.1
pkgrel=1
pkgdesc="A multi-platform Qt GUI application to browse and search through long or complex log files."
arch=(i686 x86_64)
url="http://glogg.bonnefon.org/"
license=('GPL3')
depends=('qt4' 'boost-libs')
makedepends=('boost')
install="$pkgname.install"
source=("$url/files/$pkgname-$pkgver.tar.gz")
md5sums=('17f4e7c10df0a1de4d3ee07ef4aa0fce')

build() {
  cd $pkgname-$pkgver
  qmake-qt4 && make
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:

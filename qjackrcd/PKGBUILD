# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=qjackrcd
pkgver=1.0.6
pkgrel=2
pkgdesc="A simple QT/JACK recorder"
arch=(i686 x86_64)
url="https://sourceforge.net/p/qjackrcd/home/Home/"
license=('GPL')
depends=('qt4' 'jack')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/qjackrcd/stable/$pkgname-$pkgver.tar.gz")
md5sums=('6b82d9d4b7d71029202e423f99ebccb8')

build() {
  cd $pkgname-$pkgver
  qmake-qt4 PREFIX=/usr
  make clean
  make
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

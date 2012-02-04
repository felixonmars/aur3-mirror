# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=qreadbook
pkgver=0.1.5.1
pkgrel=1
pkgdesc="A small and simple book reader programmed in C++ using the QT toolkit."
arch=('i686' 'x86_64')
url="http://code.google.com/p/qreadbook/"
license=('GPL3')
depends=('qt')
makedepends=()
source=("http://qreadbook.googlecode.com/files/${pkgname}v$pkgver.tar.gz")
md5sums=('523599acd33bce0fcf7c30b7992f5cc5')

build() {
  cd "$srcdir/$pkgname"

  qmake -o Makefile qreadbook.pro
  make || return 1
  install -Dm 0755 qreadbook $pkgdir/usr/bin/qreadbook
}

# vim:set ts=2 sw=2 et:

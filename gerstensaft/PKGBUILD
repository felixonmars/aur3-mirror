# Maintainer: mockfrog <arch AT mockfrog DOT de>
pkgname=gerstensaft
pkgver=0.3
pkgrel=1
pkgdesc="easy to use graphical frontend for sendfile"
arch=('i686' 'x86_64')
url="http://www.infodrom.org/projects/gerstensaft"
license=('GPL2')
depends=('sendfile' 'gtk2')
source=(http://www.infodrom.org/projects/gerstensaft/download/$pkgname-$pkgver.tar.gz)
md5sums=('199a0118bf48498cb14ed2275a9e2b29')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
#  make DESTDIR="$pkgdir/" install
  install -m644 ${srcdir}/gerstensaft-0.3/man/beer.1 -D ${pkgdir}/usr/share/man/man1/beer.1
  install ${srcdir}/gerstensaft-0.3/src/beer -D ${pkgdir}/usr/bin/beer
}


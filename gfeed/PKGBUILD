# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Philip Gaskell <pdgaskell@yahoo.co.uk>

pkgname=gfeed
pkgver=2.5.0
pkgrel=1
pkgdesc="A GTK-based RSS/RDF feed reader"
url="http://sourceforge.net/projects/gfeed/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gnet>=1.0.7')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5301287f336599ab77ccba4875993734')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr LIBS=-lX11
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

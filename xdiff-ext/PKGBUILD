# Maintainer: TDY <tdy@gmx.com>

pkgname=xdiff-ext
pkgver=0.2.0
pkgrel=2
pkgdesc="A Thunar extension for launching file comparison tools"
arch=('i686' 'x86_64')
url="http://diff-ext.sourceforge.net/"
license=('BSD')
depends=('thunar>=0.9.0')
makedepends=('intltool' 'pkgconfig>=0.9.0')
options=('!libtool')
install=$pkgname.install
source=(http://downloads.sourceforge.net/${pkgname#x}/$pkgname-$pkgver.tar.bz2
        $pkgname-$pkgver.diff)
md5sums=('01bdff2069d94c1af4daa8dcd867effd'
         '51f9e181507eed3dbcca267fa12f7e01')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff || return 1
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

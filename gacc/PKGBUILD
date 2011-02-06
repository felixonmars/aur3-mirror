# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=gacc
pkgver=0.7.5
pkgrel=1
pkgdesc="A personal accounts manager a la MS Money or Quicken"
arch=('i686' 'x86_64')
url="http://tnemeth.free.fr/projets/gAcc-en.html"
license=('GPL')
depends=('gtk>=1.2.1')
source=(http://tnemeth.free.fr/projets/programmes/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('014114ff318ec9b374163900c2d77428')

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
              --datadir=/usr/share/$pkgname
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  make DESTDIR="$pkgdir" install
}

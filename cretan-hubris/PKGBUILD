# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=cretan-hubris
pkgver=0.2
pkgrel=1
pkgdesc="An arcade game featuring an infinite maze and a red wave of insta-killing wrath"
arch=('i686' 'x86_64')
url="http://radius-engine.sourceforge.net/development/cretan-hubris--egp-2012-02-.html"
license=("GPL")
depends=('radius-engine')
source=(http://sourceforge.net/projects/radius-engine/files/$pkgname-$pkgver.tar.gz)
md5sums=('f0ded4573d1d4a77e9ec4a42a68183d6')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

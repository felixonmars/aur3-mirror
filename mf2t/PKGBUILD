# Author: Piet van Oostrum

pkgname=mf2t
pkgver=1
pkgrel=1
post=unix-20110617
pkgdesc="text to midi and midi to text converters"
arch=('any')
url="http://heanet.dl.sourceforge.net/project/mf2t-unix/mf2t-unix-20110617.tar.gz"
license=(GPL)
depends=('make')
source=(http://heanet.dl.sourceforge.net/project/mf2t-unix/mf2t-unix-20110617.tar.gz)
md5sums=('5e10db8bb111c834c2c6cec5853f4cd7')

build() { 
  cd "$srcdir/$pkgname-$post"
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var 
}

package() {
 mkdir -p $pkgdir/usr/bin
 cp "$srcdir/$pkgname-$post/mf2t" $pkgdir/usr/bin
 cp "$srcdir/$pkgname-$post/t2mf" $pkgdir/usr/bin

}

# vim:set ts=2 sw=2 et:

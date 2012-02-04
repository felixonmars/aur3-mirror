# Maintainer: Christophe-Marie Duquesne <chm.duquesne@gmail.com>

pkgname=gccsense
pkgver=0.1
pkgrel=2
pkgdesc="A program that allows to complete C/C++, pulling info from gcc"
arch=('any')
url="http://cx4a.org/software/gccsense/"
license=('GPL3')
depends=('gcc-code-assist' 'ruby')
source=(http://cx4a.org/pub/gccsense/$pkgname-$pkgver.tar.bz2)
md5sums=('737fcae30ae82bd70b427e0c3a2da2bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share
  cp -rp etc $pkgdir
  cp -rp bin $pkgdir/usr
  cp -rp doc $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:

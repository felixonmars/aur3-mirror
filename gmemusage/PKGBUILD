# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gmemusage
pkgver=0.2
pkgrel=3
pkgdesc="Graphically display memory used by running processes."
arch=('i686' 'x86_64')
url="http://oss.sgi.com/projects/gmemusage/"
license=('GPL3')
depends=('libx11')
source=(ftp://oss.sgi.com/projects/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('c79e331c66b1f3c677399da5fbc86c6f')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 gmemusage $pkgdir/usr/bin/gmemusage
  install -Dm644 gmemusage.1 $pkgdir/usr/share/man/man1/gmemusage.1
}

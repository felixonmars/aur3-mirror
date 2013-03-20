# Maintainer: Pierre Carru <pierre.carru@gmail.com>
pkgname=logtools
pkgver=0.13d
pkgrel=4
pkgdesc="Tools for managing log files"
arch=('i686' 'x86_64')
url="http://doc.coker.com.au/projects/logtools/"
license=('unknown')
source=(http://www.coker.com.au/logtools/${pkgname}-${pkgver}.tgz)
md5sums=('7f36f34f521885c058cc33dc74abce4e')
depends=('gcc-libs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # non-standard makefile, can't use DESTDIR
  make prefix="$pkgdir/usr" install
  mv $pkgdir/usr/etc $pkgdir/etc
  install -d -m755 $pkgdir/usr/share
  rmdir $pkgdir/usr/man/man8
  mv $pkgdir/usr/man $pkgdir/usr/share/man
}


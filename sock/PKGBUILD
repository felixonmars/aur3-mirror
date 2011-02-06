# Maintainer: Yuri Bochkarev <baltazar.bz@gmail.com>
pkgname=sock
pkgver=0.3.2
pkgrel=2
pkgdesc='Standalone version of Richard Stevens "sock" program'
arch=('i686')
url="http://www.icir.org/christian/sock.html"
license=('custom')
provides=('sock')
conflicts=('sock')
source=(http://www.icir.org/christian/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('3fd1b198fc56e256985dc6c7a3464962')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # License
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  cat ${srcdir}/$pkgname-$pkgver/COPYING > ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
}

# vim:set ts=2 sw=2 et:

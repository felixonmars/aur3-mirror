# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=trx
pkgname=$_pkgname-git
pkgver=0.2.r7.g14927fb
pkgrel=1
pkgdesc="A simple toolset for broadcasting live audio from Linux"
arch=(i686 x86_64)
url="http://www.pogo.org.uk/~mark/trx"
license=('GPL')
depends=('alsa-lib' 'opus' 'ortp')
provides=('trx')
conflicts=('trx')
source=(git+http://www.pogo.org.uk/~mark/trx.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -r 's/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

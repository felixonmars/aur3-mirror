# Maintainer: Jordi De Groof <jordi.degroof@gmail.com>
pkgname=vobwalker
pkgver=0.1.2
pkgrel=1
pkgdesc="Walk through a VOB file, extract lists of VOBUs to a set of chapter files"
arch=('i686' 'x86_64')
url="http://anachronda.homeunix.com:8000/~rivie/vobwalker/"
license=('custom')
source=("http://anachronda.homeunix.com:8000/~rivie/vobwalker/$pkgname-$pkgver.tar")
md5sums=('d404446a152233792dce901d2c25106d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s_/man/_/share/man/_g" Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

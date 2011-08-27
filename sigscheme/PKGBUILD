# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=sigscheme
pkgver=0.8.5
pkgrel=1
pkgdesc="sigscheme is a R5RS scheme implementation targeting small footprints and embedded enviroments."
arch=(i686 x86_64)
url="http://code.google.com/p/sigscheme"
license=('BSD')
depends=()
makedepends=()
install=
changelog=
source=(http://sigscheme.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('396f12ee8d4102a59723c845a110b07d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

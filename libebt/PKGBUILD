# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=libebt
pkgver=1.3.0
pkgrel=1
pkgdesc="The libebt library provides a clean way of getting human-readable backtrace messages in C++."
arch=('i686' 'x86_64')
url="http://libebt.berlios.de/"
license=('BSD')
depends=()
makedepends=('gcc')
source=(http://download.berlios.de/libebt/$pkgname-$pkgver.tar.bz2)
md5sums=('4db63470575336e27f89038d7c7cc01e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make check || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=run-free
pkgver=2.0.0
pkgrel=1
pkgdesc="A lightweight standalone GUI run command dialog"
arch=('i686 x86_64')
url="http://run-free.sourceforge.net"
license=('GPL')
depends=('gtk')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname%202.x/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('4a2644358efa222f04b29cc4bd8fa79e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

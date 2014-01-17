# Maintainer: speps <speps at aur dot archlinux dot org>

_commit=d8897462c95e403dc49852b47bf9b9945990511b
pkgname=calfbox
pkgver=0.0.3.r1200
pkgrel=1
pkgdesc="Open source music instrument"
arch=(i686 x86_64)
url="http://repo.or.cz/w/calfbox.git"
license=('GPL3')
depends=('python' 'fluidsynth' 'libsmf' 'libusbx')
source=("http://repo.or.cz/w/calfbox.git/snapshot/$_commit.tar.gz")
md5sums=('80fbd6ece2737be0c1b5a74323c7f1b2')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make

  # python module
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  # python module
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=libvr-hg
pkgver=29
pkgrel=1
pkgdesc='Simple C library to handle virtual reality headsets'
arch=('i686' 'x86_64')
url='http://hg.sitedethib.com/libvr'
license=('BSD')
depends=('hidapi-git')
makedepends=('mercurial')
provides=('libvr')
conflicts=('libvr')

source=('hg+http://hg.sitedethib.com/libvr')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libvr"
  hg identify -n
}

build() {
  cd "$srcdir/libvr"
  mkdir m4
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libvr"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sts=2 sw=2 et:

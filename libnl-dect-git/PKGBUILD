# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=libnl-dect-git
pkgname_=libnl
pkgver=1.0.7
pkgrel=2
pkgdesc="Library for applications dealing with netlink sockets (with patches for DECT cards)."
arch=('i686' 'x86_64')
url="http://dect.osmocom.org"
license="GPL2"
makedepends=('git')
depends=('linux-dect' 'linux-headers-dect')
source=('git+git://dect.osmocom.org/git/libnl')
md5sums=('SKIP')

pkgver() {
  cd $SRCDEST/libnl
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/libnl"
  sh autogen.sh
  sh configure --enable-doc=y
  make
} 

package () {
  cd $srcdir/libnl
  make DESTDIR="$pkgdir" install
}

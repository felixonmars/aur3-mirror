# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=libdect
pkgver=20110514
pkgrel=2
pkgdesc="Contains the DECT NWK layer and some auxiliary functions."
arch=('i686' 'x86_64')
url="http://dect.osmocom.org"
license="GPL2"
makedepends=('git')
depends=('libnl-dect-git' 'linux-dect' 'linux-headers-dect')
source=('git+git://dect.osmocom.org/git/libdect.git')
md5sums=('SKIP')

pkgver(){
  cd "$SRCDEST/libdect"
  git describe --always | sed 's|-|.|g'
}

build(){
  cd "$srcdir/libdect"
  sh autogen.sh
  sh configure --enable-doc=y
  make
} 

package () {
  cd "$srcdir/libdect"
  make DESTDIR="$srcdir" install
}

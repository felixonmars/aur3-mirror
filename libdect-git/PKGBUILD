# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=libdect-git
pkgver=20110514
pkgrel=1
pkgdesc="Contains the DECT NWK layer and some auxiliary functions."
arch=('i686' 'x86_64')
url="http://dect.osmocom.org"
license="GPL2"
makedepends=('git')
depends=('libnl-dect-git' 'linux-dect' 'linux-headers-dect')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

    git clone git://dect.osmocom.org/git/libdect.git

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  cd libdect
  sh autogen.sh
  sh configure --enable-doc=y
  make
  
} 
package () {
  cd $srcdir/libdect
  make DESTDIR="$srcdir" install
}

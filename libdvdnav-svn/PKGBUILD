# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=libdvdnav-svn
pkgver=1257
pkgrel=1
pkgdesc="Library for easy use of DVD navigation"
arch=('i686' 'x86_64')
url="http://dvdnav.mplayerhq.hu/"
license=('GPL2')
depends=('libdvdread')
makedepends=('subversion')
provides=('libdvdnav')
conflicts=('libdvdnav')
options=(!libtool)
source=('libdvdnav::svn+svn://svn.mplayerhq.hu/dvdnav/trunk/libdvdnav')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libdvdnav"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/libdvdnav"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/libdvdnav"

  make DESTDIR="$pkgdir" install
}

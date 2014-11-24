# Maintainer: Olaf Bauer <hydro@freenet.de> 
# Contributor: dejavu <pauli8585@hotmail.com>

pkgname=xbmc-pvr-addons-git
pkgver=20141117
pkgrel=1
pkgdesc="XBMC PVR add-ons"
arch=('i686' 'x86_64')
url="https://github.com/opdenkamp/xbmc-pvr-addons"
license=('GPL3')
depends=('xbmc' 'libmysqlclient' 'jsoncpp' 'crypto++' 'curl')
makedepends=('git' 'boost')
optdepends=('tvheadend-git: tvheadend backend' 'mythtv: mythtv backend')
provides=('xbmc-pvr-addons')
conflicts=('xbmc-pvr-addons')
source=('git://github.com/opdenkamp/xbmc-pvr-addons.git#branch=gotham')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/xbmc-pvr-addons"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/xbmc-pvr-addons"
  ./bootstrap
  ./configure --prefix=/usr --enable-addons-with-dependencies
  make
}

package() {
  cd "$srcdir/xbmc-pvr-addons"
  make DESTDIR="$pkgdir/"  install
}

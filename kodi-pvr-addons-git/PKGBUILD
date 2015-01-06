# Maintainer: Johan Rehnberg <cleanrock@gmail.com>
# Based on xbmc-pvr-addons-git by Olaf Bauer <hydro@freenet.de> and dejavu <pauli8585@hotmail.com>)

pkgname=kodi-pvr-addons-git
pkgver=20141230
pkgrel=1
pkgdesc="Kodi PVR add-ons"
arch=('i686' 'x86_64')
url="https://github.com/opdenkamp/xbmc-pvr-addons"
license=('GPL3')
depends=('kodi' 'libmysqlclient' 'jsoncpp' 'crypto++' 'curl')
makedepends=('git' 'boost')
optdepends=('tvheadend-git: tvheadend backend' 'mythtv: mythtv backend')
provides=('kodi-pvr-addons')
conflicts=('kodi-pvr-addons')
source=('git://github.com/opdenkamp/xbmc-pvr-addons.git#branch=master')
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

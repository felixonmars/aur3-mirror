# Maintainer: bkp <bkp@rlgh.me>
# Contributor: bkp <bkp@rlgh.me>

pkgname=xbmc-pvr-addons-devel
pkgver=20140321
pkgrel=1
pkgdesc="XBMC PVR add-ons for xbmc-devel"
arch=('i686' 'x86_64')
url="https://github.com/opdenkamp/xbmc-pvr-addons"
license=('GPL3')
depends=('xbmc-devel' 'libmysqlclient')
makedepends=('git' 'libmysqlclient' 'boost')
optdepends=('tvheadend-git: tvheadend backend' 'mythtv: mythtv backend')
provides=('xbmc-pvr-addons')
conflicts=('xbmc-pvr-addons')
source=('git://github.com/opdenkamp/xbmc-pvr-addons.git')
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
  make DESTDIR="$pkgdir/" install
}

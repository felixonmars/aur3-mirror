# Maintainer: Roman Petrov <nwhisper@gmail.com>
pkgname=libreoffice-extension-menubar
_pkgname=lo-menubar
pkgver=0.1.1
pkgrel=1
pkgdesc="A small plugin for LibreOffice to export the menus from the application into Unity's menubar"
arch=(i686 x86_64)
url="https://launchpad.net/lo-menubar"
license=(LGPL)
depends=(libreoffice-common libdbusmenu-gtk2 boost)
makedepends=(libreoffice-sdk python2)
source=(http://launchpad.net/lo-menubar/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2)
md5sums=(5cdb8dd7a354afc537204d9ad2df3352)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export LD_LIBRARY_PATH=/usr/lib/libreoffice/ure/lib
  python2 ./waf configure --prefix=/usr \
                          --libreoffice-prefix=/usr/lib/libreoffice \
                          --ure-prefix=/usr/lib/libreoffice/ure
  python2 ./waf build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 ./waf install --destdir=$pkgdir
}

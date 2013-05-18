# Maintainer: Ner0
# Contributor: Flamelab

pkgname=marlin-bzr
pkgver=886
pkgrel=1
pkgdesc="A sleek and fast GTK3 file manager"
arch=('i686' 'x86_64')
url="https://launchpad.net/marlin"
license=('GPL2' 'GPL3')
depends=('dbus-glib' 'desktop-file-utils' 'libgee06' 'libnotify' 'varka-bzr')
makedepends=('bzr' 'vala' 'cmake')
optdepends=('tumbler: For generating thumbnails'
            'extended-actions-bzr: Plugins integration [AUR]'
            'marlin-dropbox-plugin-bzr: Dropbox integration [AUR]')
install=marlin.install
source=('bzr+lp:marlin')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/marlin"
  bzr revno
}

build() {
  cd "$srcdir/marlin"
  rm -rf build/
  mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=OFF -DICON_UPDATE=OFF
  make
}

package() {
  cd "$srcdir/marlin/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}

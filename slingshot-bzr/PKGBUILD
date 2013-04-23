# Maintainer: Ner0

pkgname=slingshot-bzr
pkgver=349
pkgrel=1
pkgdesc="A lightweight and stylish app launcher from elementary"
arch=('i686' 'x86_64')
url="https://www.launchpad.net/slingshot"
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'libgee06' 'gnome-menus2' 'gtk3' 'granite-bzr' 'dconf'
         'libwnck3' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'libzeitgeist')
makedepends=('bzr' 'cmake' 'vala')
optdepends=('wingpanel-bzr: An elementary panel. [AUR]'
            'zeitgeist: zeitgeist support.')
provides=('pantheon-slingshot')
conflicts=('pantheon-slingshot')
install=slingshot.install
source=('bzr+http://bazaar.launchpad.net/~elementary-pantheon/slingshot/new-slingshot/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/new-slingshot"
  bzr revno
}

prepare() {
  cd "$srcdir/new-slingshot"
  sed -i 's/unity;//' CMakeLists.txt
  sed -i '/Unity/d' src/Backend/App.vala
}

build() {
  cd "$srcdir/new-slingshot"
  rm -rf build/
  mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=OFF -DGSETTINGS_LOCALINSTALL=OFF
  make
}

package() {
  cd "$srcdir/new-slingshot/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}

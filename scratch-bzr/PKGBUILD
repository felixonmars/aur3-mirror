# Maintainer: Ner0

pkgname=scratch-bzr
pkgver=1041
pkgrel=1
pkgdesc="A text editor written in Vala by elementary"
arch=('i686' 'x86_64')
url="https://launchpad.net/scratch"
license=('GPL3')
depends=('desktop-file-utils' 'granite-bzr' 'gtksourceview3' 'libpeas' 'libzeitgeist' 'python2-chardet' 'vte3' 'webkitgtk3')
makedepends=('bzr' 'cmake' 'vala' 'gobject-introspection')
optdepends=('contractor-bzr: Contractor integration [AUR]'
            'libsoup: Pastebin plugin'
            'pantheon-files-bzr: File Manager plugin [AUR]')
conflicts=('scratch-text-editor')
provides=('scratch-text-editor')
options=('!makeflags')
install=scratch.install
source=('bzr+lp:scratch')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/scratch"
  bzr revno
}

prepare() {
  cd "$srcdir/scratch"
  sed -i '/enable_testing\ \(\)/d' CMakeLists.txt
  sed -i '/--warn-all/d' cmake/GObjectIntrospectionMacros.cmake
  sed -i 's/python$/python2/' scripts/*.py
  sed -i '/spell/d' plugins/CMakeLists.txt
}

build() {
  cd "$srcdir/scratch"
  rm -rf build/ 2>/dev/null
  mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=OFF
  make
}

package() {
  cd "$srcdir/scratch/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
  chmod +x "$pkgdir"/usr/share/scratch/scripts/*.py
}

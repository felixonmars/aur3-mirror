# Maintainer: Marko Gajsr <marko@gaj.st>

pkgname=evalify
pkgver=r4
pkgrel=1
pkgdesc='GTK3 application, which allows you to eval PHP snippets.'
arch=('i686' 'x86_64')
url='https://launchpad.net/evalify'
license=('GPL3')
depends=('desktop-file-utils' 'gtksourceview3')
makedepends=('bzr' 'cmake' 'gobject-introspection' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}")
install="${pkgname}.install"
source=("${pkgname}::bzr+lp:evalify")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd ${pkgname}
}

build() {
  cd ${pkgname}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="${pkgdir}" install
}

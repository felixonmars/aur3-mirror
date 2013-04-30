#Maintainer: Jekyll Wu < adaptee [at] gmail [dot] com>
#Contributor: Zephyr

pkgname=oxygen-gtk2-git
pkgver=20130417_v1.3.2.1_89_g76735ff
pkgrel=1
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK2"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
license=('LGPL')
depends=('gtk2' 'dbus-glib')
makedepends=('git' 'cmake')
provides=('oxygen-gtk2')
conflicts=('oxygen-gtk2')
replaces=('oxygen-gtk-git')
options=(!strip)
source=("git://anongit.kde.org/oxygen-gtk")
md5sums=('SKIP')

_gitname="oxygen-gtk"

pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always | sed 's/-/_/g')"
}

build() {

  cd "${srcdir}/${_gitname}"
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=debugfull \
        ..

  make
}
package () {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR=${pkgdir} install
}

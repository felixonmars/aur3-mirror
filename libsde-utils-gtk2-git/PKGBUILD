#Maintainer : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsde-utils-gtk2-git
pkgver=201507291343
pkgrel=1
url="http://make-linux.org"
pkgdesc="SDE Gtk+ Utility Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'sde-reverse-meta-git')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake')
provides=('libsde-utils-gtk2' )
conflicts=('libsde-utils-gtk2')

source=('git+git://make-linux.org/sde/libsde-utils-gtk.git')
md5sums=('SKIP')

_gitname="libsde-utils-gtk"

pkgver() {
  date +%Y%m%d%H%M
}

build() {
    cd "${_gitname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr . && make
}

package () {
    cd "${_gitname}"
    make DESTDIR="$pkgdir/" install
}


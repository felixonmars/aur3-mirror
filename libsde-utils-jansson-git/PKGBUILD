#Maintainer : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsde-utils-jansson-git
pkgver=201507291344
pkgrel=1
url="http://make-linux.org"
pkgdesc="SDE Utility Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'jansson' 'libsde-utils-gtk2-git' 'sde-reverse-meta-git')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake')
provides=('libsde-utils-jansson' )
conflicts=('libsde-utils-jansson')

source=('git+git://make-linux.org/sde/libsde-utils-jansson.git')
md5sums=('SKIP')

_gitname="libsde-utils-jansson"

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


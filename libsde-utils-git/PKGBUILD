#Maintainer : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsde-utils-git
pkgver=201507291343
pkgrel=1
url="http://make-linux.org"
pkgdesc="SDE Utility Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'sde-reverse-meta-git')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'automake')
provides=('libsde-utils' )
conflicts=('libsde-utils')

source=('git+git://make-linux.org/sde/libsde-utils.git')
md5sums=('SKIP')

_gitname="libsde-utils"

pkgver() {
  date +%Y%m%d%H%M
}

build() {
    cd "${_gitname}"

    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-silent-rules \
        --with-gnu-ld || return 1
    make
}

package () {
    cd "${_gitname}"
    make DESTDIR="$pkgdir/" install
}


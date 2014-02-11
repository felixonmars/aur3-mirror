# Maintainer: Vadim Ushakov <igeekless@gmail.com>

pkgname=ccze-rv-git
pkgver=20140210
pkgrel=1
conflicts=('ccze-rv' 'ccze')
provides=('ccze-rv' 'ccze')
pkgdesc="Modular log colorizer. (Fork of ccze with performance improvements.)"
url="http://make-linux.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(ncurses  pcre)

source=('git+git://make-linux.org/tools/ccze-rv.git')
md5sums=('SKIP')

_gitname="ccze-rv"

pkgver() {
  date +%Y%m%d
}

build() {
    cd "${_gitname}"
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd "${_gitname}"
    make DESTDIR="$pkgdir" install
}

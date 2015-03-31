# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>
# Contributor: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>

_pkgname="giflossy"
pkgname="${_pkgname}-git"
pkgver=r697.0f475d5
pkgrel=1
pkgdesc="Lossy GIF compressor http://pornel.net/lossygif"
arch=('i686' 'x86_64')
url="https://github.com/pornel/giflossy"
license=('GPL2')
depends=('libx11')
conflicts=('gifsicle')
provides=('gifsicle')
source=("git://github.com/pornel/giflossy.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"

    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd "${_pkgname}"

    make DESTDIR="$pkgdir/" install
}

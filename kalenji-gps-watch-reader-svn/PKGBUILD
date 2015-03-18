pkgname=kalenji-gps-watch-reader-svn
_pkgname=kalenji-gps-watch-reader
pkgver=20150313.244
pkgrel=1
pkgdesc="A tool to import GPX files from a W 300 Kalenji or CW 700 Kalenji GPS watch."
arch=('i686' 'x86_64')
url="http://code.google.com/p/kalenji-gps-watch-reader/"
license=('GPL')
makedepends=('subversion')
depends=('libusb' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::svn+https://github.com/ColinPitrat/kalenji-gps-watch-reader/")
md5sums=('SKIP')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}
build() {
    rm -rf "${srcdir}/${_pkgname}-build"
    cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-build"
    cd "${srcdir}/${_pkgname}-build/trunk"
    make || return 1
}
package() {
    cd "${srcdir}/${_pkgname}-build/trunk"
    install -D kalenji_reader $pkgdir/usr/bin/kalenji_reader
}


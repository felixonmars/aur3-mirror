# Maintainer: Philipp Schmidt <philschmidt at gmx dot net>

pkgname=fuzemux
pkgver=0.1.2_fixed
pkgrel=1
pkgdesc="A tool to remux AVI video files for the Sansa Fuze media player"
arch=("i686" "x86_64")
url="http://code.google.com/p/fuzemux/"
license=('GPL3')

source=(http://fuzemux.googlecode.com/files/${pkgname}-${pkgver/_/-}.tar.gz)
sha1sums=(4ea5067bdedf6394beca6e2d091946ffd15f356d)

build() {
    cd ${pkgname}-0.1.2
    ./configure --prefix=/usr
    make
    make DESTDIR=$pkgdir install
}

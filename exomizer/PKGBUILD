# Maintainer: lobotomius at gmail dot com

pkgname=exomizer
pkgver=2.0.7
pkgrel=1
pkgdesc="8bit platforms software compressor"
arch=('i686' 'x86_64')
url="http://hem.bredband.net/magli143/exo/"
license=('custom')
makedepends=()
source=("http://hem.bredband.net/magli143/exo/exomizer207.zip")
md5sums=('00e9dd074d29525338eba8ba6e8eb288')

build() {
    cd "$srcdir/src"
    make

}

package() {
    cd "$srcdir/src"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 exomizer exoraw exobasic "$pkgdir/usr/bin"

}



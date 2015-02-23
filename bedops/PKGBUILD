# Maintainer: Cory Giles <mail@corygil.es>

pkgname=bedops
pkgver=2.4.9
pkgrel=1
pkgdesc="Highly scalable genomic feature operations."
arch=('i686' 'x86_64')
url="http://code.google.com/p/bedops/"
license=('GPL')
depends=('python2')

if [ "$CARCH" == "x86_64" ]; then
    md5sums=('7cbb244257667171159bd7cb28aa11ce')
    _arch="$CARCH"
else
    md5sums=('57c246badaaeb3866ef6b75fa9594db9')
    _arch="i386"
fi

source=(https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_${_arch}-v${pkgver}.tar.bz2)

build() {
    cd "$srcdir"
    sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g' bin/*
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin"
    install -t "$pkgdir/usr/bin" bin/*
}

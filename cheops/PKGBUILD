# Maintainer: Wellington Oliveira de Andrade <wellington79@gmail.com>
pkgname=cheops
pkgver=0.61
pkgrel=15
pkgdesc="Network Tools."
url="http://www.marko.net/cheops/"
if [ "${CARCH}" = 'x86_64' ]; then
    depends=()
    arch2="amd64"
    md5sums=('101628139 320468')
elif [ "${CARCH}" = 'i686' ]; then
    depends=()
    arch2="i386"
    md5sums=('412024331 309310')
fi

source=(http://download.unesp.br/linux/debian/pool/main/c/$pkgname/${pkgname}_$pkgver-$pkgrel.1_$arch2.deb)
arch=('i686' 'x86_64')
license=('GPL')

build() {
    cd $startdir/src

    bsdtar xf "${pkgname}_${pkgver}-${pkgrel}.1_$arch2.deb" || return 1
    bsdtar xf data.tar.gz -C $startdir/pkg || return 1
}

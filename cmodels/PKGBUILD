# Maintainer: buhman <zack[at]buhman[dot]org>
pkgname=cmodels
pkgver=3.84
pkgrel=1
pkgdesc='computes answer sets for disjunctive logic programs'
url='http://www.cs.utexas.edu/~tag/cmodels/'
# license not specified
license=('custom')
arch=('x86_64' 'i686')
depends=('lparse' 'relsat' 'zchaff')
source=("http://www.cs.utexas.edu/users/tag/cmodels/cmodels-3.tar.gz")
md5sums=('32ad4d0c046ba1524213e6f4d29ba7d9')

build() {
    cd "${srcdir}/${pkgname}"
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

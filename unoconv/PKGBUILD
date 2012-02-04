# Contributor: SeeSchloss <seeschloss@seos.fr>
# Contributor: max.bra <max.bra at alice dot it>
# Maintainer: max.bra <max.bra at alice dot it>

pkgname=unoconv
pkgver=0.4
pkgrel=3
pkgdesc="unoconv converts between any document format that OpenOffice/Libreoffice understands. It uses OpenOffice/Libreoffice's UNO bindings for non-interactive conversion of documents."
depends=('python2' 'java-runtime')
optdepends=('openoffice-base: for use with openoffice'
            'libreoffice: for use with libreoffice')
makedepends=('asciidoc')
arch=('any')
license=('GPL2')
url="http://dag.wieers.com/home-made/unoconv/"
source=(http://dag.wieers.com/home-made/${pkgname}/${pkgname}-${pkgver}.tar.bz2 python_ldpath_and_doc.patch)
md5sums=('64cd2c3b0823d329890c0bedffdfa6ae' '212ca7b9dcd09609f7920afe5bf4b3dd')

build() {
    patch -p1 < python_ldpath_and_doc.patch
}

package() {
    cd "$srcdir"/"$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

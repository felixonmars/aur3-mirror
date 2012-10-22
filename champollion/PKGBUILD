# Maintainer: Jakub Stawowy <jakubstawowy at gmail com>

pkgname=champollion
pkgver=1.2
pkgrel=1
pkgdesc="Sentence aligner kernel. Aims to providing ready-to-use parallel text sentence alignment tools for as many language pairs as possible"
arch=('any')
license=('GPL')
makedepends=()
depends=(perl)
source=("${pkgname}-${pkgver}.tar::http://sourceforge.net/projects/champollion/files/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tgz/download")
md5sums=('912012b1b7036dc8509c22a571a49490')
url=http://champollion.sourceforge.net/     

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -R "bin/" "$pkgdir/opt/${pkgname}"
    cp -R "lib/" "$pkgdir/opt/${pkgname}"
    cp -R "thirdparty/" "$pkgdir/opt/${pkgname}"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/bin/champollion" "$pkgdir/usr/bin/champollion"
}

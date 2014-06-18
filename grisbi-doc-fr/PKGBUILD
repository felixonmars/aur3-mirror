# Maintainer: Charles Goyard <cg at fsck dot fr>

pkgname=grisbi-doc-fr
pkgver=1.0
pkgrel=1
pkgdesc="Personal financial management program, French documentation"
arch=('any')
options=('docs')
url="http://www.grisbi.org"
license=('FDL')
source=("http://sourceforge.net/projects/grisbi/files/Documentation/manual_${pkgver}/grisbi-manuel-html_img-${pkgver}.tar.gz")
md5sums=('d4988f4b7eb43280a9b66b917e9f0cbc')

package() {
    mkdir -p ${pkgdir}/usr/share/doc/grisbi/
    cp -r --preserve=timestamps ${srcdir}/fr/ ${pkgdir}/usr/share/doc/grisbi/
    chmod -R 0644 ${pkgdir}/usr/share/doc/grisbi/fr/
    chmod -R 0755 ${pkgdir}/usr/share/doc/grisbi/fr/
    chmod -R 0755 ${pkgdir}/usr/share/doc/grisbi/fr/image
    chmod -R 0755 ${pkgdir}/usr/share/doc/grisbi/fr/image/screenshot
    chmod -R 0755 ${pkgdir}/usr/share/doc/grisbi/fr/image/icon
}

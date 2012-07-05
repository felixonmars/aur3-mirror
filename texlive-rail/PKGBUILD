# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>
pkgname=texlive-rail
_pkgname=rail
pkgver=1.2
pkgrel=1
pkgdesc='LaTeX package to use syntax diagrams (also known as railroad diagrams).'
url="http://www.ctan.org/pkg/rail"
arch=('any')
license=('GPL3')
depends=('texlive-core')
install=${pkgname}.install
source=("http://mirror.ctan.org/support/${_pkgname}.zip")
md5sums=('9a3b7c58bd01ee69748cc1252455deef')

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    mv rail.man rail.1
    gzip rail.1

    install -D rail "${pkgdir}/usr/bin/rail"
    install -D -m644 rail.sty "${pkgdir}/usr/share/texmf/tex/latex/rail/rail.sty"
    install -D -m644 rail.1.gz "${pkgdir}/usr/share/man/man1/rail.1.gz"
}

# Maintainer: Pierre Neidhardt <ambrevar at gmail dot com>

pkgname=wikiex
pkgver=1.31
pkgrel=1
pkgdesc="A simple script that will retrieve wiki source files for the given wiki pages."
url="http://bitbucket.org/ambrevar/wikiex/"
arch=('any')
license=('MIT')
depends=('gawk' 'wget')
source=(https://bitbucket.org/ambrevar/"${pkgname}"/downloads/"${pkgname}"-"${pkgver}".tar.xz)
sha1sums=('b79ee0493f68de06f0287144d1d22b68eec09ff3')

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m755 wikiex "${pkgdir}/usr/bin/wikiex"
    install -D -m755 wikils "${pkgdir}/usr/bin/wikils"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

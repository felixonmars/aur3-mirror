# Maintainer: Ghost of Kendo <ghostofkendo at gmail dot com>
# Contributor: Paul Gessler <pdgessler[at]gmail[dot]com>
pkgname=latex-baposter
pkgname_=baposter
pkgver=2.0
pkgrel=2
pkgdesc='Allows design and layout of posters for scientific conferences using LaTeX'
arch=('any')
url='http://www.brian-amberg.de/uni/poster/'
license=('GPL')
install=baposter.install
depends=()
conflicts=()
source=(http://www.brian-amberg.de/uni/poster/baposter.cls)
md5sums=('be689fb62b90a56c8b0d0c008559b7ff')

package() {
    install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/${pkgname_}
    cp ${srcdir}/${pkgname_}.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/${pkgname_}
}

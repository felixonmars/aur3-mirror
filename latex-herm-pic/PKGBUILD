# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>
# Pull requests are welcome: https://github.com/pSub/pkgbuilds
pkgname=latex-herm-pic
pkgver=1.0.2
pkgrel=2
pkgdesc="Package to draw HERM and ER diagrams."
arch=('any')
url="http://www.svenies-welt.de/?page_id=26"
license=('LPPL (LaTeX Project Public License)')
depends=('texlive-core')
install=$pkgname.install
source=(http://my.dex.de/~sven/downloads/hermpic\_$pkgver.tar.gz)
md5sums=('d7d2c2826801e6fb36e83f9b1ed1a88e')

package() {
    cd hermpic
    install -dm755 "${pkgdir}/usr/share/texmf/tex/latex/herm-pic"
    
    for file in herm-pic-erd.sty herm-pic-impl.sty herm-pic.sty herm-rev.sty; do
        cp -r $file "${pkgdir}/usr/share/texmf/tex/latex/herm-pic"
    done

    cd "${pkgdir}/usr/share/texmf/tex/latex/"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}

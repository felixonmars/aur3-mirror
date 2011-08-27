# Maintainer: Marshall Mattingly <marshall.mattingly@gmail.com>
pkgname=ttf-unibody8
pkgver=1.0
pkgrel=1
pkgdesc="A small 8-pt font with full Western European support."
arch=('any')
url="http://www.underware.nl/site2/index.php?id1=unibody&id2=info"
license=('custom: underware unibody 8')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install="${pkgname}.install"
source=('http://www.underware.nl/download/unibody/fontfiles/unibody.zip'
        'LICENSE')
noextract=('unibody.zip')
md5sums=('5187c3125142e04692f7bc49ccf4f39c'
         '73ce8f00b904ab5ae28948c9e8e6a1bd')

build() {
    cd "${srcdir}"
    unzip "${srcdir}/unibody.zip"

    # rename the extension to ttf for all fonts
    for font in "${srcdir}"/unibody/*.otf; do
        mv "$font" "$(basename "$font" .otf).ttf"
    done

    # install the fonts
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"
    install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

    # install our license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Sascha Weaver <wzyboy@wzyboy.org>

pkgname=adobe-source-hans-sans-fonts
pkgver=1.000
pkgrel=1
pkgdesc='Adobe Source Han Sans - OpenType fonts'
arch=('any')
url='https://github.com/adobe-fonts/source-han-sans'
source=("SourceHanSansOTF-1.000.zip::http://sourceforge.net/projects/source-han-sans.adobe/files/SourceHanSansOTF-1.000.zip/download")
sha256sums=('0b34604d42c1e19d92eb84ca067e3db7f7f030ad7272951fe8d4c61b6441b9cb')
license=('apache')
depends=('fontconfig')
install="fonts.install"
PKGEXT='.pkg.tar'

function package {

    cd SourceHanSansOTF-1.000

    install -dm755 "$pkgdir/usr/share/fonts/adobe-source-hans-sans"

    for font in *.otf; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/adobe-source-hans-sans"
    done
}

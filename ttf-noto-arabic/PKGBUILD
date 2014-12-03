# Maintainer: Vorzard

pkgname=ttf-noto-arabic
pkgver=20141202
pkgrel=1
pkgdesc="Noto Naskh Arabic and Noto Kufi Arabic. Noto is Google’s font family that aims to support all the world’s languages."
arch=('any')
license=('Apache')
url="http://www.google.com/get/noto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.google.com/get/noto/pkgs/NotoNaskhArabic-unhinted.zip"
        "http://www.google.com/get/noto/pkgs/NotoKufiArabic-hinted.zip")

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/TTF/"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

sha256sums=('fe45e1634d5633813eb68103665abd5222cee864150106bc6061f300e7e86bea'
            '8aa77973ee24eb400ab2bf3f2f68b18102f90b311e2852ef448a369e7cc84a4b')
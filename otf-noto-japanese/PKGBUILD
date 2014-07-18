# Maintainer: Vorzard

pkgname=otf-noto-japanese
pkgver=20140717
pkgrel=1
pkgdesc="Noto Sans Japanese. Noto is Google’s font family that aims to support all the world’s languages."
arch=('any')
license=('Apache')
url="http://www.google.com/get/noto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.google.com/get/noto/pkgs/NotoSansJapanese-hinted.zip")

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/OTF/"
    install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
}

sha1sums=('eb86dd7b274bec74d7e3c0479d9053a2c6cfbf11')

# Maintainer: Vorzard

pkgname=otf-noto-traditional-chinese
pkgver=20140717
pkgrel=1
pkgdesc="Noto Sans Traditional Chinese. Noto is Google’s font family that aims to support all the world’s languages."
arch=('any')
license=('Apache')
url="http://www.google.com/get/noto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.google.com/get/noto/pkgs/NotoSansTChinese-hinted.zip")

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/OTF/"
    install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
}

sha1sums=('56cd0483cc98a896e9e6d57f08e383a6b8b53b53')

# Maintainer: Vorzard

pkgname=otf-noto-simplified-chinese
pkgver=20140717
pkgrel=1
pkgdesc="Noto Sans Simplified Chinese. Noto is Google’s font family that aims to support all the world’s languages."
arch=('any')
license=('Apache')
url="http://www.google.com/get/noto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.google.com/get/noto/pkgs/NotoSansSChinese-hinted.zip")

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/OTF/"
    install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
}

sha1sums=('b1a23395674e2d6cfee82e5f1d317aeef6af4dae')

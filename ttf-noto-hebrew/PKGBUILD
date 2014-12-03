# Maintainer: Vorzard

pkgname=ttf-noto-hebrew
pkgver=20141202
pkgrel=1
pkgdesc="Noto Sans Hebrew. Noto is Google’s font family that aims to support all the world’s languages."
arch=('any')
license=('Apache')
url="http://www.google.com/get/noto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.google.com/get/noto/pkgs/NotoSansHebrew-hinted.zip")

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/TTF/"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

sha256sums=('753fde8fc9da984892159321094cad22e4c30d01ffcb94e04838f4171ae1d190')
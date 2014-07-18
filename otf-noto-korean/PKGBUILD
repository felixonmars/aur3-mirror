# Maintainer: Vorzard

pkgname=otf-noto-korean
pkgver=20140717
pkgrel=1
pkgdesc="Noto Sans Korean. Noto is Google’s font family that aims to support all the world’s languages."
arch=('any')
license=('Apache')
url="http://www.google.com/get/noto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.google.com/get/noto/pkgs/NotoSansKorean-hinted.zip")

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/OTF/"
    install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
}

sha1sums=('c9b7f127e9e32e7f6c459145cfa338756c10a3d5')

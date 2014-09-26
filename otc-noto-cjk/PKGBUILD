# Maintainer: Vorzard

pkgname=otc-noto-cjk
pkgver=1.001
pkgrel=2
pkgdesc="Noto Sans CJK. Noto is Google’s font family that aims to support all the world’s languages."
arch=('any')
license=('Apache')
url="http://www.google.com/get/noto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('otf-noto-traditional-chinese' 'otf-noto-simplified-chinese' 'otf-noto-japanese' 'otf-noto-korean' 'ttf-noto-cjk')
install=$pkgname.install
source=("https://noto.googlecode.com/git/third_party/noto_cjk/NotoSansCJK.ttc")

package() {
    cd $srcdir
    install -Dm644 NotoSansCJK.ttc $pkgdir/usr/share/fonts/OTF/NotoSansCJK.ttc
}

sha256sums=('902bc4a72f3c8980c74e36328b65f3ae43243c9696d3e47863dc0b65b4471918')
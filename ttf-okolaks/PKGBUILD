# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-okolaks
pkgver=0.5
pkgrel=1
pkgdesc="A decorative sans serif font"
arch=('any')
url="http://www.fontspace.com/gluk/okolaks"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://ftp.debian.org/debian/pool/main/t/$pkgname/${pkgname}_$pkgver.orig.tar.gz
        OFL.txt)
md5sums=('588120a3176a86584066cf84b3490442'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

build() {
  cd "$srcdir/okolaks_g-$pkgver"
  install -Dm644 okolaks_gBold.ttf \
    "$pkgdir/usr/share/fonts/TTF/okolaks_gBold.ttf"
  install -Dm644 ../OFL.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

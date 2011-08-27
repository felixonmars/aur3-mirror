# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ttf-alba
pkgver=0
pkgrel=5
pkgdesc="A stylish retro font"
arch=('any')
url="http://www.dafont.com/alba.font"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=("ttf-alba.zip::http://img.dafont.com/dl/?f=alba")
md5sums=('e06849d5f203cca709069dc4f1cbe3db')
install=ttf.install

build() {
 install -Dm 644 "$srcdir/ALBA____.TTF" "$pkgdir/usr/share/fonts/TTF/alba.ttf"
 install -Dm 644 "$srcdir/ALBAM___.TTF" "$pkgdir/usr/share/fonts/TTF/alba_matter.ttf"
 install -Dm 644 "$srcdir/ALBAS___.TTF" "$pkgdir/usr/share/fonts/TTF/alba_super.ttf"
 install -Dm 644 "$srcdir/read_me.pdf" "$pkgdir/usr/share/licenses/ttf-alba/read_me.pdf"
}

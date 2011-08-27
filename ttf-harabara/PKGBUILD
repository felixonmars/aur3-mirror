# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-harabara
pkgver=1.0
pkgrel=4
pkgdesc="Harabara font from dafont.com"
arch=('any')
url="http://www.dafont.com/harabara.font"
license=('Donationware')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=harabara)
md5sums=('2840882889850f1ec1ab87c09b1a9168')

build() {
  install -Dm 644 $srcdir/Harabara.ttf $pkgdir/usr/share/fonts/TTF/Harabara.ttf || return 1
}

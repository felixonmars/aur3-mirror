# Contributor: Jimmy Theis a.k.a jetheis <jimmy@jetheis.com>

pkgname=ttf-vtks-revolt
pkgver=1.0
pkgrel=2
pkgdesc="Vtks Revolt font from dafont.com"
arch=('any')
url="http://www.dafont.com/vtks-revolt.font"
license=('Free for personal use')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=vtks_revolt)
md5sums=('6ba817947ba4aeaca65bc64e6f890fe7')

build() {
  install -Dm 644 $srcdir/Vtks\ Revolt.ttf $pkgdir/usr/share/fonts/TTF/Vtks\ Revolt.ttf || return 1
}

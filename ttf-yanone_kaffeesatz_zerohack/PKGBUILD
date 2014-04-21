# Maintainer: Karsten Hinz <k.hinz@tu-bs.de
pkgname=ttf-yanone_kaffeesatz_zerohack
pkgver=1.0
pkgrel=1
pkgdesc="Like the 'Yanone Kaffeesatz' font, but with a different zero."
license=('SIL Open Font License')
arch=('any')
url="https://stratum0.org/wiki/Yanone_Kaffeesatz_ZeroHack"
depends=('fontconfig' 'xorg-font-utils')
source=("https://stratum0.org/mediawiki/images/3/3c/YanoneKaffeesatzZeroHack-truetype.tar.gz")
md5sums=('b652b9386514e584acd89a6f4c2a54e1')
install=ttf.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
}


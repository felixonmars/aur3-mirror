# Maintainer: garion < garion @ mailoo.org >
# Contributor: GregMits <farfar60259@yahoo.gr>

pkgname=ttf-stylebats
pkgver=1.0
pkgrel=2
pkgdesc="Font with stylish symbols (conky use)."
arch=(any)
url="http://www.dafont.com/style-bats.font"
license=('custom')
depends=(fontconfig xorg-font-utils)
source=(http://img.dafont.com/dl/?f=style_bats)
install=$pkgname.install
md5sums=('c9dee9c6a5a330ff800a86f2c53927f5')

package() {
  install -Dm644 STYLBCC_.TTF $pkgdir/usr/share/fonts/TTF/STYLBCC_.ttf
  install -Dm644 "Readme Stylebats.htm" $pkgdir/usr/share/licenses/$pkgname/readme.htm
}

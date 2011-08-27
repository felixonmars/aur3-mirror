# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=openbox-laza-theme
pkgver=20091217
pkgrel=1
pkgdesc="laza OpenBox Theme"
arch=('any')
url="http://www.box-look.org/content/show.php?content=64954"
license=('GPL')
depends=('openbox')
source=(http://www.box-look.org/CONTENT/content-files/64954-Laza-openbox.tar.gz)
md5sums=('49c909eba6730fb693b8ce33b9baa831')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Laza ${pkgdir}/usr/share/themes/ || return 1
}

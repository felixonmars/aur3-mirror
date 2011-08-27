# Contributor: Pablo <softbieb@gmail.com>

pkgname=openbox-madpablo-theme
pkgver=20100528
pkgrel=1
pkgdesc="MadPablo OpenBox Theme"
arch=('any')
url="http://archbang.47.forumer.com/viewtopic.php?f=28&t=278"
license=('GPL')
depends=('openbox')
source=(http://omploader.org/vNGZoOA.bz2)
md5sums=('f8bd9530b5ae503cb773dfa66a1d51d0')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/madpablo ${pkgdir}/usr/share/themes/ || return 1
}

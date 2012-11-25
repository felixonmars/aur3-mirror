# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=openbox-fawn-theme
_tname="Fawn"
pkgver=2009.04.06
pkgrel=1
pkgdesc="Fawn OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=60129"
license=('GPL')
depends=('openbox')
source=(http://opendesktop.org/CONTENT/content-files/60129-$_tname-openbox.tar.gz)
md5sums=('086a27d107750dc483dce05a81f0f2cd')

build() {
  install -d ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/$_tname ${pkgdir}/usr/share/themes/ || return 1
}

# Maintainer: Dany Martineau <dany.luc.martineau gmail com>

pkgname=jomar3d-data
pkgver=1.1
pkgrel=1
pkgdesc="Data files for jomard3d."
url="http://studios.chalmion.tuxfamily.org/index.php"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://download.tuxfamily.org/chalmion/archives/jomar3d_$pkgver-data.tar.gz)

md5sums=('210176b9795a278ed69dbb9224f43aea')

build() {
  cd "${srcdir}/jomar3d-$pkgver"
  rm COPYING AUTHORS
  install -d -m755 "${pkgdir}/usr/share/jomar3d"
  cp -r ${srcdir}/jomar3d-$pkgver/* ${pkgdir}/usr/share/jomar3d || return 1
}

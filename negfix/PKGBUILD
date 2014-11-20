# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg==|base64 -d>

pkgname=negfix
pkgver=8.3
pkgv=8
pkgrel=1
pkgdesc="A very simple yet powerful script which can be used to turn scanned negative image into the positive image."
arch=('any')
url="https://sites.google.com/site/negfix/"
license=(GPL)
depends=('imagemagick')
source=(https://sites.google.com/site/negfix/downloads/$pkgname$pkgver.tgz)
md5sums=('3387ea8f768c7589755d2dfbc879f82e')

build() {
  cd $srcdir
}

package() {
  cd $srcdir
  mkdir -p ${pkgdir}/usr/bin
  install -D -m755 $pkgname$pkgv ${pkgdir}/usr/bin/$pkgname
}

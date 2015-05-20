# Maintainer: Boy Sandy Gladies Arriezona <reno.esper@gmail.com>

pkgname=kore
pkgver=1.2.2
pkgrel=1
pkgdesc='An easy to use web application framework for writing scalable web APIs in C'
arch=('any')
license=('unknown')
url='https://kore.io/'
depends=('glibc')
source=("https://kore.io/release/$pkgname-$pkgver-release.tgz")
md5sums=('365674266bc70b8c04f663f47dce3422')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"

  mkdir -p $pkgdir/include/$pkgname
  mkdir -p $pkgdir/usr/local/bin
  install -m 755 $pkgname $pkgdir/usr/local/bin
  install -m 644 includes/*.h $pkgdir/include/$pkgname
}

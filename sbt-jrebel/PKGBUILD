# Maintainer: Augusto Elesbão <aelesbao@gmail.com>

pkgname=sbt-jrebel
pkgver=0.1
pkgrel=1
pkgdesc="A simple wrapper for the sbt script created by Paul Phillips <paulp@typesafe.com> that enables JRebel Java Agent."
url="https://github.com/harrah/xsbt"
license=('GPL')
arch=('i686' 'x86_64')

depends=('typesafe-stack')

source=("$pkgname.sh")
md5sums=('e4d83b4bb65d41a0ffe3a4481a6d42b9')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 $srcdir/$pkgname.sh "$pkgdir/usr/bin/$pkgname"
}

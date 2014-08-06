# Author: Arvis Lācis <arvis.lacis@gmail.com>
# Maintainer: Arvis Lācis <arvis.lacis@gmail.com>

pkgname=hideshow
pkgver=1.0.3
pkgrel=1
pkgdesc="Python command-line utility for showing/hiding .desktop files"
arch=('any')
url="https://github.com/arvislacis/python-scripts"
license=('GPL')
depends=('python')
source=("https://github.com/arvislacis/python-scripts/archive/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd "$srcdir/python-scripts-$pkgname-$pkgver/$pkgname"
  install -Dm755 "hideshow.py" "${pkgdir}/usr/bin/hideshow"
}

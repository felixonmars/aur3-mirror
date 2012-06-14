# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=python2-pythontidy
pkgver=1.23
pkgrel=1
pkgdesc="Cleans up, regularizes, and reformats the text of Python scripts."
arch=('any')
url="http://pypi.python.org/pypi/PythonTidy"
license=('GPL')
depends=('python2')
_name=PythonTidy.py
source=($_name::http://lacusveris.com/PythonTidy/PythonTidy-$pkgver.python)

build() {
  sed -i "s+#!/usr/bin/python+#!/usr/bin/python2+g" $srcdir/$_name
}

package() {
  install -Dm755 $srcdir/$_name $pkgdir/usr/bin/$_name
}
md5sums=('64d675842e5eb3c9c65f52325926364b')

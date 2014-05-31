# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-dopy
pkgver=0.2.3
pkgrel=1
pkgdesc="Digital Ocean API Python wrapper"
arch=('any')
depends=('python2' 'python2-requests')
makedepends=('python2-distribute')
url="https://pypi.python.org/pypi/dopy"
license=('MIT')
source=(https://pypi.python.org/packages/source/d/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('8d82a81d977841395077d9149ef85bb5')

prepare() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1 
}

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-cffi
pkgver=0.8.2
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('i686' 'x86_64')
depends=('python2' 'python2-pycparser')
makedepends=('python2-setuptools')
url="http://cffi.readthedocs.org/"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('37fc88c62f40d04e8a18192433f951ec')
sha256sums=('8192393640f7bc304ce82669b35eb90592566a30abbb4924456f52079afc18e2')

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

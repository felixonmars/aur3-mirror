
pkgname=python-massedit
pkgver=0.66
pkgrel=1
pkgdesc="Implements a python mass editor class to process multiple files using Python code"
url="https://bitbucket.org/antocuni/wmctrl"
arch=(any)
license=('MIT')
depends=('python')
source=("https://github.com/elmotec/massedit/archive/v0.66.tar.gz")
md5sums=('d69cd81e678962dd56efc599b29991f5')

build() {
  cd "${srcdir}/massedit-$pkgver"
  python setup.py build
} 

package() {
  cd "${srcdir}/massedit-$pkgver"
  python setup.py install --root=${pkgdir}
}

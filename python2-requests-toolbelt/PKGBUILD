# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python2-requests-toolbelt
_pkgname=requests-toolbelt
pkgver=0.3.1
pkgrel=1
pkgdesc="A toolbelt of useful classes and functions to be used with python2-requests."
arch=('i686' 'x86_64')
url="https://github.com/sigmavirus24/requests-toolbelt"
license=('Apache')
depends=('python2-requests')
#source=("${_pkgname}-${pkgver}.zip::${url}/archive/${pkgver}.zip")
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e563377e46cd0be8c7b3ac144a65844c')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}


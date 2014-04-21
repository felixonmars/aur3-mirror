# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>

pkgname=python-grapefruit-git
pkgver=r39.84fc0d3
pkgrel=1
pkgdesc='A pure Python module that let you easily manipulate and convert color information.'
arch=(any)
url='http://code.google.com/p/grapefruit/'
license=('Apache License 2.0')
makedepends=('python2-distribute')
depends=('python2')
conflicts=('python-grapefruit' 'python2-grapefruit')
replaces=('python-grapefruit')
source=("$pkgname::git+https://github.com/xav/Grapefruit.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${srcdir}/${pkgname}"
  cp README.rst README
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

#check() {
#  cd "${srcdir}/${pkgname}"
#  python setup.py test
#}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=pylibemu-git
pkgver=65.4c8d9e1
pkgrel=1
pkgdesc="A Libemu Cython wrapper"
arch=('any')
url="https://github.com/buffer/pylibemu"
license=('GPLv2')
depends=('python2' 'libemu')
makedepends=('git' 'python2-setuptools')
source=('git+https://github.com/buffer/pylibemu')
md5sums=('SKIP')

pkgver() {
  cd pylibemu
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd ${srcdir}/pylibemu
  python2 setup.py build
}
package(){
  cd ${srcdir}/pylibemu
  python2 setup.py install --root=$pkgdir
}


# vim:set ts=2 sts=2 sw=2 et

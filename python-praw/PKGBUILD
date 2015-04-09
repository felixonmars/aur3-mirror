# Maintainer: dnuux <dnuuxx@gmail.com>

pkgname=python-praw
_pkgname=praw
pkgver=2.1.21
pkgrel=1
pkgdesc="Python Reddit API Wrapper"
url="https://praw.readthedocs.org/"
arch=('any')
license=('GPL3')
depends=('python-requests' 'python-six' 'python-update_checker')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3b0388c9105662f8be8f1a4d3a38216d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

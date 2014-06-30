# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail
pkgname=python2-hcs_utils
pkgver=1.5
pkgrel=1
pkgdesc="Collection of snippets that are used in multiple projects, primarily goobook"
arch=('any')
url="http://gitorious.org/hcs_utils"
license=('GPL')
provides=('hcs_utils')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/h/hcs_utils/hcs_utils-$pkgver.tar.gz")
md5sums=('338396ee252d76c6c03505628b245c75')

build() {
  cd "hcs_utils-$pkgver"
  python2 setup.py build || return 1
}

package() {
  cd "hcs_utils-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}

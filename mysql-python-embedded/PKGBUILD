# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
pkgname=mysql-python-embedded
pkgver=1.2.3
pkgrel=1
pkgdesc="MySQL support for Python"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/mysql-python"
license=('GPL2')
depends=('python>=2.7')
makedepends=('mariadb' 'setuptools')
source=("http://sourceforge.net/projects/mysql-python/files/mysql-python/${pkgver}/MySQL-python-${pkgver}.tar.gz")
sha256sums=('7de66fbbf923634e7c965aeaefa74642ba75ae20ee1cefcefc3009595b7a7e6e')

build() {
  cd ${startdir}/src/MySQL-python-${pkgver}
  sed 's@env python@env python2@' -i setup.py
}

package() {
  cd ${startdir}/src/MySQL-python-${pkgver}
  yes | python2 setup.py install --root=${startdir}/pkg
}

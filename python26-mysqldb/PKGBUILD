# Contributor: Devaev Maxim <mdevaev@gmail.com>

pkgname=python26-mysqldb
pkgver=1.2.3
pkgrel=1
pkgdesc="MySQL support for Python"
arch=('i686' 'x86_64')
url="http://mysql-python.sourceforge.net/"
license=('GPL2')
depends=('python26' 'libmysqlclient')
makedepends=('mysql' 'python26' 'python26-distribute')
source=("http://downloads.sourceforge.net/mysql-python/MySQL-python-${pkgver}.tar.gz")
md5sums=('215eddb6d853f6f4be5b4afc4154292f')

package() {
  cd ${srcdir}/MySQL-python-${pkgver}
  python2.6 setup.py install --root=${pkgdir} --optimize=1
}


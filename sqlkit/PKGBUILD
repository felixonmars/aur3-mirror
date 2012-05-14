# Maintainer: Your Name <youremail@domain.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=sqlkit
pkgver=0.9.5.1
pkgrel=1
pkgdesc="Sqlkit is a tool to edit data of a database (as opposed to 
schemas) in the easiest possible way using python and sql"
arch=(any)
url="http://sqlkit.argolinux.org"
license=('GPL')
depends=('python2' 'pygtk' 'python-babel' 'python2-sqlalchemy' 'python2-dateutil')
source=("http://sqlkit.argolinux.org/download/$pkgname-$pkgver.tar.gz")
md5sums=('4109d00fa72ef73ffa9ee0dbfb616f01')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:

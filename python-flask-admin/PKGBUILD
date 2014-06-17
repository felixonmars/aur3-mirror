# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
_python=python
_distname=Flask-Admin
pkgname=$_python-flask-admin
pkgver=1.0.8
pkgrel=1
pkgdesc="Simple and extensible admin interface framework for Flask"
arch=(any)
url="http://flask-admin.readthedocs.org"
license=('BSD')
depends=('python' 'python-flask')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz")
md5sums=('dd245b0d72ce1d78bb60533741871e75')

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

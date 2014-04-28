# Maintainer: Erhan SAHIN <erhan@ssahin.net> 

pkgname=python2-sqlalchemy-havana
pkgver=0.7.9
pkgrel=1
arch=('i686' 'x86_64') # python2 package contain .so
url="http://www.sqlalchemy.org/"
license=('custom')
makedepends=('python2' 'python2-distribute' 'python2-nose')
source=("https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz")
md5sums=('a0b58defc5ad0c7e1baeb932f62d08dd')
pkgdesc='Python 2 SQL toolkit and Object Relational Mapper'
depends=('python2')
provides=('python2-sqlalchemy')
conflicts=('python2-sqlalchemy')

build() {
  cd ${srcdir}/SQLAlchemy-$pkgver
  python2 setup.py build
}

check() {
  cd SQLAlchemy-${pkgver}
  python2 setup.py check
}

package() {
  cd SQLAlchemy-$pkgver
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

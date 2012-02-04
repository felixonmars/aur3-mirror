# Maintainer: Casper Bruun <casperbruun@gmail.com>
# Based on Angel Velasquez's python-sqlalchemy package

pkgname=python-sqlalchemy-py3k
pkgver=0.6.5
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper. Python 3 version."
arch=('any')
url="http://www.sqlalchemy.org/"
license=('MIT')
depends=('python' 'python2-distribute')
source=(http://downloads.sourceforge.net/sourceforge/sqlalchemy/SQLAlchemy-$pkgver.tar.gz)
md5sums=('0152094452e7e94b6505190db6c8ede8')

build() {
  cd ${srcdir}/SQLAlchemy-${pkgver}
  python distribute_setup.py
  python sa2to3.py --no-diffs -w lib test examples
  python setup.py install --root=${pkgdir}
  install -D -m644 LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}


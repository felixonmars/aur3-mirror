# Maintainer: Loren Copeland <thisisquitealongname@gmail.com>

pkgname=python2-sqlalchemy-0.6
pkgver=0.6.8
pkgrel=2
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('any')
url="http://www.sqlalchemy.org"
license=('MIT')
depends=('python2' 'setuptools')
conflicts=('python-sqlalchemy' 'python2-sqlalchemy')
provides=('python-sqlalchemy' 'python2-sqlalchemy')
source=(http://downloads.sourceforge.net/sourceforge/sqlalchemy/SQLAlchemy-$pkgver.tar.gz)
md5sums=('af56550a6eb8b7a8874b02c97407d73c')

build()
{
  cd ${srcdir}/SQLAlchemy-${pkgver}
  python2 setup.py install --root=${pkgdir} || return 1

  install -D -m644 LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}

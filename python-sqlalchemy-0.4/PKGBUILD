# $Id: PKGBUILD 6044 2009-11-27 08:29:17Z rvanharen $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=python-sqlalchemy-0.4
pkgver=0.4.8
pkgrel=2
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('any')
url="http://www.sqlalchemy.org"
license=('MIT')
depends=('python' 'setuptools')
conflicts=('python-sqlalchemy')
source=(http://downloads.sourceforge.net/sourceforge/sqlalchemy/SQLAlchemy-$pkgver.tar.gz)
md5sums=('2377e8f87d60e5040e2efc67bfd240b0')

build()
{
  cd ${srcdir}/SQLAlchemy-${pkgver}
  python setup.py install --root=${pkgdir} || return 1

  install -D -m644 LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}

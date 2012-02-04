# $Id$
# Maintainer : Damien Churchill <damoxc@gmail.com>

pkgname=python2-zope-sqlalchemy
pkgver=0.6.1
pkgrel=2
pkgdesc="Minimal Zope/SQLAlchemy transaction integration"
license=('ZPL')
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/zope.sqlalchemy"
depends=('python2')
conflicts=('zope-sqlalchemy')
replaces=('zope-sqlalchemy')
source=(http://pypi.python.org/packages/source/z/zope.sqlalchemy/zope.sqlalchemy-${pkgver}.tar.gz)
md5sums=('581205d24a7c87d1e8fa627a32a49bad')

build() {
  cd ${srcdir}/zope.sqlalchemy-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
  # Blabla.
  rm $pkgdir/usr/lib/python2.7/site-packages/zope/sqlalchemy/README*.txt
}

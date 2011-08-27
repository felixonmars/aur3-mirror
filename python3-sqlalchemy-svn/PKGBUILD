# Contributor:  atie H. <atie.at.matrix@gmail.com>
# Contributor:  Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=python3-sqlalchemy-svn
pkgver=6528
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL for python2 and python3"
url="http://www.sqlalchemy.org/"
license=('MIT')
arch=(i686 x86_64)
depends=('python' 'python3')
makedepends=('subversion')
conflicts=('sqlalchemy')
provides=('sqlalchemy')

source=()
md5sums=()

_svntrunk=http://svn.sqlalchemy.org/sqlalchemy/trunk
_svnmod=sqlalchemy

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver $_svnmod
  fi

  cd $_svnmod
  python2.6 setup.py install --root=$pkgdir
  python2.6 sa2to3.py ./lib/ -w
  sed '{s/from types import NoneType//g;s/NoneType/type(None)/g}' -i lib/sqlalchemy/orm/properties.py
  python3 setup.py install --root=$pkgdir
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv LICENSE $pkgdir/usr/share/licenses/$pkgname
  find $pkgdir -name .svn -exec rm -rf {} \; > /dev/null 2>&1  

  rm -rf $srcdir/$_svnmod-build
}



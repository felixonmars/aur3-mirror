# Contributor:  atie H. <atie.at.matrix@gmail.com>

pkgname=sqlalchemy-svn
pkgver=5639
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL"
url="http://www.sqlalchemy.org/"
license=('MIT')
arch=(i686 x86_64)
depends=('python')
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
  python setup.py install --root=$pkgdir
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv LICENSE $pkgdir/usr/share/licenses/$pkgname
  find $pkgdir -name .svn -exec rm -rf {} \; > /dev/null 2>&1  

  rm -rf $srcdir/$_svnmod-build
}



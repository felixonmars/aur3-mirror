# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sqlalchemy-hg
pkgver=9285
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('any')
url="http://www.sqlalchemy.org/"
license=('custom:MIT')
depends=('python')
makedepends=('mercurial')
provides=('sqlalchemy')
conflicts=('sqlalchemy')
source=(hg+http://hg.sqlalchemy.org/sqlalchemy)
md5sums=('SKIP')
_hgrepo="sqlalchemy"

pkgver() {
  cd $srcdir/$_hgrepo
  echo $(hg identify -ni|cut -d " " -f2)
}

package() {
  cd "$srcdir/$_hgrepo"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  find $pkgdir -name .svn -exec rm -rf {} \; > /dev/null 2>&1  
}

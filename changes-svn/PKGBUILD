# Contributor: Ruben Schuller <r.schuller@orgizm.net>

pkgname=changes-svn
pkgver=353
pkgrel=1
pkgdesc="Small terminal based notes tool."
arch=('i686' 'x86_64' 'ppc')
provides=('changes')
license=('GPL')
url="https://svn.orgizm.net/collective/"
depends=('python')
makedepends=('subversion')
source=()
md5sums=()
_svntrunk=svn://svn.orgizm.net/svn/collective/changes
_svnmod=changes

build() {
  cd $startdir/src
  msg "Updating changes SVN..."
  svn co $_svntrunk -r $pkgver $svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $startdir/src/$_svnmod
  python setup.py install --root=$startdir/pkg
  }

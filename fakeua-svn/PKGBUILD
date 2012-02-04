# Contributor: Ruben Schuller <r.schuller@orgizm.net>

pkgname=fakeua-svn
pkgver=344
pkgrel=2
pkgdesc="Python module for fakeing User-Agent strings."
arch=('i686' 'x86_64' 'ppc')
provides=('fakeua')
license=('GPL')
url="http://svn.orgizm.net/collective/browser/fakeua"
depends=('python')
makedepends=('subversion')
source=()
md5sums=()
_svntrunk=svn://svn.orgizm.net/svn/collective/fakeua
_svnmod=fakeua

build() {
  cd $startdir/src
  msg "Updating fakeua SVN..."
  svn co $_svntrunk -r $pkgver $svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $startdir/src/$_svnmod
  python setup.py install --root=$startdir/pkg
  }

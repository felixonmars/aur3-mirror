# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=pyrxp-svn
pkgver=3377
pkgrel=1
pkgdesc="The fastest validating XML parser available for Python"
arch=('i686')
url="http://www.reportlab.org/pyrxp.html"
license=('GPL')
depends=('python2')
makedepends=('subversion')
conflicts=('pyrxp')
provides=('pyrxp')
source=()
md5sums=()

_svntrunk=http://svn.reportlab.com/svn/public/pyRXP/trunk/src
_svnmod=pyRXP

build() {
  cd $startdir/src
  msg "Connecting to SVN server..."
  msg "Checking out $_svnmod"
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod 
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  cp -r ../$_svnmod ../$_svnmod-build
  cd ../$_svnmod-build
  sed -i -e "s:self->srcName = NULL:(self->srcName = NULL):g" pyRXP.c
  python2 setup.py install --root=$startdir/pkg --prefix=/usr
  rm -rf $startdir/src/$_svnmod-build
}

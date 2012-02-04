
pkgname=parcelle-svn
pkgver=24
pkgrel=1
pkgdesc="Python/PyGTK application that captures and saves clipboard history."
url='http://code.google.com/p/xyhthyx/'
license='GPL'
depends=('pygtk')
makedepends=('subversion')
conflicts=('parcelle')
provides=('parcelle')
arch=(i686 x86_64)

source=()
md5sums=()

_svntrunk=http://xyhthyx.googlecode.com/svn/trunk/
_svnmod=xyhthyx

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  
  cd $startdir/src/$_svnmod/parcelle
  chmod +x 'setup.py'
  ./setup.py install --prefix=/usr --root=$startdir/pkg
}
# vim:syntax=sh

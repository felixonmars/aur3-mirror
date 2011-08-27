# Contributor: Claudio Sabattoli <sbarbi@eccelinux.org>

pkgname=pymsn-svn
pkgver=10248
pkgrel=1
pkgdesc="A msn python library, rewrite of the Ivy library"
url="http://telepathy.freedesktop.org/wiki/Pymsn/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('adns-python' 'pycrypto' 'pygobject' 'pyopenssl')
makedepends=('subversion')
provides=('pymsn')
conflicts=('pymsn')
source=()
md5sums=()

_svntrunk=https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn2/pymsn
_svnmod=pymsn

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  python setup.py install --root=$startdir/pkg || return 1
}
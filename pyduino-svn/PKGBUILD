# Contributor: Joris Peeraer <jorispeeraer@gmail.com>

pkgname=pyduino-svn
pkgver=2
pkgrel=1
pkgdesc="A python interface for communicating to an Arduino with the Firmata protocol"
url="http://code.google.com/p/pyduino/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python-pyserial')
makedepends=('subversion')
provides=('pyduino')
conflicts=('pyduino')
source=(firmata-2.1.patch)
md5sums=('32d032d27f8ca2ab808dfb2dcbd53903')

_svntrunk=http://pyduino.googlecode.com/svn/trunk/
_svnmod=pyduin-read-only

x_apply_patch=1

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  
  rm -r $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  msg "Applying patches"
  patch -p0 -i $srcdir/firmata-2.1.patch || return 1

  msg "Starting make..."
  python setup.py install --root=$startdir/pkg || return 1
}

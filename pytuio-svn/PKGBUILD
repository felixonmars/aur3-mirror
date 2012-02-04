# Maintainer: Pierre Chapuis <catwell@archlinux.us>

pkgname=pytuio-svn
pkgver=15
pkgrel=1
pkgdesc="Python interface to the TUIO protocol, SVN version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pytuio/" 
license=('MIT')
depends=('python')
makedepends('svn')
source=(LICENSE.txt)
md5sums=(9237cddd10d60d39b0f343f3583c8115)

_svnmod="pytuio"
_svntrunk=http://pytuio.googlecode.com/svn/trunk/tuio/

build() {

  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver
  else
    svn co $_svntrunk --config-dir . -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cp -r $_svnmod tuio

  msg "Building the package..."
  python -mcompileall tuio || return 1
  install -d $pkgdir/usr/lib/python2.6/site-packages
  cp -r tuio $pkgdir/usr/lib/python2.6/site-packages
  install -Dm0644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt

  msg "Cleaning build files..."
  rm -rf $srcdir/tuio

}

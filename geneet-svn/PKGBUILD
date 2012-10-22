pkgname=geneet-svn
pkgver=76262
pkgrel=1
pkgdesc="Generator for EFL's pickler/unpickler library, EET"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('MIT-custom')
depends=('python2' 'python2-pyparsing')
makedepends=('svn')
provides=('geneet')
options=('!libtool')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/geneet"
_svnmod="geneet"

build() {
   cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  
  cd $srcdir
  rm -rf $_svnmod-build
  cp -rf $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  python2 setup.py install --prefix=$pkgdir/usr

}

package(){
  cd $srcdir/$_svnmod-build

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/COPYING

  rm -r $srcdir/$_svnmod-build

}

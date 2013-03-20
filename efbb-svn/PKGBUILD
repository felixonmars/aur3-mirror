#Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=efbb-svn
pkgver=82135
pkgrel=2
pkgdesc="Escape from Booty Bay is an EFL-based physics game that explore EPhysics amazing features"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-git' 'efl-git' 'libcanberra' 'geneet-git' 'etrophy' 'python2-pyparsing')
makedepends=('svn')
options=('!libtool')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/GAMES/efbb"
_svnmod="efbb"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  
  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd $srcdir/$_svnmod-build
  make DESTDIR=$pkgdir install

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/COPYING
}

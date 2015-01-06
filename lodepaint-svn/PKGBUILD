# Maintainer: Lode Vandevenne <myfirstname.mylastname@gmail.com>
pkgname=lodepaint-svn
pkgver=146
pkgrel=2 
pkgdesc="Painting program with many tools and filters"
url="http://sourceforge.net/projects/lodepaint/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl')
source=()
md5sums=()
_svntrunk=http://svn.code.sf.net/p/lodepaint/code/trunk
_svnmod=lodepaint-code
build() {
 cd "$srcdir"
LANG=C
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/main_program"

  #
  # BUILD
  #
  
  make -j1 DESTDIR=$pkgdir
}
package() {
  cd "$srcdir/$_svnmod-build/main_program"
  make DESTDIR=$pkgdir install
}

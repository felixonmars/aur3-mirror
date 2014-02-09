# Maintainer: perlawk
pkgname=pawn-svn
pkgver=4.0.4825
pkgrel=1
pkgdesc="pawn is a simple, typeless, 32-bit extension language with a C-like syntax. A pawn "source" program is compiled to a binary file for optimal execution speed."
arch=(i686 x86_64)
url="http://www.compuphase.com/pawn/pawn.htm"
license=('Apache V.2')
makedepends=('subversion')
backup=()
options=('!strip')
install=pawn.install
source=('pawnsvn.patch')

_svntrunk=http://pawnscript.googlecode.com/svn/trunk/ 
_svnmod=pawnscript-read-only

prepare() {

  cd "$srcdir"
  if [ ! -e pawnscript-read-only ]; then
    msg "Connecting to SVN server...."

    if [[ -d "$_svnmod/.svn" ]]; then
      (cd "$_svnmod" )
    else
      svn co "$_svntrunk" "$_svnmod"
      #svn checkout http://pawnscript.googlecode.com/svn/trunk/ pawnscript-read-only
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_svnmod-build"
    svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    patch "$srcdir"/pawnscript-read-only-build/amx/amxprocess.c < pawnsvn.patch
  fi
}

build() {
  cd "$srcdir/$_svnmod-build"
  mkdir -p build
  cd build
  cmake ../
  make -j4
}

package() {
  cd "$srcdir/$_svnmod-build/build"
  mkdir -p $pkgdir/usr/{lib/pawn/bin,share/doc/pawn/doc}
  cp am*so pawncc pawndisasm pawnrun $pkgdir/usr/lib/pawn/bin 
  cd ..
  cp -a include $pkgdir/usr/lib/pawn/
  cp doc/*pdf -t $pkgdir/usr/share/doc/pawn/doc/
  cp -a examples  $pkgdir/usr/share/doc/pawn/
}
md5sums=('8f82682901c380027d814ffd37641a9f')

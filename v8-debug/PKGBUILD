# Author: Christian Kruse <cjk@wwwtech.de>
pkgname=v8-debug
pkgrel=1
pkgver=10521
pkgdesc="Debug build of Google's C++ javascript engine"
url="http://code.google.com/p/v8/"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('scons>=2.1' 'subversion>=1.4')

_svntrunk=http://v8.googlecode.com/svn/branches/3.7/
_svnmod=v8

source=()

build() {
  cd $srcdir

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn update)
  else
    svn co "$_svntrunk" "$_svnmod"
  fi

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  [ "$CARCH" = 'i686' ]   && SCONS_ARCH=ia32
  [ "$CARCH" = 'x86_64' ] && SCONS_ARCH=x64

  CFLAGS="-ggdb -O0" CXXFLAGS="-ggdb -O0" scons mode=debug library=shared arch=$SCONS_ARCH snapshot=on sample=shell
  CFLAGS="-ggdb -O0" CXXFLAGS="-ggdb -O0" scons d8 arch=$SCONS_ARCH mode=debug
}

package() {
  cd "$srcdir/$_svnmod-build"
  find include -type f -exec install -Dm644 {} $pkgdir/usr/{} \;
  rm -rf $pkgdir/usr/include/.svn
  install -Dm755 d8_g "$pkgdir/usr/bin/d8_g"
  install -Dm755 libv8_g.so "$pkgdir/usr/lib/libv8_g.so"
}

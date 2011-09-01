pkgname=v8-current
pkgver=latest
pkgrel=1
pkgdesc='A fast and modern javascript engine'
arch=('i686' 'x86_64' 'arm')
url='http://code.google.com/p/v8'
license=('BSD')
makedepends=('subversion' 'scons')
conflicts=('v8')
provides=('v8')
source=('werror.patch')
md5sums=('fd95683b3b9f389a11391d83e1b5cfb8')

_svntrunk=http://v8.googlecode.com/svn/branches/bleeding_edge/
_svnmod=v8

build() {
  cd "$srcdir"
  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" "$_svnmod"
  fi
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # https://github.com/joyent/node/issues/1377
  patch -Np1 -i $srcdir/werror.patch
  
  [ "$CARCH" = 'i686' ]   && SCONS_ARCH=ia32
  [ "$CARCH" = 'x86_64' ] && SCONS_ARCH=x64

  scons mode=release library=shared arch=$SCONS_ARCH
  scons d8 arch=$SCONS_ARCH
}
package(){
  cd "$srcdir/$_svnmod-build"
  find include -type f -exec install -Dm644 {} $pkgdir/usr/{} \;
  rm -rf $pkgdir/usr/include/.svn
  install -Dm755 d8 "$pkgdir/usr/bin/d8"
  install -Dm755 libv8.so "$pkgdir/usr/lib/libv8.so"
}

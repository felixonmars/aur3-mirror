# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=libdispatch-svn 
pkgver=32
pkgrel=1
pkgdesc="The libdispatch userspace implementation of the Grand Central Dispatch API, compiled with blocks support"
url="http://libdispatch.macosforge.org/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('libkqueue' 'llvm-compiler-rt-svn' 'libbsd' 'libpthread_workqueue-svn')
makedepends=('subversion' 'pkgconfig' 'quilt' 'clang')
conflicts=('libdispatch')
provides=('libdispatch')
options=('!libtool')

source=()

_svntrunk=svn://mark.heily.com/libdispatch/trunk
_svnmod=libdispatch-svn

build() {
  cd $srcdir
  msg "fetching or updating sources from SVN..."

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co ${_svntrunk} -r ${pkgver} ${_svnmod} || return 1
  fi

  msg "setting up a separate build directory"
  rm -rf $srcdir/build
  cp -ar $srcdir/$_svnmod $srcdir/build

  msg "configuring the build environment"
  cd $srcdir/build

  #remove builtin lib patch (use dependency)
  sed -i -e '/use_builtin_compat_libs/d' patches/series

  # fix install path
  sed -i -e 's|-I/usr/local/include -L/usr/local/lib" ./configure|-I/usr/include -L/usr/lib" KQUEUE_CFLAGS="-I /usr/include/kqueue" ./configure --prefix=/usr --with-blocks-runtime=/usr/lib |g' Makefile

  msg "starting make"
  make || return 1
}


package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install || return 1
}

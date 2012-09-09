# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=libblocksruntime-svn
pkgver=25
pkgrel=1
pkgdesc="libBlocksRuntime is a distributed as part of compiler-rt"
url="http://mark.heily.com/project/libblocksruntime"
arch=('i686' 'x86_64')
license=('Apache')
depends=('glibc')
makedepends=('subversion' 'pkgconfig' 'perl-yaml' 'ruby' 'clang')
conflicts=('llvm-compiler-rt')
provides=('libblocksruntime')
options=('!libtool')
source=()

_svntrunk=svn://mark.heily.com/libBlocksRuntime/trunk
_svnmod=libblocksruntime-svn

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

  cd $srcdir/build
  #CFLAGS='-fPIC' ./configure --prefix=/usr || return 1
  ./configure || return 1
  make all || return 1
}

package() {
  cd "${srcdir}/build"

  install -d ${pkgdir}/usr/lib
  install -m 0644 libBlocksRuntime.so ${pkgdir}/usr/lib
  install -m 0644 libBlocksRuntime.a ${pkgdir}/usr/lib
#  install -d ${pkgdir}/usr/bin
#  install -m 0755 headers ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/include
  install -m 644 Block.h Block_private.h ${pkgdir}/usr/include



#  install -d ${pkgdir}/usr/lib
#  install -d ${pkgdir}/usr/include
#  make PREFIX=/usr DESTDIR=$pkgdir install || return 1
}

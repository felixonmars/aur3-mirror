# Contributor: BeholdMyGlory <larvid@gmail.com>
pkgname=ldc-hg
pkgver=1629
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure"
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/ldc"
license=('BSD')
depends=('llvm')
makedepends=('libconfig' 'cmake' 'mercurial')
provides=('ldc')
optdepends=('libtango-ldc-svn: Runtime library')
source=('CMakeLists.patch')
md5sums=('61be322267025571bd9261eb122af2d1')

_hgroot="http://hg.dsource.org/projects"
_hgrepo="ldc"

build() {
  unset LDFLAGS

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo && hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_hgrepo"

  patch CMakeLists.txt $srcdir/CMakeLists.patch

  cmake -DCMAKE_CXX_FLAGS:string=-DLLVM_REV=84989 -DCMAKE_INSTALL_PREFIX=/usr ./ || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

} 

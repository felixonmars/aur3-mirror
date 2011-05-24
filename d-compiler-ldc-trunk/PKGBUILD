# Contributor: BeholdMyGlory <larvid@gmail.com>
# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-compiler-ldc-trunk
pkgver=1964
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure"
arch=('i686' 'x86_64')
url="http://dsource.org/projects/ldc"
license=('BSD')
depends=('libconfig' 'libffi')
makedepends=('llvm' 'cmake' 'mercurial')
provides=('ldc' 'd-compiler-ldc')
conflicts=('ldc-hg')
replaces=('ldc-hg')
optdepends=('d-stdlib-tango: Runtime library')
source=('ldc.rebuild.conf.patch' 'rebuild-profile-x86.patch' 'rebuild-profile-x86_64.patch')
md5sums=('d8c459d60d0d66ce78f46dd09d0a5240' 'f4b8ecce094439ec49a8fcfb19220875' '778fe9a80869f17f0849c6a2083335f5')

_hgroot="http://bitbucket.org/lindquist"
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

  patch ldc.rebuild.conf.in $srcdir/ldc.rebuild.conf.patch

  cmake -DCMAKE_CXX_FLAGS:string=-DLLVM_REV=80000 -DCMAKE_INSTALL_PREFIX=/usr -DRUNTIME_DIR=/usr/include/d ./ || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  
  mkdir -p $pkgdir/etc/rebuild
  cp ldc-posix-tango $pkgdir/etc/rebuild/
  if [ "$CARCH" = 'x86_64' ]; then
    patch $pkgdir/etc/rebuild/ldc-posix-tango $srcdir/rebuild-profile-x86_64.patch
  else
    patch $pkgdir/etc/rebuild/ldc-posix-tango $srcdir/rebuild-profile-x86.patch
  fi
  mv $pkgdir/usr/etc/* $pkgdir/etc/
  rm -rf $pkgdir/usr/etc
}

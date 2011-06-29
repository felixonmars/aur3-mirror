# Current maintainer: kozec <kozec-at-kozec-dot-com>
# Contributor: tocer <tocer.deng@gmail.com>
pkgname=v8-static
pkgver=2.1.2.3
pkgrel=2
pkgdesc="building Google V8 as static library required by python-pyv8"
arch=('i686' 'x86_64')
url="http://code.google.com/p/v8"
license=('BSD')
groups=()
conflicts=(v8-static-svn)
makedepends=('subversion' 'scons')
source=("no-strict-aliasing.patch")
md5sums=('f712dc6b1a9d2684b9d8b15412e9d0e5')

build() {
  cd ${srcdir} || return 1

  # Checkut from SVN
  svn co http://v8.googlecode.com/svn/tags/$pkgver $pkgname-$pkgver
  
  [ -d $pkgname-$pkgver-build ] && rm -Rf $pkgname-$pkgver-build
  cp -R $pkgname-$pkgver $pkgname-$pkgver-build
  cd $pkgname-$pkgver-build

  # Patch for GCC 4.4 ( http://code.google.com/p/v8/issues/detail?id=413 )
  patch < ../no-strict-aliasing.patch

  # This is needed for the SConstruct script to work
  export GCC_VERSION=44

  # Check which CPU architecture to build for
  if [ "${CARCH}" = "i686" ]; then
    SCONS_ARCH=ia32
  elif [ "${CARCH}" = "x86_64" ]; then
    SCONS_ARCH=x64
  fi

  # Build as static library required by python-pyv8
  CPPFLAGS=-Wno-error=unused-but-set-variable scons mode=release library=static arch=$SCONS_ARCH || return 1

  # Build the developer shell "d8" aswell
  #scons d8 arch=$SCONS_ARCH || return 1
}

package() {
  cd ${srcdir}/$pkgname-$pkgver-build
  
  # Create package directory structure
  mkdir -p $pkgdir/usr/lib/v8/include
  mkdir -p $pkgdir/usr/lib/v8/src/{ia32,x64}
  #mkdir -p $pkgdir/usr/bin

  # Copy libraries release and headers to the package folder
  cp libv8.a 	 $pkgdir/usr/lib/v8
  cp include/* $pkgdir/usr/lib/v8/include
  cp src/*.h 	 $pkgdir/usr/lib/v8/src
  cp src/ia32/*.h 	 $pkgdir/usr/lib/v8/src/ia32
  cp src/x64/*.h 	 $pkgdir/usr/lib/v8/src/x64
  #cp d8 $pkgdir/usr/bin
}


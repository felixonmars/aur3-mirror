# Contributor: tocer <tocer.deng@gmail.com>
pkgname=v8-static-svn
pkgrel=1
pkgver=4328
pkgdesc="building Google V8 as static library required by python-pyv8"
arch=('i686' 'x86_64')
url="http://code.google.com/p/v8"
license=('BSD')
groups=()
conflicts=()
makedepends=('subversion' 'scons')
_svntrunk="http://v8.googlecode.com/svn/trunk"
_svnmod=v8-svn
md5sums=()

build() {
  cd ${srcdir} || return 1

  # Checkut from SVN
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    # svn co -r ${pkgver} ${_svntrunk} ${_svnmod}
    svn co ${_svntrunk} ${_svnmod}
  fi

  cd ${_svnmod}

  # This is needed for the SConstruct script to work
  export GCC_VERSION=44

  # Check which CPU architecture to build for
  if [ "${CARCH}" = "i686" ]; then
    SCONS_ARCH=ia32
  elif [ "${CARCH}" = "x86_64" ]; then
    SCONS_ARCH=x64
  fi

  # Build as static library required by python-pyv8
  #scons mode=release library=static arch=$SCONS_ARCH || return 1
  scons mode=release library=static || return 1

  # Build the developer shell "d8" aswell
  #scons d8 arch=$SCONS_ARCH || return 1
  
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

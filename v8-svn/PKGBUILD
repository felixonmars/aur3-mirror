# Maintainer: Gunnar Kriik <gunnar.kriik@gmail.com>
# Contributor: krigun

pkgname=v8-svn
pkgrel=1
pkgver=4328
pkgdesc="V8 is Google's open source JavaScript engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/v8"
license=('BSD')
groups=()
makedepends=('subversion' 'scons')

_svntrunk="http://v8.googlecode.com/svn/trunk"
_svnmod=v8-svn

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

  # Build both release and debug libraries
  scons mode=release library=shared arch=$SCONS_ARCH || return 1
  scons mode=debug library=shared arch=$SCONS_ARCH || return 1

  # Build the developer shell "d8" aswell
  scons d8 arch=$SCONS_ARCH || return 1
  
  # Create package directory structure
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin

  # Copy libraries (release + debug) and headers to the package folder
  cp libv8.so $pkgdir/usr/lib
  cp libv8_g.so $pkgdir/usr/lib
  cp -R include/* $pkgdir/usr/include
  cp d8 $pkgdir/usr/bin
}

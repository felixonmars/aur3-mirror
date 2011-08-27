# Contributor: James Snyder <jbsnyder@fanplastic.org>
pkgname=llvm-lua-svn
_pkgname=llvm-lua
pkgver=116
pkgrel=3
pkgdesc="A JIT and static Lua compiler that uses LLVM as the compiler backend."
arch=(x86_64)
url="http://code.google.com/p/llvm-lua"
license=('MIT')
depends=(gcc-libs readline clang llvm)
makedepends=('subversion')

_svntrunk=http://${_pkgname}.googlecode.com/svn/trunk
_svnmod=${_pkgname}-read-only

_build="$srcdir/$_svnmod-build"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Clearing out old build directory..."

  rm -rf ${_build}
  mkdir ${_build}
  cd "${_build}"

  msg "Starting make..."

  cmake "$srcdir/$_svnmod" -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
	-DCMAKE_INSTALL_RPATH=/usr/lib

#	-DWANT_SHARED_LIBRARY=OFF

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  mkdir -p ${pkgdir}/usr/share/licenses/llvm-lua-svn/ || return 1
  install ${srcdir}/${_svnmod}/COPYRIGHT \
	${pkgdir}/usr/share/licenses/llvm-lua-svn/ || return 1
  chmod 755 ${pkgdir}/usr/bin/lua-compiler || return 1
  rm -f ${pkgdir}/usr/lib/liblua.*
}

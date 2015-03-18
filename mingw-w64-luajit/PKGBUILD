# Maintainer: edubart <edub4rt@gmail.com>
pkgname=mingw-w64-luajit
pkgver=2.0.3
pkgrel=2
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1 (mingw-w64)'
arch=(any)
url='http://luajit.org/'
license=('MIT')
depends=('mingw-w64-crt')
source=(http://luajit.org/download/LuaJIT-${pkgver/rc/-rc}.tar.gz)
sha256sums=('55be6cb2d101ed38acca32c5b1f99ae345904b365b642203194c585d27bebd79')

_archs="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  for _arch in ${_archs}; do
    mkdir -p ${srcdir}/luajit-build-${_arch} && cd ${srcdir}/luajit-build-${_arch}
    cp -R $srcdir/LuaJIT-$pkgver/* .
    cd src

    sed -i 's/^BUILDMODE= [a-z]*$/BUILDMODE= dynamic/' Makefile
    make clean
    if [ "$_arch" == "i686-w64-mingw32" ]; then
        make PREFIX=/usr/$_arch HOST_CC="gcc -m32" CROSS=${_arch}- TARGET_SYS=Windows lua51.dll
    else
        make PREFIX=/usr/$_arch HOST_CC="gcc -m64" CROSS=${_arch}- TARGET_SYS=Windows lua51.dll
    fi
    cp lua51.dll ../

    sed -i 's/^BUILDMODE= [a-z]*$/BUILDMODE= static/' Makefile
    make clean
    if [ "$_arch" == "i686-w64-mingw32" ]; then
        make PREFIX=/usr/$_arch HOST_CC="gcc -m32" CROSS=${_arch}- TARGET_SYS=Windows libluajit.a
    else
        make PREFIX=/usr/$_arch HOST_CC="gcc -m64" CROSS=${_arch}- TARGET_SYS=Windows libluajit.a
    fi
  done
}

package() {
  for _arch in ${_archs}; do
      cd ${srcdir}/luajit-build-${_arch}
      mkdir -p $pkgdir/usr/${_arch}/{lib,bin}
      mkdir -p $pkgdir/usr/${_arch}/include/luajit-2.0
      cp lua51.dll $pkgdir/usr/${_arch}/bin/luajit-2.0.dll
      cp src/libluajit.a $pkgdir/usr/${_arch}/lib/
      cp src/{lauxlib.h,lua.h,lua.hpp,luaconf.h,luajit.h,lualib.h} $pkgdir/usr/$_arch/include/luajit-2.0/
      ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

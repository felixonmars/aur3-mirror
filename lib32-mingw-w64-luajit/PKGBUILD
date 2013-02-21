pkgname=lib32-mingw-w64-luajit
pkgver=2.0.1
pkgrel=1
pkgdesc="Just-in-time compiler and drop-in replacement for Lua 5.1 (mingw-w64, 32-bits)"
arch=(any)
url="http://luajit.org"
license=("MIT")
makedepends=(mingw-w64-gcc gcc-multilib)
depends=(mingw-w64-crt)
conflicts=(mingw-w64-lua)
options=(!strip !buildflags)
source=("$url/download/LuaJIT-${pkgver/rc/-rc}.tar.gz")
md5sums=('85e406e8829602988eb1233a82e29f1f')

_architectures="i686-w64-mingw32" # x86_64-w64-mingw32"

_optimal_make_jobs() {
  if [ -r /proc/cpuinfo ]; then
    local core_count=$(grep -Fc processor /proc/cpuinfo)
  else
    local core_count=0
  fi
  if [ $core_count -gt 1 ]; then
    echo -n $[$core_count-1]
  else
    echo -n 1
  fi
}

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "${srcdir}/LuaJIT-${pkgver}/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    
    if [ ${_arch} == "i686-w64-mingw32" ]; then
      make -j$(_optimal_make_jobs) HOST_CC="gcc -m32" CROSS=${_arch}- TARGET_SYS=Windows
    else
      make -j$(_optimal_make_jobs) HOST_CC=gcc CROSS=${_arch}- TARGET_SYS=Windows
    fi
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make install DESTDIR=$pkgdir PREFIX=/usr/${_arch}
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}

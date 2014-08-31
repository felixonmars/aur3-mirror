# submitter: perlawk
# Maintainer: perlawk

pkgname=luatrace
pkgver=git
pkgrel=1
pkgdesc="luatrace - tracing, profiling and coverage for Lua"
url="https://github.com/geoffleyland/luatrace/"
arch=('any')
license=('GPLv3')
depends=( 'lua' )
install=luatrace.install
source=("https://github.com/geoffleyland/luatrace/archive/master.zip")
 
prepare() {
  cd "${srcdir}/luatrace-master/"
  sed -i "s!LUA_SHAREDIR=!LUA_SHAREDIR=${pkgdir}/!;" makefile
}

build() {
  cd "${srcdir}/luatrace-master/"
  make
}
 
package() {
  luaver=5.1
  pth=$pkgdir/usr/share/lua/$luaver/
  pth2=$pkgdir/usr/lib/lua/$luaver/
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pth/luatrace
  mkdir -p $pth/uatrace
  mkdir -p $pth/jit
  mkdir -p $pth2/luatrace
  cd "${srcdir}/luatrace-master/"
  cp lua/luatrace.lua lua/uatrace.lua $pth/
  cp lua/luatrace/*.lua $pth/luatrace
  cp lua/uatrace/*.lua $pth/uatrace
  cp lua/jit/annotate.lua $pth/jit
  cp lua/luatrace/c_hook.so $pth2/luatrace
  cp sh/luatrace.profile $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/luatrace.profile
}
md5sums=('dee12dc8969a8b6487f6ac54aa938614')

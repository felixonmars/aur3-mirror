pkgname=fpc-i386-win32-lua52
pkgver=20130501
pkgrel=2
pkgdesc="Lua 5.2 unit for Free Pascal (i386-win32)"
url="http://lua-users.org/wiki/LuaInFreePascal"
license=("custom:LGPL")
arch=(any)
makedepends=(ppcross386 mingw-w64-binutils)
depends=(fpc-i386-win32-rtl)
options=(!strip)
source=("http://lua-users.org/files/wiki_insecure/lua52.pas")
md5sums=('e4d5bc5390363468ff2756f6c556efea')
_unittgt=i386-win32
_fpcver=`fpc -iV`

build() {
  cd ${srcdir}
  ppcross386 -Twin32 lua52.pas
}

package() {
  cd ${srcdir}
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/lua/"{}
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 i686-w64-mingw32-strip -g
}

pkgname=fpc-x86_64-win64-lua52
pkgver=20140301
pkgrel=1
pkgdesc="Lua 5.2 unit for Free Pascal (x86_64-win64)"
url="http://lua-users.org/wiki/LuaInFreePascal"
license=("custom:LGPL")
arch=(any)
makedepends=(fpc-x86_64-win64-rtl mingw-w64-binutils)
options=(!strip staticlibs !buildflags)
source=("http://lua-users.org/files/wiki_insecure/FreePascal/lua52.pas")
md5sums=('e4d5bc5390363468ff2756f6c556efea')
_unittgt=x86_64-win64
_fpcver=`fpc -iV`

build() {
  cd ${srcdir}
  fpc -Twin64 lua52.pas
}

package() {
  cd ${srcdir}
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/lua/"{}
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}

pkgname=fpc-lua52
pkgver=20140301
pkgrel=1
pkgdesc="Lua 5.2 unit for Free Pascal"
url="http://lua-users.org/wiki/LuaInFreePascal"
license=("custom:LGPL")
arch=(i686 x86_64)
depends=("lua>=5.2" fpc)
source=("http://lua-users.org/files/wiki_insecure/FreePascal/lua52.pas")
md5sums=('e4d5bc5390363468ff2756f6c556efea')
options=(staticlibs)
_unittgt=`fpc -iSP`-`fpc -iSO`
_fpcver=`fpc -iV`

prepare() {
  cd ${srcdir}
  sed -i "s,liblua52.so,liblua.so.5.2," lua52.pas
}

build() {
  cd ${srcdir}
  fpc lua52.pas
}

package() {
  cd ${srcdir}
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/lua/"{}
}

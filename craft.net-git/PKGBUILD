pkgname=craft.net-git
pkgver=546
pkgrel=1
pkgdesc="Craft.Net is a series of libraries for .NET, including a Minecraft server, client, and data manipulation utilities."
arch=(i686 x86_64)
license=("custom")
depends=(fnbt)
makedepends=(mono git)
url="https://github.com/SirCmpwn/Craft.Net"
source=("${pkgname%-*}::git+https://github.com/SirCmpwn/Craft.Net.git"
"craft-net-data.pc.in"
"craft-net-server.pc.in"
"craft-net-client.pc.in"
"Craft.Net.snk"
"use_sys_fnbt.diff")
md5sums=('SKIP'
         '5bad7b1732186bae384b0de437b3826b'
         'e16b7422ab248cd0042c415d56df3f11'
         '713e7af6f59fab69eb4b99b235de9ed5'
         '03097f5e51e2dc9d94f7147133c9197a'
         'f2ab2aa9d81045d861046e2004822ba7')

pkgver () {
  cd "$srcdir/${pkgname%-*}"
  echo $(git rev-list --count master)
}

build() {
  cd "${srcdir}/${pkgname%-*}"
  patch -Np1 -i $srcdir/use_sys_fnbt.diff
  find . -name '*.csproj' | xargs -rtl1 sed -i "s,Craft.Net.snk,$srcdir/Craft.Net.snk,g"
  xbuild Craft.Net.sln /p:Configuration=MONO
}

package() {
  cd "${srcdir}/${pkgname%-*}/"
  rm -r Craft*.Test
  for file in `find . -name 'Craft*.dll' -o -name 'Craft*.mdb'`; do
    install -Dm644 $file "$pkgdir/usr/lib/craft-net/${file#*/bin/MONO}"
  done
  find "$pkgdir/usr/lib/craft-net" -name '*.dll' | xargs -rtl1 -I {} gacutil -i {} -root "$pkgdir/usr/lib"
  install -m644 "lib/Ionic.Zip.Reduced.dll" "$pkgdir/usr/lib/craft-net/"
  #find "$pkgdir/usr/lib/craft-net" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
  for file in `find $srcdir -name '*.pc.in'`; do
    install -Dm644 $file "$pkgdir/usr/lib/pkgconfig/${file%.in}"
  done
  for file in `find "$pkgdir/usr/lib/pkgconfig" -name '*.pc'`; do
    sed -i "s,@VERSION@,$pkgver," $file
  done
  rm -r "$pkgdir/usr/lib/craft-net/Craft.Net"{,.{Client,Data,Server}}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/craft-net/LICENSE"
}

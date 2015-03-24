pkgname=nlua
pkgdesc="NLua is the bind between Lua world and the .NET world."
pkgver=1.3.2
pkgrel=1
arch=(i686 x86_64)
license=("MIT")
url="https://github.com/NLua/NLua"
source=("NLua.zip::https://github.com/NLua/NLua/archive/26031db68cadceb1325e2ba2667d18719147264a.zip"
"KeraLua.zip::https://github.com/NLua/KeraLua/archive/49e791941da3002e0f8e117b5ea2b6d515cf452b.zip"
"KopiLua.zip::https://github.com/NLua/KopiLua/archive/924a574b14540a7de2133fca462ce460be00bc24.zip"
"lua.zip::https://github.com/NLua/lua/archive/bdf615255ec73902fceae63cab1637a7c8217829.zip"
"KeraLua.dll.config")
depends=(mono)
makedepends=(dos2unix cmake)
sha1sums=('8347d880d1aa9218a1d894e41bf0d3f5586d8278'
          'e77b7971a490a56df042469dc7c2b1109b58de39'
          'e24ab6ded8a3021181ef7a7d2b64f2b959ea9a6d'
          '786d7bd842e64ad78c700094986f950a54b3ad5f'
          '8539ca6d83ce104ba50fa38b8fedba4bc16e929b')

prepare() {
  cd "${srcdir}/lua-"*
  cp -r * ../KeraLua-*/external/lua/
  cd ../KeraLua-*
  cp -r * ../NLua-*/Core/KeraLua/
  cd ../KopiLua-*
  cp -r * ../NLua-*/Core/KopiLua/
  cd ../NLua-*
  find . -type f -exec dos2unix {} \;
  ./autogen.sh --prefix=/usr
  find . -name '*.csproj' -exec sed -i 's,<DebugType>none,<DebugType>pdbonly,g' {} \;
  cd Core/KopiLua
  ./autogen.sh --prefix=/usr
}
          
build() {
	cd "${srcdir}/"NLua-*
	xbuild NLua.Net45.sln /p:Configuration=Release
	cd Applications/LuaRunner
	xbuild NLua.csproj /p:Configuration=Release
	cd ../../Core/KopiLua/Lua
	xbuild Lua.csproj /p:Configuration=Release
	cd ../Luac
	xbuild Luac.csproj /p:Configuration=Release
	cd ../../KeraLua/external/lua
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DLIB_LUA_VER='' -DLIB_SUFFIX='' ..
	make
}

package() {
	cd "${srcdir}/"NLua-*
	find . -name '*.pc' -o -name '*.40' | xargs -I {} sed -i "s,-net40,," {}
	cd Run/Release/net45
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/nlua/"{} \;
	cd ../../../Applications/LuaRunner
	install -Dm755 nlua.40 "$pkgdir/usr/bin/nlua"
	cd obj/Release
	find . -name 'NLua.exe*' -exec install -m644 {} "$pkgdir/usr/lib/nlua/" \;
	cd ../../../../Core
	install -Dm644 NLua/nlua.net40.pc "$pkgdir/usr/lib/pkgconfig/nlua.pc"
	install -m644 KeraLua/src/keralua.net40.pc "$pkgdir/usr/lib/pkgconfig/keralua.pc"
	cd KeraLua/external/lua/build/lib
	install -m644 liblua.so "$pkgdir/usr/lib/libnlua.so"
	cd ../../../../../
	cd KopiLua
	install -m644 KopiLua/kopilua.net40.pc "$pkgdir/usr/lib/pkgconfig/kopilua.pc"
	install -m755 Lua/lua.40 "$pkgdir/usr/bin/kopilua"
	install -m644 Lua/obj/Release/Lua.exe "$pkgdir/usr/lib/nlua/"
	install -m755 Luac/luac.40 "$pkgdir/usr/bin/kopiluac"
	install -m644 Luac/obj/Release/Luac.exe "$pkgdir/usr/lib/nlua/"
	install -m644 "$srcdir/KeraLua.dll.config" "$pkgdir/usr/lib/nlua/"
	find "$pkgdir/usr/lib/nlua" -name '*.dll' -exec gacutil -i {} -root "$pkgdir/usr/lib" \;
	find "$pkgdir/usr/bin" -type f -exec sed -i "s,kopilua,nlua," {} \;
	sed -i "s,kopilua,nlua," "$pkgdir/usr/lib/pkgconfig/kopilua.pc"
	sed -i "s,LuaRunner,NLua," "$pkgdir/usr/bin/nlua"
}

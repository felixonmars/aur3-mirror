pkgname=json.net
pkgdesc="Json.NET is a popular high-performance JSON framework for .NET"
pkgver=6.0.5
pkgrel=1
arch=(any)
license=("MIT")
url="http://james.newtonking.com/json"
source=("$pkgname-$pkgver.tar.gz::https://github.com/JamesNK/Newtonsoft.Json/archive/$pkgver.tar.gz"
"newtonsoft.json.pc.in")
depends=("mono>=2.11.3")
sha1sums=('e487775f1c7c4e4fb560654f14b16451b2a0070d'
          '90ab6c0a76f851cd5230443531fdc9e97a2b02dd')

build() {
	cd "${srcdir}/Newtonsoft.Json-$pkgver/Src/Newtonsoft.Json"
	xbuild Newtonsoft.Json.csproj /p:Configuration=Release
	cd bin/Release/Net45
	monodis Newtonsoft.Json.dll --output=Newtonsoft.Json.il
	ilasm /dll /key:../../../Dynamic.snk Newtonsoft.Json.il
}

package() {
	cd "${srcdir}/Newtonsoft.Json-$pkgver"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	cd Src/Newtonsoft.Json/bin/Release/Net45
	rm *.{xml,snk,il}
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/newtonsoft.json/"{} \;
	find "$pkgdir" -name '*.dll' -exec gacutil -i {} -root "$pkgdir/usr/lib" \;
	install -Dm644 "$srcdir/newtonsoft.json.pc.in" "$pkgdir/usr/lib/pkgconfig/newtonsoft.json.pc"
	sed -i "s,@VERSION@,$pkgver," "$pkgdir/usr/lib/pkgconfig/newtonsoft.json.pc"
	 # Debian uses newtonsoft-json.pc, so some software expect to find this file
	ln -s newtonsoft.json.pc "$pkgdir/usr/lib/pkgconfig/newtonsoft-json.pc"
}

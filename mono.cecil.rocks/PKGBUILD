pkgname=mono.cecil.rocks
pkgver=0.9.5
pkgrel=2
pkgdesc="Contains mostly extension methods and extra functionalities to Mono.Cecil"
arch=(any)
license=("MIT")
depends=(mono)
url="https://github.com/jbevain/cecil/wiki/Mono.Cecil.Rocks"
source=("https://github.com/jbevain/cecil/archive/$pkgver.tar.gz"
"mono.cecil.rocks.pc.in")
md5sums=('46396b1136d9050a1d622d4ddc32b507'
         '29fa4aa1b68799d2bce230430a32c2e2')
         
build() {
	cd "$srcdir/cecil-$pkgver/rocks"
	xbuild Mono.Cecil.Rocks.csproj /p:Configuration=net_4_0_Release
}

package() {
	cd "$srcdir/cecil-$pkgver/bin/net_4_0_Release"
	rm Mono.Cecil.dll{,.mdb}
	find . -name '*.dll' -o -name '*.mdb' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/mono.cecil.rocks/"{}
	find "$pkgdir/usr/lib/mono.cecil.rocks/" -name '*.dll' | xargs -rtl1 -I {} gacutil -i {} -root "$pkgdir/usr/lib"
	snkey=`sn -T "$pkgdir/usr/lib/mono.cecil.rocks/Mono.Cecil.Rocks.dll" | grep "Public Key Token:\s" | awk '{print $4}'`
	ln -s "/usr/lib/mono/gac/Mono.Cecil/$pkgver.0__$snkey/Mono.Cecil.dll" "$pkgdir/usr/lib/mono.cecil.rocks/Mono.Cecil.dll"
	install -Dm644 "$srcdir/mono.cecil.rocks.pc.in" "$pkgdir/usr/lib/pkgconfig/mono.cecil.rocks.pc"
	find "$pkgdir/usr/lib/pkgconfig" -type f -exec sed -i "s|@VERSION@|$pkgver|" {} \;
}

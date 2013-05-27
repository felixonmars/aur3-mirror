pkgname=fnbt
pkgver=0.5.0
pkgrel=1
pkgdesc="A C-sharp library for reading and writing Named Binary Tag (NBT) format files."
arch=(i686 x86_64)
license=("BSD-3" "LGPLv3")
depends=(mono)
url="https://github.com/fragmer/fNbt"
source=("https://github.com/fragmer/fNbt/archive/v$pkgver.tar.gz"
"fnbt.pc.in"
"fNbt.snk")
md5sums=('b6d8cbc5c6e3f13046c3d7e3a8ea907b'
         '98a43c2e6fad82dcfb7ed1e6131850de'
         'f8df797b7fc822877d25d35f12e626cc')

build() {
	cd "${srcdir}/fNbt-$pkgver"
	xbuild fNbt.sln
	cd "bin/Debug"
	monodis fNbt.dll --output=fNbt.il
	ilasm /dll /key:$srcdir/fNbt.snk fNbt.il
	rm fNbt.il
}

package() {
	cd "${srcdir}/fNbt-$pkgver/bin/Debug"
	find . -name '*fNbt.*' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fnbt/"{}
	find "$pkgdir/usr/lib/fnbt" -name '*.dll' | xargs -rtl1 -I {} gacutil -i {} -root "$pkgdir/usr/lib"
	find "$pkgdir/usr/lib/fnbt" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
	ln -s "/usr/lib/mono/2.0/nunit.framework.dll" "$pkgdir/usr/lib/fnbt/nunit.framework.dll"
	install -Dm644 "$srcdir/fnbt.pc.in" "$pkgdir/usr/lib/pkgconfig/fnbt.pc"
	install -Dm644 "$srcdir/fNbt-$pkgver/docs/LICENSE" "$pkgdir/usr/share/licenses/fnbt/LICENSE"
}

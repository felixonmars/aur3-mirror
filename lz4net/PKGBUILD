pkgname=lz4net
pkgdesc=".NET implementation of LZ4"
pkgver=1.0.3.93
pkgrel=1
arch=(any)
license=("BSD")
url="http://lz4net.codeplex.com"
source=("lz4net.zip::http://download-codeplex.sec.s-msft.com/Download/SourceControlFileDownload.ashx?ProjectName=lz4net&changeSetId=5b49400326eb0c6635367649f2c770111cbea768"
"lz4n.pc" "lz4s.pc" "LZ4.snk")
depends=(mono)
makedepends=(dos2unix)
sha1sums=('ed2c9b6ad0f5103c78e9b503d7b9ae9387b2aa1b'
          '045cefe76ce9230c703f32eca5523ed1bc6fdd7f'
          'a3a2794dfb42db1aae7258bbec1f8f17a0a7f049'
          '853ef74b0bad5477c48a906de3c56082dd4d4205')

prepare() {
	cd "${srcdir}"
	find . -type f -exec dos2unix {} \;
	mv LZ4.snk source/LZ4.snk
}
          
build() {
	cd "${srcdir}/source/LZ4n"
	xbuild LZ4n.csproj /p:Configuration=Release
	cd ../LZ4s
	xbuild LZ4s.csproj /p:Configuration=Release
}

package() {
	cd "${srcdir}/source/LZ4n/bin/Release"
	find . -name '*.dll*' -exec install -Dm644 {} "$pkgdir/usr/lib/lz4net/"{} \;
	cd ../../../LZ4s/bin/Release
	find . -name '*.dll*' -exec install -m644 {} "$pkgdir/usr/lib/lz4net/"{} \;
	find "$pkgdir" -name '*.dll' -exec gacutil -i {} -root "$pkgdir/usr/lib" \;
	install -Dm644 "$srcdir/lz4n.pc" "$pkgdir/usr/lib/pkgconfig/lz4n.pc"
	install -m644 "$srcdir/lz4s.pc" "$pkgdir/usr/lib/pkgconfig/"
	find "$pkgdir/usr/lib/pkgconfig" -type f -exec sed -i "s,@VERSION@,$pkgver," {} \;
}

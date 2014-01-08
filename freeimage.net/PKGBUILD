pkgname=freeimage.net
pkgdesc=".NET wrapper to the FreeImage project for graphical file format conversion."
pkgver=3.15.4
pkgrel=4
arch=(any)
license=("custom:FIPL, GPL")
options=(!emptydirs)
url="http://freeimage.sourceforge.net"
source=("http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip"
"freeimage.net.pc.in"
"FreeImageNET.dll.config")
depends=(freeimage mono)
makedepends=(dos2unix)
md5sums=('9f9a3b2c3c1b4fd24fe479e8aaee86b1'
         '95dd10d810f3d25b33b80e723acc6e17'
         'ae5321c31a5d869201f4f85fd2256548')

prepare() {
	cd "$srcdir/FreeImage"
	find . -type f -exec dos2unix {} \;
	cd Wrapper/FreeImage.NET/cs
	find . -type f -exec sed -i "s,<TreatWarningsAsErrors>true,<TreatWarningsAsErrors>false,g" {} \;
}
build() {
	cd "${srcdir}/FreeImage/Wrapper/FreeImage.NET/cs"
	xbuild FreeImage.NET.sln /p:Configuration=Release
	#cd Library/bin/Release
	#monodis FreeImage.NET.dll --output=FreeImage.NET.il
	#ilasm /dll /key:"$srcdir/FreeImage.NET.snk" FreeImage.NET.il
	#rm *.il
}

package() {
	cd "${srcdir}/FreeImage/Wrapper/FreeImage.NET/cs/Library/bin/Release"
	rm *.XML
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/freeimage.net/"{} \;
	install -m644 "$srcdir/FreeImageNET.dll.config" "$pkgdir/usr/lib/freeimage.net/"
	#find "$pkgdir" -name '*.dll' -exec gacutil -i {} -root "$pkgdir/usr/lib" \;
	install -Dm644 "$srcdir/freeimage.net.pc.in" "$pkgdir/usr/lib/pkgconfig/freeimage.net.pc"
	find "$pkgdir/usr/lib/pkgconfig" -type f -exec sed -i "s,@VERSION@,$pkgver," {} \;
	mkdir -p "$pkgdir/usr/share/licenses"
	ln -s /usr/share/licenses/freeimage "$pkgdir/usr/share/licenses/freeimage.net"
}

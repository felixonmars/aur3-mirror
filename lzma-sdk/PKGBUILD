pkgname=lzma-sdk
pkgver=9.22
pkgrel=1
pkgdesc="The LZMA SDK provides the libraries you need to develop applications that use LZMA compression."
url="http://www.7-zip.org/sdk.html"
arch=(any)
license=("public domain")
makedepends=(java-environment mono)
conflicts=(lzma)
optdepends=("java-environment: Java SDK"
"mono: .NET SDK")
source=("http://downloads.sourceforge.net/sevenzip/lzma${pkgver//./}.tar.bz2"
"SevenZip.snk"
"sevenzip.pc")
sha1sums=('fbe4d6c02202d65fae75c2db0e3cdc542ca41e6d'
          'eaa62fd2889445845c73645f188c189d2227c3df'
          'd1c5afd480d664634b0d46d3156bbe762435a2f6')
          
prepare() {
	cd "$srcdir"
	rm CS/7zip/Common/CommandLineParser.cs
	rm Java/SevenZip/Lzma{Alone,Bench}.java
}

build() {
	cd "$srcdir/CS/7zip"
	mcs /out:SevenZip.dll /keyfile:../../SevenZip.snk /t:library /debug:pdbonly /optimize \
		ICoder.cs `ls Common/*.cs` `ls Compress/LZ/*.cs` `ls Compress/LZMA/*.cs` `ls Compress/RangeCoder/*.cs`
	cd ../../Java/SevenZip
	mkdir .build
	javac -d .build *.java Compression/LZ/*.java Compression/LZMA/*.java Compression/RangeCoder/*.java
	cd .build
	jar cvf 7zip.jar SevenZip/Compression/LZ SevenZip/Compression/LZMA SevenZip/Compression/RangeCoder \
		SevenZip
}

package() {
	cd "$srcdir/CS/7zip"
	find . -name '*.dll*' -exec install -Dm644 {} "$pkgdir/usr/lib/lzma-sdk/"{} \;
	install -m644 ../../Java/SevenZip/.build/7zip.jar "$pkgdir/usr/lib/lzma-sdk/"
	install -Dm644 ../../sevenzip.pc "$pkgdir/usr/lib/pkgconfig/sevenzip.pc"
	find "$pkgdir/usr/lib/pkgconfig" -type f -exec sed -i "s|@VERSION@|${pkgver}|" {} \;
	cd "$pkgdir/usr/lib/lzma-sdk"
	gacutil -i SevenZip.dll -root "$pkgdir/usr/lib"
}

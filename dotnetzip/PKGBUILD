pkgname=dotnetzip
pkgdesc="Zip and Unzip in any .NET language"
pkgver=1.9.1.8
pkgrel=6
arch=(any)
license=("MS-PL")
url="http://dotnetzip.codeplex.com"
source=("dotnetzip.zip::http://download-codeplex.sec.s-msft.com/Download/SourceControlFileDownload.ashx?ProjectName=dotnetzip&changeSetId=81674"
"Ionic.snk"
"ionic.zlib.pc.in"
"ionic.bzip2.pc.in"
"ionic.zip.reduced.pc.in"
"ionic.zip.pc.in")
depends=(mono)
makedepends=(dos2unix)
sha1sums=('SKIP'
          'e65a567bc5ece06d4941fe2c58ea4efecf4829bf'
          'd638210dbfa5f643ea4bb0a53d90129386e66bc5'
          'd9526874bc71dd2cdedfb2574202a927c181c0f4'
          'd2bf12ac17bb75fa84cc9a0b572bc4f8c650c43f'
          'daec8fe8f732084aa8d545ddf337b4cc71e75e82')

prepare() {
	cd "${srcdir}"
	find . -type f -exec dos2unix {} \;
	sed -i "s,Properties,properties,g" "Zlib/Zlib DLL.csproj"
	cd Zip/Resources
	zip Ionic.Zip.Resources.ZippedResources.zip `ls *.cs` zippedFile.ico
}
          
build() {
	cd "${srcdir}/BZip2"
	xbuild "BZip2 DLL.csproj" /p:Configuration=Release
	cd ../Zip
	resgen2 /compile `ls Resources/*.resx`
	mv Resources/PasswordDialog.resources Ionic.Zip.Forms.PasswordDialog.resources
	mv Resources/WinFormsSelfExtractorStub.resources Ionic.Zip.WinFormsSelfExtractorStub.resources
	mv Resources/ZipContentsDialog.resources Ionic.Zip.Forms.ZipContentsDialog.resources
	gmcs /debug:pdbonly /keyfile:../Ionic.snk /optimize+ /out:Ionic.Zip.dll /resource:Ionic.Zip.Forms.PasswordDialog.resources \
		/resource:Ionic.Zip.WinFormsSelfExtractorStub.resources /resource:Ionic.Zip.Forms.ZipContentsDialog.resources \
		/resource:Resources/Ionic.Zip.Resources.ZippedResources.zip `ls *.cs` `ls ../BZip2/*.cs` `ls ../Zlib/*.cs` ../CommonSrc/CRC32.cs \
		../SolutionInfo.cs Properties/AssemblyInfo.cs /target:library /define:"TRACE;AESCRYPTO;BZIP"
	cd "../Zip Reduced"
	xbuild "Zip Reduced.csproj" /p:Configuration=Release
	cd ../Zlib
	xbuild "Zlib DLL.csproj" /p:Configuration=Release
}

package() {
	cd "${srcdir}"
	install -Dm644 License.BZip2.txt "$pkgdir/usr/share/licenses/$pkgname/License.BZip2.txt"
	install -m644 License.Combined.rtf "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 License.rtf "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 License.txt "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 License.zlib.txt "$pkgdir/usr/share/licenses/$pkgname/"
	cd BZip2/bin/Release
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/dotnetzip/"{} \;
	cd ../../../Zip
	find . -name '*.dll*' -exec install -Dm644 {} "$pkgdir/usr/lib/dotnetzip/"{} \;
	cd "../Zip Reduced/bin/Release"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/dotnetzip/"{} \;
	cd ../../../Zlib/bin/Release
	find . -type f -exec install -m644 {} "$pkgdir/usr/lib/dotnetzip/"{} \;
	find "$pkgdir" -name '*.dll' -exec gacutil -i {} -root "$pkgdir/usr/lib" \;
	install -Dm644 "$srcdir/ionic.bzip2.pc.in" "$pkgdir/usr/lib/pkgconfig/ionic.bzip2.pc"
	install -m644 "$srcdir/ionic.zlib.pc.in" "$pkgdir/usr/lib/pkgconfig/ionic.zlib.pc"
	install -m644 "$srcdir/ionic.zip.reduced.pc.in" "$pkgdir/usr/lib/pkgconfig/ionic.zip.reduced.pc"
	install -m644 "$srcdir/ionic.zip.pc.in" "$pkgdir/usr/lib/pkgconfig/ionic.zip.pc"
	find "$pkgdir/usr/lib/pkgconfig" -type f -exec sed -i "s,@VERSION@,$pkgver," {} \;
}

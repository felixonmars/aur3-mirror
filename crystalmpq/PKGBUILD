pkgname=crystalmpq
pkgdesc="Library and set of tools for reading data from MPQ (MoPaQ) files"
pkgver=20
pkgrel=1
arch=(any)
license=("MSRL")
url="https://code.google.com/p/crystalmpq"
source=("$pkgname::svn+http://crystalmpq.googlecode.com/svn/trunk"
"crystalmpq.dataformats.pc.in"
"crystalmpq.explorer.extensibility.pc.in"
"crystalmpq.pc.in"
"crystalmpq.utility.pc.in"
"crystalmpq.utility.windows.forms.pc.in"
"crystalmpq.wowdatabases.pc.in"
"crystalmpqexplorer.desktop"
"crystalmpqexplorer.sh"
"dbcviewer.desktop"
"dbcviewer.sh"
"wowmapexplorer.desktop"
"wowmapexplorer.sh"
"wowspellviewer.desktop"
"wowspellviewer.sh"
"crystalmpq.png"
"sharpziplib.diff"
)
depends=(mono)
makedepends=(subversion dos2unix)
sha1sums=('SKIP'
          '3920380ec84da656e3374c901450692c3593f325'
          '5b12a7855d42fece50da46cac98788251c4d7f49'
          'f93dc14493c4210a7514c9bccba6bc01ef6ebcf5'
          '27270b75fadad27471d8f950e449981d2c9f3377'
          '65da1b35fb2007a93218a0bd5a8a34fe3b32bba6'
          '6740623dfc48f11f59734d04d7310c7cc446f99b'
          '1723ed82b53dc41f6c83d329f30d1321647d955f'
          'c893d01ba3ed35ff69d21149b7cf6b35fecb5545'
          'b0f28ac03218a68bc338e3fcfa7a6d3fa4085e6c'
          '4c24c2750fd2f9472b2fb2676b2ebda9bfa9db3d'
          '318951871b093fbdbd46b72b70f11c05084ca586'
          '2787969904489f8c04a29627cc9a74e38e0e8436'
          'd64cb6bf8eeff32a5e72daaeca3331c5f3134db8'
          '9edb94f37f5c8b7c13bf75f9a4ef05273c406950'
          'b4ea64f25d6c4b0a37d819a1c98e2ec4a7161336'
          '1fa5d0f424850a723e62e9bc231cd49d500c68fe')

prepare() {
	cd "${srcdir}/$pkgname"
	svn up -r$pkgver
	find . -type f -exec dos2unix {} \;
	cd CrystalMpq
	sed -i "s,BlpTexture.cs,BLPTexture.cs,g" CrystalMpq.DataFormats/CrystalMpq.DataFormats.csproj
	cd CrystalMpq
	patch -p0 CrystalMpq.csproj < "$srcdir/sharpziplib.diff"
}
          
build() {
	cd "${srcdir}/$pkgname/CrystalMpq"
	xbuild CrystalMpq.sln /p:Configuration=Release
}

package() {
	cd "${srcdir}"
	for pc in `ls *.pc.in`; do
		install -Dm644 $pc "$pkgdir/usr/lib/pkgconfig/"${pc%.in}
	done
	for sh in `ls *.sh`; do
		install -Dm755 $sh "$pkgdir/usr/bin/"${sh%.sh}
	done
	for desktop in `ls *.desktop`; do
		install -Dm644 $sh "$pkgdir/usr/share/applications/"${desktop%.desktop}
	done
	cd $pkgname/CrystalMpq
	install -Dm644 License.txt "$pkgdir/usr/share/licenses/crystalmpq/License.txt"
	cd bin/Release
	rm *.xml
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/crystalmpq/"{} \;
	cd "$pkgdir/usr/lib/crystalmpq/"
	for dll in `ls *.dll | grep -v "Extensibility"`; do
		gacutil -i $dll -root "$pkgdir/usr/lib"
	done
	find "$pkgdir/usr/lib/pkgconfig" -type f -exec sed -i "s,@VERSION@,$pkgver," {} \;
}

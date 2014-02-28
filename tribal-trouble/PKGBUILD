pkgname=tribal-trouble
pkgver=2137
pkgrel=1
pkgdesc='A real-time strategy game that pits natives of tropical islands against invading Vikings. Demo version, licence key required to unlock full version features.'
arch=(i686)
url="http://tribaltrouble.com/"
license=('custom')
depends=(java-runtime)
makedepends=(p7zip)
install=tribaltrouble.install
source=(http://download.oddlabs.com/TribalTroubleSetup.sh tribaltrouble tribaltrouble.install)
md5sums=(8866d4f298284661a0aaf792b8ed2dfb SKIP SKIP)
options=('!strip')

prepare() {
	mkdir "$srcdir/$pkgname"
	cd "$srcdir/$pkgname"
	dd if="$srcdir"/TribalTroubleSetup.sh ibs=8879 skip=1 obs=1024 | gunzip | tar -x
	7z x TribalTrouble.7z
	rm TribalTrouble.7z 7zr un7zip
	rm -r jre1.5.0_04
}

package() {
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "$srcdir/$pkgname"/license.txt "$srcdir/$pkgname"/oddlabs_license.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
	mkdir "$pkgdir/opt"
	mv "$srcdir/$pkgname" "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin"
	cp "$startdir"/tribaltrouble "$pkgdir/usr/bin"
}

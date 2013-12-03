# Maintainer: catlover2 <invertedrat at symbol gmail .FULL STOPFULL STOP com>

pkgname="labelflash-index-maker"
pkgver="1.2.0"
pkgrel="4"
# This description is from "$url".
pkgdesc="A Labelflash-compliant software which opens the door to easy and convenient graphical imaging."
arch=("i686" "x86_64")
url="http://labelflash.jp/enjoy/dl_software.html"
license=("Custom")
depends=("wine")
makedepends=("unzip")
install="$pkgname".install
source=("$pkgname" "$pkgname".install "$pkgname".desktop "LIM.png"  "http://www.yamaha.co.jp/product/av/labelflash/en/lim120en.zip" "http://www.yamaha.co.jp/product/av/labelflash/en/en.html")
sha512sums=('ac4777fa35c91c983ba3accd59f54b5150b046e1cb95207d2ec5f5948bfea514f50868bdf9ea39e3db9465ef856c59e8ac2f4ba6a8e4be3d1894114b5b028c20'
            '61f25edaff7af977b9abe16d95ee75da2054b49d5195d637d5d2a330f78d7899c536b6989606693dae9d3ef4932e7bb8d3bd9cddf62b7dea0d62e8c19c058768'
            'f2a729ebd2ea3a3c8b733d2d6400589f9573c76af9b95a2928e7ea17496c546a4a3a52185585469ff2a94985ee755c0c340f4954a8e29872775776df0e4da948'
            '83e99ba624fbc919bca71470234b5ce230f9ee12d07ffae3ceff2c5ce321c6c99c3b474e6637c9adce1368f8cd728bfdb2ad0951a412b60796137685154694a0'
            'e5d58b3c280d88a0717f689e849874c20e7f533486061f4c3da922b1830c1d21087fd0c957612ab1a89a35b09fc791fac81153b114799f47676e69eab9006f58'
            'eae768a75d387a57d6a2834fa449b88626235596e6ffd8aaf3427e36b342a1d133a8cac80fd1bc8ec65631d3a77843424107ab499217395f48c7ac25ab105809')

package() {
	install	-D	-m755	"$srcdir/$pkgname"			"$pkgdir/usr/bin/$pkgname"
	install	-D	-m644	"en.html"				"$pkgdir/usr/share/licenses/$pkgname/en.html"
	install -D 	-m644	"$srcdir/$pkgname".desktop		"$pkgdir/usr/share/applications/$pkgname".desktop
	install	-d	-m755	"$pkgdir/usr/share/$pkgname/image"
	cp	-rL		"$srcdir/"{LIM.{EXE,chm,png},lim.ini}	"$pkgdir/usr/share/$pkgname"
	cp	-r		"$srcdir/image/"*			"$pkgdir/usr/share/$pkgname/image"

	find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 "{}" \;
	find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 "{}" \;
}

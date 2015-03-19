pkgname=pabcnetc
pkgver=2.2.0.859
pkgrel=1
pkgdesc="Pascal ABC command-line compiler"
arch=(any)
license=('custom')
url="http://pascalabc.net/"
depends=('mono')
source=("http://pascalabc.net/downloads/PABCNETC.zip"
	"pabcnetc")
md5sums=('e98cba13f2aa4d4010f6efb2156b6212'
	'31e0138b2fe81da812bfff28396f2547')

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/pabcnetc" "${pkgdir}/usr/bin/pabcnetc"

    rm "${srcdir}/pabcnetc"

    find "./" -type f -exec install -D -m644 {,${pkgdir}/opt/PascalABC_Compiler/}{} \;
}


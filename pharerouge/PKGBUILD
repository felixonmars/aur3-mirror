pkgname=pharerouge
pkgver=20060507.15006
pkgrel=4
pkgdesc="Java Hotline client derived from RedLight"
arch=(any)
url="http://pharerouge.sourceforge.net"
license=("GPL")
depends=(java-runtime)
source=("http://downloads.sourceforge.net/pharerouge/pharerouge-${pkgver//./-}-bin.tar.gz"
"pharerouge.desktop"
"pharerouge.png"
"pharerouge")
md5sums=('cbcfc06309cb84639c25bdb581c0d0c7'
         'b6300495146c4f639183f6167be06e70'
         '511bcb6e2fad264a979c4beb8a093c4d'
         '2bbfd2678f2dda605914ab02df0d3fc2')

package() {
  cd "$srcdir/PhareRouge"
	install -Dm755 "$srcdir/pharerouge" "$pkgdir/usr/bin/pharerouge"
	install -Dm644 "pharerouge.jar" "$pkgdir/usr/lib/pharerouge/pharerouge.jar"
	install -Dm644 "${srcdir}/pharerouge.desktop" "${pkgdir}/usr/share/applications/pharerouge.desktop"
  install -Dm644 "${srcdir}/pharerouge.png" "${pkgdir}/usr/share/icons/pharerouge.png"
}

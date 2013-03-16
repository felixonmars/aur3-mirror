pkgname=pharerouge-gl
pkgver=20111209
pkgrel=1
pkgdesc="GLoarbLine derivative of the PhareRouge Hotline client"
arch=(any)
url="http://www.lorbac.net"
license=("GPL")
depends=(java-runtime)
source=("http://lorbac.net/GLoarbLine_PhareRouge.jar"
"pharerouge-gl.desktop"
"pharerouge-gl.png"
"pharerouge-gl")
noextract=("GLoarbLine_PhareRouge.jar")
md5sums=('9ad05b45c097099bc6052d7be6f9fd61'
         'aaa4c258678da1b76879b89467845deb'
         '511bcb6e2fad264a979c4beb8a093c4d'
         'f174ea9c29f2d0d1b269ca5d574900b5')

package() {
  mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/pharerouge-gl"
	install -m 755 "$srcdir/pharerouge-gl" "$pkgdir/usr/bin/pharerouge-gl"
	install -m 644 "$srcdir/GLoarbLine_PhareRouge.jar" "$pkgdir/usr/share/pharerouge-gl/GLoarbLine_PhareRouge.jar"
	install -Dm644 "${srcdir}/pharerouge-gl.desktop" "${pkgdir}/usr/share/applications/pharerouge-gl.desktop"
  install -Dm644 "${srcdir}/pharerouge-gl.png" "${pkgdir}/usr/share/icons/pharerouge-gl.png"
}

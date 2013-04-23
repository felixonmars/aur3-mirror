# Maintainer: Tony Olagbaiye <frony0@gmail.com>
pkgname=mc4d
pkgver=4.0.185
pkgrel=1
pkgdesc="A fully functional four-dimensional analog of Rubik's cube"
arch=('any')
url="http://www.superliminal.com/cube/cube.htm"
license=('unknown')
depends=('java-runtime')
source=(http://magiccube4d.googlecode.com/files/$pkgname-$pkgver.jar mc4d.sh)
noextract=($pkgname-$pkgver.jar)
md5sums=('3fcf44e7ef6baf041ced68f895f9eb11'
         '61fdb83aa09b0f6cfafb763181f668e4')

package() {
	install -v -D $pkgname-$pkgver.jar "$pkgdir/usr/share/mc4d/mc4d.jar"
	install -v -D mc4d.sh "$pkgdir/usr/bin/mc4d"
}

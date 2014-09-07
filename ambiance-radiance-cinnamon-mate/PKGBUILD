# Maintainer: Thermionix <thermionix@gmail.com>

pkgname='ambiance-radiance-cinnamon-mate'
pkgver='14.04'
pkgrel=1
pkgdesc="Ambiance & Radiance themes for Cinnamon and MATE"
arch=('any')
license=('GPL2')
url="http://ravefinity.blogspot.com/"
depends=('gtk-engine-murrine' 'gtk-engine-unico')
source=('https://docs.google.com/uc?id=0B7iDWdwgu9QAa0pEcmVaSHMxZjg&export=download')
md5sums=('4057686bc6ca25eac9a189334ad8d677')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cp -r "$srcdir/Ambiance-CinnaMATE" "$pkgdir/usr/share/themes"
	cp -r "$srcdir/Radiance-CinnaMATE" "$pkgdir/usr/share/themes"
}

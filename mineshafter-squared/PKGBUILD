# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco[at]gmail[dot]com>

pkgname=mineshafter-squared
pkgver=4.0.0
pkgrel=2
pkgdesc="Mineshafter Squared is an authentication and texture proxy for Minecraft."
arch=(any)
license=('unknown')
url="http://www.mineshaftersquared.com/"
depends=('minecraft')
provides=('minecraft-squared')
source=('mineshafter-squared'
        'MineshafterSquared.jar'
        'mineshafter.desktop'
        'mineshafter-squared.png')
md5sums=('563b27653308d83a277ce6bd960f0043'
         '4928093ca01afa175deaedf4a73c73f2'
         '63a91251a28d3eda4710f97c86f32287'
         'c1adab908fdaed8fc94a0d917eb048e9')

build() {
	cd "$srcdir" || return 1

	mkdir -p $pkgdir/usr/bin
	cp mineshafter-squared $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/minecraft
	cp MineshafterSquared.jar $pkgdir/usr/share/minecraft

	# Desktop launcher with icon
	install -Dm644 $srcdir/mineshafter.desktop $pkgdir/usr/share/applications/mineshafter.desktop
	install -Dm644 $srcdir/mineshafter-squared.png     $pkgdir/usr/share/pixmaps/mineshafter-squared.png
}

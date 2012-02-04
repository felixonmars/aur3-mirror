# Maintainer: Falcata aka Zauber Exonar <zauberexonar at gmail>

pkgname=omvviewerlight
pkgver=0_48_0_6
pkgrel=1
pkgdesc="A lightweight text client for Second Life and OpenSimulator"
arch=('i686' 'x86_64')
url=http://omvviewer-light.byteme.org.uk/
license=('GPL3')
depends=('mono' 'gtk-sharp-2')
makedepends=('unzip')
source=(http://omvviewer-light.byteme.org.uk/downloads/omvviewerlight_$pkgver.zip omvviewerlight.sh)
md5sums=('736564bd149accff08f6eeb95ef28b3e'
         '8bfba9e5a018dd72c6025a08c0b58665')

build() {
	mkdir "$pkgdir"/opt/
	mkdir "$pkgdir"/opt/$pkgname/
	cp -R "$srcdir"/"$pkgname"_"$pkgver"/* \
		"$pkgdir"/opt/$pkgname/ || return 1

	mkdir "$pkgdir"/usr/ "$pkgdir"/usr/bin/
	cp "$srcdir"/omvviewerlight.sh "$pkgdir"/usr/bin/omvviewerlight || return 1
	chmod -R 755 "$pkgdir"/*
}

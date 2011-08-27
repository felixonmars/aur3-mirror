# Maintainer: John Edisson Ortiz <laguaza at gmail dot com>

pkgname=firefox-nightly-es
pkgdesc='Mozilla Firefox Espanol, Nightly Build'
url='http://www.mozilla.org/projects/firefox'
pkgver=4.0rc1
pkgrel=20110309
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
conflicts=('firefox-nightly')

source=(ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-${CARCH}/es-ES/firefox-${pkgver}.tar.bz2
	firefox-nightly-es.desktop firefox-nightly-es-safe.desktop)

sha512sums=('84591d5a34fdac44c872af1b7315b0bba86b068368d142cc3297d01aeb6e78449912a9bd06e9754d1d94037ce4b30182ba275686df9b1e87399bd2e9c64315ed'
            '7728b77d35857c5c2b42b87f652592611025c7faf49e9a61108bd48d60e632aecfa6502fcc51150180d2279e077e0549d6746f87d81badfc4f5674271131c3de'
            '939edf03ae1290ecb77af2e67d0f798acc01c9c5dd7da0309f846ed4b849e3cb39b5ce1270d9bf00ab4440b85a971cb291ca06c085a69fae8b93357791440484')

depends=('desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')

[[ "$CARCH" == "x86_64" ]] && md512sums[0]="c6cd402eabe65419304c63caa977ce5858f96b8c0d32a6d2790dc1b813d2a5a972162e5fdffcd09b741ac713752fad0130853ead7d477c647ec8568324deca1c"

build() {
	cd $srcdir
#	uncomment this line to remove them if you want
#	rm -rf $_pkgname/{extensions,plugins,searchplugins}
	
	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/$pkgname-$pkgver

	ln -s /opt/$pkgname-$pkgver/firefox $pkgdir/usr/bin/$pkgname
	install -m644 $srcdir/{$pkgname.desktop,$pkgname-safe.desktop} $pkgdir/usr/share/applications/
#	install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png
}

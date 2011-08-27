# Maintainer: John Edisson Ortiz <laguaza at gmail dot com>

pkgname=firefox4-rc1-es
pkgdesc='Mozilla Firefox Espanol, RC1'
url='http://www.mozilla.org/projects/firefox'
pkgver=4.0rc1
pkgrel=201103091
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
conflicts=('firefox4')

source=(ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-${CARCH}/es-ES/firefox-${pkgver}.tar.bz2
	firefox4-rc1-es.desktop firefox4-rc1-es-safe.desktop)

sha512sums=('84591d5a34fdac44c872af1b7315b0bba86b068368d142cc3297d01aeb6e78449912a9bd06e9754d1d94037ce4b30182ba275686df9b1e87399bd2e9c64315ed'
            'a737e5d8031aaa3d87ed158292a1014901408433d76e064eaaa87fc2361093dd8d764f128c87dcfaab2f13ea7f098cc43f6b87512e13e3fb1a84e7a5a88869ac'
            '63153087dce8f55d3ae85cb34c3673cb3fe70aa8af6d04e740f26467d84514a5cb39c6f5ed15ffae96f23496ea9035127b91cc2d03a080fdbfe40c183eefa198')

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

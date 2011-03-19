# Maintainer: John Edisson Ortiz <laguaza at gmail dot com>

pkgname=firefox4-rc2-es
pkgdesc='Mozilla Firefox Espanol, RC1'
url='http://www.mozilla.org/projects/firefox'
pkgver=4.0rc2
pkgrel=201103191
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
conflicts=('firefox4' 'firefox-nightly-es')

source=(ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-${CARCH}/es-ES/firefox-${pkgver}.tar.bz2
	firefox4-rc1-es.desktop firefox4-rc1-es-safe.desktop)

sha512sums=('f375d56dc1b60c6b1d050c65213fdf0e4b1de3b5f18926bb839e891113a50c1c96c4ebe39911167fb893df0faab62204eb8ee173a3cfc8123163ae45458b1734'
            'a737e5d8031aaa3d87ed158292a1014901408433d76e064eaaa87fc2361093dd8d764f128c87dcfaab2f13ea7f098cc43f6b87512e13e3fb1a84e7a5a88869ac'
            '63153087dce8f55d3ae85cb34c3673cb3fe70aa8af6d04e740f26467d84514a5cb39c6f5ed15ffae96f23496ea9035127b91cc2d03a080fdbfe40c183eefa198')

depends=('desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')

[[ "$CARCH" == "x86_64" ]] && sha512sums[0]="3b23607a9f4047b1bc15bb09ed789e0db27d6882b2b18ff24202dbb38b7c39342397768d434e24aa418cef9ac2339847a52d9c832e592bbf74d91fe86c61391b"

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

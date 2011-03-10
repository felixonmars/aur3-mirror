# Maintainer: Diablo150 aka Florian Joncour <Diablo150 ar djl-linux.org>
# Based on firefox4-rc1-es by John Edisson Ortiz <laguaza at gmail dot com>

pkgname=firefox4-rc1-fr
pkgdesc='Mozilla Firefox rc1 en français'
url='http://www.mozilla.org/projects/firefox'
pkgver=4.0rc1
pkgrel=20110301
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
conflicts=('firefox4')

source=(ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-${CARCH}/fr/firefox-${pkgver}.tar.bz2
	firefox4-rc1-fr.desktop firefox4-rc1-fr-safe.desktop)

md5sums=('14e13075f4eb677a41e551ded09f1f03'
            '90319bbc2d16d4e08c429326d658f9c0'
            '60acebd3cc6efb444dfecbae67f3e690')

depends=('desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')

[[ "$CARCH" == "x86_64" ]] && md5sums[0]='af4e61e690be3db68756f4ec5f0c307a'

build() {
	cd $srcdir
#	uncomment this line to remove them if you want
#	rm -rf $_pkgname/{extensions,plugins,searchplugins}

	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/$pkgname-$pkgver

	ln -s /opt/$pkgname-$pkgver/firefox $pkgdir/usr/bin/$pkgname
	install -m644 $srcdir/{firefox4-rc1-fr.desktop,firefox4-rc1-fr-safe.desktop} $pkgdir/usr/share/applications/
#	install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png
}

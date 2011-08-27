# Contributor: Assaf Sapir <meijin007 AT gmail>

pkgname=firefox-beta-bin-he
pkgver=4.0rc1
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, beta build - binaries - Hebrew'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
depends=('dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("http://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-`uname -m`/he/firefox-${pkgver}.tar.bz2"
        "$pkgname.desktop" "$pkgname-safe.desktop")
md5sums=('8676e666831150d2e01bc042f7feec21'
         'f04698ce400b81093443b603e495cf28'
         '6c5eb07e26a70eabdbfcb4960cc794ae')
 [[ "$CARCH" == "i686" ]] && md5sums[0]="219286ec706c48c04e5dd45b6c6c11f9"

build() {
	cd $srcdir
#	uncomment this line to remove them if you want
#	rm -rf $_pkgname/{extensions,plugins,searchplugins}
	
	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/$pkgname-$pkgver

	ln -s /opt/$pkgname-$pkgver/firefox $pkgdir/usr/bin/$pkgname
	install -m644 $srcdir/{$pkgname.desktop,$pkgname-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png
}

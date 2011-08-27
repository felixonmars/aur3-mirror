# Contributor: bal <b.vajdics(at)gmail(dot)com>

pkgname=firefox-beta-bin-hu
pkgver=4.0rc2
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, beta build - binaries - Hungarian'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
depends=('dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/hu/firefox-${pkgver}.tar.bz2"
        "$pkgname.desktop" "$pkgname-safe.desktop")
md5sums=('f6fae7102d8907766ef3b1238d07028a'
         'aa1a259df59e20629881c24a87e466ec'
         'b77e41e2f20e425cf551553f1499e017')


[[ "$CARCH" == "i686" ]] && md5sums[0]="19bf375fd28e9b00a125c243a4e5fbbf"

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

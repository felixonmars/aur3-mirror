# Contributor: aboutall.cz <aboutall.cz(at)gmail(dot)com>

pkgname=firefox-bin
pkgver=4.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, beta build - binaries.'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
#provides=("firefox=$pkgver")
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/en-US/firefox-${pkgver}.tar.bz2"
        "$pkgname.desktop" "$pkgname-safe.desktop")
md5sums=('b8c24a57a8c3531284aff77f6eb1ba2f'
         '5af35d8ae7a35a4ba17e9bb47543a942'
         '34337e6d91e1b21d062c70f6ae0e3127')
[[ "$CARCH" == "i686" ]] && md5sums[0]="0780e44f18c3b30a40e5ac8e110b77ff" && sha1sums[0]="a5ee9cc47713671a0b70b4a2ad11c49937175ee0"

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

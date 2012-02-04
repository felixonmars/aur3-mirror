# Contributor: rancid0 <irozga(at)yahoo(dot)es>

pkgname=firefox-rc-bin-ca
pkgver=4.0rc2
pkgrel=1
pkgdesc='Navegador web Mozilla Firefox'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
#provides=("firefox=$pkgver")
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/ca/firefox-${pkgver}.tar.bz2"
        "$pkgname.desktop" "$pkgname-safe.desktop")

sha512sums=('3b2560ab0c470193d14d102b22dcefcfa9c731159754c14d8ba02b34124459e0a6db4795584000962292dc13689d0cf035999311407ea59d018ffb00ba47b7c3'
            '1e308c0d2a38d734057cc5cf8a139644b6b7d80ca62dc9fb35d2d258e5a58225814e72457963b8e6e05adc1ac59d8d6bd8f0525d715d0ff385771c91d886d094'
            '3e7dfa4f10a7c74b5fc47955eedcbd934d471ba0b54c7293437e177d3cf7c84590c67fe9c261d8ed7650176608c17971777a839cf732bf45aef989af39ad85a7')

[[ "$CARCH" == "i686" ]] && sha512sums[0]="5d9f434246a776d93b463a1b573bd08193e0aa3dbe51c878022ade3f1db6c00ff6948d89aa58fd3c820c76874f4446d760a135aad12af2eafebc82450578ccd6"

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

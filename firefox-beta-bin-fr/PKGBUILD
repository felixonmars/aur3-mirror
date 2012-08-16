# Contributor: machmalabala <machmalabala(at)gmail(dot)com>

pkgname=firefox-beta-bin-fr
pkgver=15.0b4
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, beta build - binaries - french.'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
depends=('dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/fr/firefox-${pkgver}.tar.bz2"
        "$pkgname.desktop" "$pkgname-safe.desktop")
sha1sums=('fec97963f3a8f16aa7d57f4c9b32f6ce825ef896'
          'a93c7f75b2325b499170228f58aaa0d9e235f7a8'
          '512319635dca399c90c947e3293607bfb515ac4f')

[[ "$CARCH" == "i686" ]] &&
  sha1sums[0]="681af19647cf74d5adb2ec5790b514c452937a1c"

build() {
	cd $srcdir
	
	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/$pkgname-$pkgver

	ln -s /opt/$pkgname-$pkgver/firefox $pkgdir/usr/bin/$pkgname
	install -m644 $srcdir/{$pkgname.desktop,$pkgname-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png
}

# Contributor: ferda

pkgname=firefox-esr-bin-de
pkgver=10.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, extended support release - binary - german'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
depends=('dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-${CARCH}/de/firefox-${pkgver}esr.tar.bz2"
        "$pkgname.desktop" "$pkgname-safe.desktop")

sha1sums=('d02443c3695c48661f26849004784cfe7f282025'
          '44139be742918da463f749ea338767927d17a96c'
          'a36ca698ac0c0ed00bd5030885d61fd8c0a9b2da')

[[ "$CARCH" == "i686" ]] &&
  sha1sums[0]="73d3ab678165c025c2c750a50f1951a0928a22fd"

build() {
	cd $srcdir
	
	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/$pkgname-$pkgver

	ln -s /opt/$pkgname-$pkgver/firefox $pkgdir/usr/bin/$pkgname
	install -m644 $srcdir/{$pkgname.desktop,$pkgname-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png
}

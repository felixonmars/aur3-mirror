# Maintainer: Ricky Thomson <punkrockunix@gmail.com>
# Contributor: tobiasquinn <tobias@tobiasquinn.com>

pkgname=firefox-beta-bin-gb
pkgver=8.0b3
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org, beta build - binaries. UK English'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/en-GB/firefox-${pkgver}.tar.bz2"
        "$pkgname.desktop" "$pkgname-safe.desktop")

md5sums=('2d08e69eea8ac24ff842855ad5d37435'
         '6876f38b1e4c0dfba84ff7a2414f86cc'
         'c56affcb6782f1ef8a40c7a01c74206a')

[[ "$CARCH" == "i686" ]] && md5sums[0]="69f106f0bf87e5a2b6d37fb5fc7d42b8"
build() {
	cd $srcdir
	
	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/$pkgname-$pkgver

	ln -s /opt/$pkgname-$pkgver/firefox $pkgdir/usr/bin/$pkgname
	install -m644 $srcdir/{$pkgname.desktop,$pkgname-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png
}


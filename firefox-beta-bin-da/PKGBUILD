pkgname=firefox-beta-bin-da
pkgver=4.0b11
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, binary beta build - Danish"
url="http://www.mozilla.com/firefox/beta/"
arch=('i686' 'x86_64')
depends=('dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
provides=("firefox=${pkgver}")
conflicts=('firefox-beta' 'firefox-beta-bin')
license=('MPL' 'GPL' 'LGPL')
source=("ftp://mirrors.dotsrc.org/mozilla-releases/firefox/releases/${pkgver}/linux-i686/da/firefox-${pkgver}.tar.bz2"
        'firefox-beta.desktop'
        'firefox-beta-safe.desktop')
md5sums=('f5c58e6a1b235efab28ebc624bdfd990'
         'f71ead10364376564751a4e4820db4b9'
         '13be616d26af8bae4b57cc50f5d9d08a')
[ "$CARCH" = "x86_64" ] && source[0]="ftp://mirrors.dotsrc.org/mozilla-releases/firefox/releases/${pkgver}/linux-x86_64/da/firefox-${pkgver}.tar.bz2" && md5sums[0]='581c3c1cc63467fd62407e4daefc876d'

build() {
	cd $srcdir
	mkdir -pv $pkgdir/usr/{bin,lib,share/{applications,pixmaps}}
	cp -Rv firefox $pkgdir/usr/lib/firefox-$pkgver
	ln -sv /usr/lib/firefox-$pkgver/firefox $pkgdir/usr/bin/firefox-beta
	install -m644 -v $srcdir/firefox-beta{,-safe}.desktop $pkgdir/usr/share/applications/
	install -m644 -v $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox-beta.png
}

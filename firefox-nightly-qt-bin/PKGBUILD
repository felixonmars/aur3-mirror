pkgname=firefox-nightly-qt-bin
_ffversion=1320157989
_ffrelversion=10.0a1
pkgver=${_ffrelversion}
pkgrel=3
pkgdesc='Standalone web browser from mozilla.org, nightly build qt - binaries.'
url='http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-linuxqt/'
arch=('i686')
depends=('qt' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
source=("$pkgname.desktop" "$pkgname-safe.desktop" )
md5sums=('00cf85cfcbda1a413da84493bc69cc7e'
         'e16281ac3e15f5b2f54444585cb49735')

build() {
	cd $srcdir
	wget -c "http://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/mozilla-central-linuxqt/${_ffversion}/firefox-${_ffrelversion}.en-US.linux-i686.tar.bz2"
	
	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	tar xfvj firefox-${_ffrelversion}.en-US.linux-i686.tar.bz2
	cp -r firefox $pkgdir/opt/$pkgname-$pkgver

	ln -s /opt/$pkgname-$pkgver/firefox $pkgdir/usr/bin/$pkgname
	install -m644 $srcdir/{$pkgname.desktop,$pkgname-safe.desktop} $pkgdir/usr/share/applications/
	#install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png
}
 

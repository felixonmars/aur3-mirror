# Maintainer: Ermenegildo Fiorito (fyskij) <fiorito.g @ gmail.com>

arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

pkgname=firefox-nightly-tm
pkgdesc='Standalone web browser from mozilla.org, nightly build, latest TraceMonkey'
url='http://nightly.mozilla.org/js-preview.html'
pkgver=8.0a1
pkgrel=1
conflicts=('firefox-nightly')
source=( 'firefox-nightly-tm.desktop' 'firefox-nightly-tm-safe.desktop' )
md5sums=( '940233ba24a2de784ea6c610872f01e4' '488e66c72fb678d2b99a22fe87bc5974' )
sha1sums=('6880230bc487bd65c5da43c19498f4520793e27b' '7faa96301d1c3d7772da859b96b3420cb0f34bb3')

depends=( 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info' )
makedepends=('wget')

build() {
	cd ${srcdir}

	FX_SRC="firefox-${pkgver}.en-US.linux-${CARCH}.tar.bz2"
	FX_SRC_URI="http://ftp.mozilla.org/pub/firefox/nightly/latest-tracemonkey/${FX_SRC}"

	msg "Downloading..."
	wget ${FX_SRC_URI} || return 1
	msg "Extracting..."
	bsdtar -x -f ${FX_SRC} || return 1
	msg "Packaging..."

#	uncomment this line to remove them if you want
#	rm -rf firefox/{extensions,plugins,searchplugins} || return 1

	mkdir -p ${pkgdir}/{usr/{bin,share/{applications,pixmaps}},opt} || return 1
	cp -R firefox ${pkgdir}/opt/firefox-${pkgver} || return 1

	ln -s /opt/firefox-${pkgver}/firefox ${pkgdir}/usr/bin/firefox-nightly || return 1
	install -m644 ${srcdir}/{firefox-nightly-tm.desktop,firefox-nightly-tm-safe.desktop} ${pkgdir}/usr/share/applications/ || return 1
	install -m644 ${srcdir}/firefox/icons/mozicon128.png ${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png || return 1
}

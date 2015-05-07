# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=firefox-beta-bin-ru
_pkgreal=firefox-beta-bin
_pkgnome=firefox-beta
pkgver=38.0esr
pkgrel=1
_lang=ru
_srcurl=ftp://ftp.mozilla.org/pub/firefox/candidates
pkgdesc='Standalone web browser from mozilla.org! Latest beta with Russian language'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
depends=('dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
provides=('firefox-38.0esr')

_source_x86=(${_srcurl}/${pkgver}-candidates/build1/linux-i686/${_lang}/firefox-${pkgver}.tar.bz2
	     ${_pkgnome}.desktop
	     ${_pkgnome}-safe.desktop)
_md5sums_x86=('cb529db329751648987dd5421df2d7d3'
	      '8698d9cd40cdd170349db1315f0f1304'
	      '052799fafa03136743b439fafb17d751')

_source_x86_64=(${_srcurl}/${pkgver}-candidates/build1/linux-x86_64/${_lang}/firefox-${pkgver}.tar.bz2
	        ${_pkgnome}.desktop
	        ${_pkgnome}-safe.desktop)
_md5sums_x86_64=('41eab0066164404ec338f41194b4da4d'
	         '8698d9cd40cdd170349db1315f0f1304'
	         '052799fafa03136743b439fafb17d751')

source=(${_source_x86[@]})
md5sums=(${_md5sums_x86[@]})

[ "$CARCH" = "x86_64" ] && source=(${_source_x86_64[@]}) && md5sums=(${_md5sums_x86_64[@]})

package() {
	cd $srcdir

	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/${_pkgreal}-$pkgver

	ln -s /opt/${_pkgreal}-$pkgver/firefox $pkgdir/usr/bin/${_pkgreal}
	install -m644 $srcdir/{$_pkgnome.desktop,$_pkgnome-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${_pkgreal}-icon.png
}

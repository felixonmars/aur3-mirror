# Maintainer: Gutu Andrei <lucentcode@gmail.com>

pkgname=firefox-5-bin
_pkgreal=firefox-5-bin
_pkgnome=firefox-5
pkgver=5.0
pkgrel=1
_lang=en-US
_srcurl=ftp://ftp.mozilla.org/pub/firefox/releases
pkgdesc='Standalone web browser from mozilla.org! Firefox 5 binary package from official FTP'
url='http://www.mozilla.org/projects/firefox'
arch=('i686' 'x86_64')
depends=('dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
license=('MPL' 'GPL' 'LGPL')
provides=('firefox-bin')

_source_x86=(${_srcurl}/${pkgver}/linux-i686/${_lang}/firefox-${pkgver}.tar.bz2
	     ${_pkgnome}.desktop
	     ${_pkgnome}-safe.desktop)

_md5sums_x86=('c189785b42aef80f3375fce9471eb276'
              'c290dc376b66f6e7f591c2b6a93d2497'
              '4f12ad6f53922874f81376f75f100eb0')





_source_x86_64=(${_srcurl}/${pkgver}/linux-x86_64/${_lang}/firefox-${pkgver}.tar.bz2
	        ${_pkgnome}.desktop
	        ${_pkgnome}-safe.desktop)

_md5sums_x86_64=('c189785b42aef80f3375fce9471eb276'
                 'c290dc376b66f6e7f591c2b6a93d2497'
                 '4f12ad6f53922874f81376f75f100eb0')





source=(${_source_x86[@]})
md5sums=(${_md5sums_x86[@]})

[ "$CARCH" = "x86_64" ] && source=(${_source_x86_64[@]}) && md5sums=(${_md5sums_x86_64[@]})

build() {
	cd $srcdir

	mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox $pkgdir/opt/${_pkgreal}-$pkgver

	ln -s /opt/${_pkgreal}-$pkgver/firefox $pkgdir/usr/bin/${_pkgreal}
	install -m644 $srcdir/{$_pkgnome.desktop,$_pkgnome-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${_pkgreal}-icon.png
}

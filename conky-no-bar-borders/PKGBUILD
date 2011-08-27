# $Id: PKGBUILD 102220 2010-12-06 21:41:49Z bisson $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor:  Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-no-bar-borders
_pkgname=conky
pkgver=1.8.1
pkgrel=2
pkgdesc='An advanced, highly configurable system monitor for X based on torsmo. Enables nvidia, audatious, weather and lua support. Also adds the patch to remove borders from bars as per http://sourceforge.net/tracker/?func=detail&aid=3004716&group_id=143975&atid=757310'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net/'
license=('custom')
replaces=('torsmo')
conflicts=('conky')
provides=('conky')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'toluapp' 'audacious' 'lua' 'cairo' 'libxnvctrl')
makedepends=('pkg-config')
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${_pkgver}/${_pkgname}-${pkgver}.tar.gz"
	'draw_bar_borders.patch'
        'current-power.patch')

sha1sums=('06bbe9b7eed8603fa7a971b27c5c61f38424ac6f'
	  '241e069098daed52f8012e2685c3340259141229'
          '2eeef0cc5a0b612826b2a7f0b43b7a3b7e10bf0b')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	
	patch -p1 < ../draw_bar_borders.patch
	patch -p1 < ../current-power.patch # See FS#21984

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-rss \
		--enable-imlib2 \
		--enable-wlan \
		--enable-audacious=yes \
		--enable-curl \
		--enable-weather-xoap \
		--enable-lua \
		--enable-lua-imlib2 \
		--enable-lua-cairo \
		--enable-nvidia
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

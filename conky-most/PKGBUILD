# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=conky-most
_pkgname=conky
pkgver=1.9.0
pkgrel=2
pkgdesc='Lightweight system monitor for X, pretty much everything enabled'
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('tolua++')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'lua51' 'cairo')
provides=('conky=1.9.0')
conflicts=('conky')
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('a8d26d002370c9b877ae77ad3a3bbd2566b38e5d')

replaces=('torsmo')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" LUA_LIBS="-llua5.1" LUA_CFLAGS="-I/usr/include/lua5.1" \
        ./configure --enable-dependency-tracking --enable-audacious=yes --enable-ibm --enable-xxms2 --enable-curl --enable-eve --enable-weather-xoap --enable-imlib2 --enable-lua-imlib2 --enable-lua --enable-lua-cairo --enable-wlan --enable-rss --prefix=/usr --sysconfdir=/etc

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}

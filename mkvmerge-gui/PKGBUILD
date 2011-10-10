# Maintainer: Army <uli armbruster google>

pkgname=mkvmerge-gui
_pkgname=mkvtoolnix
pkgver=5.0.1
pkgrel=1
pkgdesc="user interface for mkvmerge (mmg) from mkvtoolnix"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.bunkus.org/videotools/mkvtoolnix/index.html"
depends=('mkvtoolnix' 'wxgtk' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('boost' 'ruby')
install=$pkgname.install
source=("http://www.bunkus.org/videotools/${_pkgname}/sources/${_pkgname}-${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# Disable automagic curl dep used for online update checking
	sed -i -e '/curl/d' configure.in
	export CURL_CFLAGS="" CURL_LIBS=""
	
	export CFLAGS="${CFLAGS} -DBOOST_FILESYSTEM_VERSION=2"
	export CXXFLAGS="${CXXFLAGS} -DBOOST_FILESYSTEM_VERSION=2"

	autoreconf
	
	./configure --prefix=/usr --with-boost-libdir=/usr/lib --enable-gui
	./drake apps:mmg
}

package () {
	# install binary file
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/src/mmg/mmg" "${pkgdir}/usr/bin/mmg"
	# install all manpages
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/doc/man/mmg.1" "${pkgdir}/usr/share/man/man1/mmg.1"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/doc/man/ja/mmg.1" "${pkgdir}/usr/share/man/ja/man1/mmg.1"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/doc/man/nl/mmg.1" "${pkgdir}/usr/share/man/nl/man1/mmg.1"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/doc/man/zh_CN/mmg.1" "${pkgdir}/usr/share/man/zh_CN/man1/mmg.1"
	# install desktop file
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/share/desktop/mkvmergeGUI.desktop" "${pkgdir}/usr/share/applications/mkvmergeGUI.desktop"
	# install icons
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/share/icons/32x32/mkvmergeGUI.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/mkvmergeGUI.png"
	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/share/icons/64x64/mkvmergeGUI.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mkvmergeGUI.png"
}
md5sums=('93fbbe946de6013eca699c0c2a93a4e9')

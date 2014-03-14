# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=sted2
pkgver=20021104
pkgrel=1
pkgdesc="A high-performance MIDI sequence editor / Music composer system"
arch=('i686' 'x86_64')
url="http://sted2.sourceforge.net/"
license=('custom')
depends=('desktop-file-utils' 'libx11' 'ncurses')
install=sted2.install
source=("http://sted2.sourceforge.net/pub/sted2-${pkgver}.tar.gz" "sted2-20021104-patchset-20080126.tar.bz2" sted2.desktop Makefile.patch Makefile.patch2)
# patch (http://d.hatena.ne.jp/kakurasan/20080126/p1) and desktop file (http://d.hatena.ne.jp/kakurasan/20081024/p2)

prepare() {
	cd "${srcdir}/sted2-${pkgver}-patchset-20080126"
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-xcreatefontset.patch
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-select.patch
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-score.patch
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-sayleen-newline.patch
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-keysub.patch
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-ja_po.patch
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-curses-string_h.patch
	patch -p0 -d "${srcdir}" < sted2-${pkgver}-cnf-extprog.patch
}

build() {
	cd "${srcdir}/sted2-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man --with-default_path=/usr/lib/sted
	cd "${srcdir}/sted2-${pkgver}/intl"
	patch < "${srcdir}/Makefile.patch"
	cd "${srcdir}/sted2-${pkgver}/etc"
	patch < "${srcdir}/Makefile.patch2"
	cd "${srcdir}/sted2-${pkgver}"
	make
}

package() {
	cd "${srcdir}/sted2-${pkgver}"
	make INSTALL_PATH="${pkgdir}/usr/lib/sted" DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/sted2-${pkgver}/doc/original_docs/tuitou.doc" "${pkgdir}/usr/share/licenses/${pkgname}/tuitou.txt"
	install -Dm644 "${srcdir}/sted2.desktop" "${pkgdir}/usr/share/applications/sted2.desktop"
}

md5sums=('1ed869e2d7936086dcb6a05cc64e2d16'
         'cba68fbaf983853dec64dddcd5012530'
         '5b598da279f67f93b9842f4a3d5fdbe2'
         '82faa18dfec10d1f334bce70d5fb9201'
         '2f9082c6cd49f4de907b7c96c3a46284')

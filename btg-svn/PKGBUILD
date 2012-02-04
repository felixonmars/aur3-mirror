# Contributor: Andre Klitzing <aklitzing () online () de>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=btg-svn
pkgver=659
pkgrel=1
pkgdesc='Bittorrent client implemented in C++ and using the Rasterbar Libtorrent library.'
url='http://btg.berlios.de/'
license=('GPL')
arch=('i686' 'x86_64')
options=('!libtool' '!emptydirs')
makedepends=('subversion' 'boost' 'ncurses' 'gtkmm')
depends=('libtorrent-rasterbar>=0.15.6' 'gnutls' 'curl' 'dialog')
optdepends=('ncurses: btgcli'
            'gtkmm: btgui')

_svntrunk=svn://svn.berlios.de/btg/trunk
_svnmod=btg

source=('load_file.patch')
sha1sums=('37f65d2c2068dac505183b332437f00650f4159c')

install=install

build() {
	cd "${srcdir}"
	rm -fr "${_svnmod}"
	svn co "${_svntrunk}" -r "${pkgver}" "${_svnmod}"

	cd "${_svnmod}"
	sh autogen.sh

	patch -p1 -i ../load_file.patch
	sed -i 's/ncursesw" = yes/ncursesw" = lol/' configure

	./configure \
		--prefix=/usr \
		--enable-static=no \
		--enable-btg-config \
		--enable-daemon \
		--enable-gui \
		--enable-cli \
		--enable-www \
		--enable-session-saving \
		--enable-event-callback \
		--enable-url \
		--with-ncurses \

	make CXXFLAGS="$CXXFLAGS -DBOOST_FILESYSTEM_VERSION=2"
}

package() {
	cd "${srcdir}/${_svnmod}"
	make DESTDIR="${pkgdir}" install
}

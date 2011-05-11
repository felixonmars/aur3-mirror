# Made using uim-PKGBUILD (version 1.6.1-2) from extra repository as a template
# Maintainer of original uim-PKGBUILD: damir <damir@archlinux.org>

pkgname=uim-alpha
_pkgname=uim
pkgver=1.7.0
pkgrel=1
pkgdesc='Multilingual input method library'
arch=('i686' 'x86_64')
url='http://code.google.com/p/uim/'
license=('custom')
depends=('gtk2' 'gtk3' 'qt>=4' 'libxft' 'libedit' 'anthy' 'm17n-lib')
makedepends=('intltool' 'gettext')
provides=('uim')
conflicts=('uim')
#optdepends=('gnome-panel: gnome applet indicator')
options=('!libtool')
source=("http://uim.googlecode.com/files/${_pkgname}-${pkgver}-alpha.tar.bz2"
        'home.patch')
sha1sums=('b1a5059efea5e4fa788d3db608eed87fb5c8228d'
          'dbcf90f3ea246c5723d715e0935072baa9364cd2')

install=install

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}-alpha"

	# UIM's Makefile needs to write in $HOME
	patch -p0 < ../home.patch; export HOME="`pwd`"

	./configure --prefix=/usr --libexecdir=/usr/lib/uim \
		--disable-gnome-applet \
		--disable-gnome3-applet \
		--enable-qt4-qt3support \
		--disable-kde-applet \
		--disable-kde4-applet \
		--enable-pref \
		--without-scim \
		--with-gtk2 \
		--with-gtk3 \
                --with-qt4 \
		--with-qt4-immodule \
                --without-anthy \
                --with-anthy-utf8
	#	--with-qt-immodule \
        #	--with-qt \
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-alpha"
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

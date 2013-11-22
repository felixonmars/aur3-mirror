# Contributor: Marios Abatis <marios.archlinux@gmail.com>
_pkgname=gnome-chemistry-utils
pkgname=${_pkgname}-devel
pkgver=0.15.0
_majorver=$(echo ${pkgver}|cut -c1-4)
pkgrel=1
pkgdesc="Development branch of Gnome Chemistry Utilities (gcu). Includes gchempaint, a tool to draw molecules."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gchemutils/"
license=('GPL')

provides=('gchempaint' 'gchemcalc' 'gcrystal' 'gchem3d' 'gchemtable' 'gspectrum')
conflicts=('gnome-chemistry-utils')
depends=('bodr' 'libglade' 'goffice>=0.10.0' 'gtkglext' 'openbabel' 'chemical-mime-data' 'hicolor-icon-theme' 'dconf')
	##Already fulfilled dependencies:
	#libgsf required by goffice
	#gconf required by goffice
	#cairo required by gtk2 required by gconf
	#shared-mime-info required by gtk2 required by gconf
makedepends=('pkgconfig' 'intltool' 'gettext' 'gnome-doc-utils' 'boost' 'desktop-file-utils' 'xulrunner')
optdepends=('yelp: Viewing help manuals' \
	    'gnumeric-devel>1.11.6: gnumeric plugin'\
	    'gnome-doc-utils')
source=(http://download.savannah.gnu.org/releases/gchemutils/${_majorver}/${_pkgname}-${pkgver}.tar.bz2)
options=(!libtool)
install=gnome-chemistry-utils-devel.install
md5sums=('f0f6d100fcaca3849b67d8fc6980bf34')

build() {

	cd ${srcdir}/${_pkgname}-${pkgver}

	./configure	--prefix=/usr \
			--sysconfdir=/etc \
			--libexecdir=/usr/lib/${_pkgname} \
			--disable-update-databases \
			--enable-mozilla-plugin \
			--with-mozilla-libdir=/usr/lib/mozilla \
			--disable-schemas-compile

	make || return 1
}

package() {

	cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install || return 1
}

#Maintainer: Gianluca Boiano (aka M0Rf30)

pkgname=me-tv2-bzr
pkgver=114
pkgrel=1
pkgdesc="A GTK desktop application for watching digital television services that use the DVB standard"
arch=('i686' 'x86_64')
url="https://launchpad.net/me-tv"
license=('GPL')
depends=('glibmm' 'gtkmm' 'gconfmm' 'glib2' 'xine-lib' 'sqlite3' 'linuxtv-dvb-apps' 'libunique' 'libxml++' 'vlc' 'gstreamer0.10-base')
makedepends=('intltool' 'bzr')
provides='me-tv'
options=('!emptydirs')
conflicts=('me-tv-bzr' 'me-tv')
install=${pkgname}.install
_bzrtrunk=lp:~me-tv-administration/me-tv/2.0
_bzrmod=development

build() {
msg "Connecting to the server..."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  cd "${srcdir}/${_bzrmod}" 
  ./autogen.sh
  ./configure CXXFLAGS="$CXXFLAGS -D__KERNEL_STRICT_NAMES" --prefix=/usr
  make

}

package() {

	cd "${srcdir}/${_bzrmod}"

	make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

	install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" \
        --domain me-tv "${pkgdir}/usr/etc/gconf/schemas/${pkgname}.schemas"

	rm -rf "${pkgdir}/usr/etc/"

}

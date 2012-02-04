# Maintainer: Deniz Erdogan <euda23@gmail.com>

pkgname=epiphany-extension-sessionsaver
pkgver=4
pkgrel=5
url="http://www.gnome.org/projects/epiphany/"
pkgdesc="Automatically opens all tabs that were open before closing Epiphany"
arch=(i686 x86_64)
license=('GPL')
depends=('epiphany>=2.26.1' 'python>=2.5' 'opensp' 'gnome-common' 'gnome-vfs' 'autoconf' 'automake' 'epiphany-extensions>=2.24.1')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.12.2' 'intltool')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/epiphany-extensions/2.26/epiphany-extensions-2.26.1.tar.bz2
	http://aur.archlinux.org/packages/epiphany-extension-sessionsaver/epiphany-extension-sessionsaver/0-sessionsaverR4.patch
	http://aur.archlinux.org/packages/epiphany-extension-sessionsaver/epiphany-extension-sessionsaver/10-applysessionsaver.patch)
md5sums=('bc3044148e915312654f8c82a575e58e'
         '26fbb9871d75aa152a691da0cf858268'
         'fe1cefd74d15e7414f6a5fd37fb88437')

build() {
  cd ${startdir}/src/epiphany-extensions-2.26.1
  patch -p1 -i ../0-sessionsaverR4.patch || return 1
  patch -p1 -i ../10-applysessionsaver.patch || return 1

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var \
	      --with-extensions=really-all --disable-scrollkeeper || return 1
  cd ${startdir}/src/epiphany-extensions-2.26.1/extensions/sessionsaver
  make LDFLAGS+="-R /usr/lib/xulrunner" || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
}

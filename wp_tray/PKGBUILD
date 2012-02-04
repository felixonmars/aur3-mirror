# Maintainer: Nephyrin Zey <Nephyrin@DoubleZen.net>

pkgname=wp_tray
pkgver=0.5.5
pkgrel=1
pkgdesc="Wallpaper changing tray applet for gnome"
depends=('libgnomeuimm'
	'gconfmm'
	'gtkmm'
	'libgnomecanvasmm'
	'libglademm'
	'libnotify'
	'libxml++'
	'libpanelappletmm')
arch=(i686 x86_64)
license=('GPL')
url="http://planetearthworm.com/projects/wp_tray/"

# 04/23/2010 - His domain is parked and has been gone for a while,
#	providing a mirror on my personal unless someone can find
#	a more official mirror (ubuntu people?)
# source=(http://planetearthworm.com/projects/wp_tray/files/wp_tray-${pkgver}.tar.gz)
source=(http://nephyrin.net/arch/wp_tray-0.5.5.tar.gz
gcc-4.5.patch)

md5sums=('51f4d62f4257c27e986baf3b3e4d7f97'
         '30ef7e982681c99b37f90d7db3334755')

install="$pkgname".install

build() {
  cd "${srcdir}/wp_tray-${pkgver}"
  patch -Np1 -i "${srcdir}/gcc-4.5.patch" || return 1
  ./configure --prefix="/usr" --sysconfdir="/etc" || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

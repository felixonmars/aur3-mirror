pkgname=gnome-osd
pkgver=0.12.2
pkgrel=1
pkgdesc="Gnome OSD notification system"
arch=('i686' 'x86_64')
url="https://launchpad.net/gnome-osd"
license=('GPL-2')
depends=('python' 'pygtk' 'gnome-python')
makedepends=('setuptools')
source=(http://launchpad.net/${pkgname}/0.12/$pkgver/+download/${pkgname}-${pkgver}.tar.bz2
	gnome-osd-configure.patch)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../gnome-osd-configure.patch
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnome-osd ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
md5sums=('1d2114f13f63ef2d3789555e7694b7d6')

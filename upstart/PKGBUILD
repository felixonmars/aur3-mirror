# Contributer: giacomogiorgianni@gmail.com

pkgname=upstart
pkgver=1.13.2
pkgrel=1
pkgdesc="Upstart is an event-based replacement for the /sbin/init daemon"
arch=(i686 x86_64)
url="http://upstart.ubuntu.com/"
license=('GPL')
depends=('libnih' 'json-c' 'dbus')
makedepends=('python' 'pkgconfig')
conflicts=('sysvinit')
#replaces=('sysvinit')
options=(emptydirs)
source=( http://upstart.ubuntu.com/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('36ed88b7f3c11af8c6348fdf1f82e818')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --exec-prefix=/ --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
  # Cleanup some residue empty folders
  rm ${pkgdir}/etc/init/*
}

# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=udisks
pkgname=$_pkgname-floppy
pkgver=1.0.4
pkgrel=2
pkgdesc="Disk Management Service with floppy support"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL')
depends=('udev' 'sg3_utils' 'glib2' 'dbus-glib' 'polkit' 'parted' 'device-mapper' 'libatasmart' 'lsof' 'eject')
makedepends=('intltool' 'docbook-xsl')
conflicts=('udisks')
provides=("udisks=$pkgver")
options=(!libtool)
source=(http://hal.freedesktop.org/releases/${_pkgname}-${pkgver}.tar.gz
        floppy.patch)
sha256sums=('854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5'
            '2cde9e0066d83479216c9539352a9d4bc7d8064887e2fc13a9cb490dbcfd2c58')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Add back floppy support for GUI apps
  patch -Np1 -i "${srcdir}/floppy.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/udisks --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make profiledir=/usr/share/bash-completion/completions DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share/bash-completion/completions/udisks-bash-completion.sh"
  # move udev helpers and rules to /usr/lib
  mv "${pkgdir}"/lib/udev "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/lib
}

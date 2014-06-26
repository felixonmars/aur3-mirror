# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=upower-nosystemd
pkgver=0.9.23
pkgrel=4
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics (with pm-utils backend)"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
groups=('eudev-base')
depends=('libusb' 'polkit-consolekit' 'pm-utils' 'dbus-glib' 'libimobiledevice' 'udev')
backup=('etc/UPower/UPower.conf')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection')
provides=("upower=${pkgver}")
conflicts=('upower' 'upower-eudev')
replaces=('upower' 'upower-eudev')
options=('!libtool')
source=($url/releases/upower-${pkgver}.tar.xz
        create-dir-runtime.patch
        fix-segfault.patch
        linux-clamp-percentage-for-overfull-batteries.patch
	upower-pm-utils-0.9.23-always_use_pm-utils_backend.patch)
md5sums=('39cfd97bfaf7d30908f20cf937a57634'
         '74901767f9c94451083b3d92396454ab'
         'fa2f37eec44703e4c10edb5d9abb0f6b'
         'cd8eeb40c2338d28df46e22529bece62'
         '70547fd5af9125f5090137d7d50a8788')

prepare() {
  cd "upower-$pkgver"

  patch -Np1 -i ../create-dir-runtime.patch
  patch -Np1 -i ../fix-segfault.patch
  patch -Np1 -i ../linux-clamp-percentage-for-overfull-batteries.patch

  patch -Np1 -i ../upower-pm-utils-0.9.23-always_use_pm-utils_backend.patch
}

build() {
  cd "upower-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/upower \
    --disable-static \
    --enable-deprecated
  make
}

package() {
  cd "upower-$pkgver"
  make DESTDIR="$pkgdir" install
}

# Maintainer: udeved <udeved@openrc4arch.site40.net>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=upower-eudev
pkgver=0.9.23
pkgrel=2
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics without systemd support"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
groups=('eudev-base')
depends=('eudev' 'libusb' 'polkit-consolekit' 'dbus-glib' 'libimobiledevice' 'pm-utils')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'udev')
provides=('upower')
conflicts=('upower')
backup=('etc/UPower/UPower.conf')
options=('!libtool')
source=("$url/releases/upower-$pkgver.tar.xz"
		'linux-clamp-percentage-for-overfull-batteries.patch')
sha256sums=('433252b0a8e9ab4bed7e17ee3ee5b7cef6d527b1f5401ee32212d82a9682981b'
            '16c43fbd1a31b88b115392ecb29c449bebe0f8e70530fb965dca49cf0925b131')

prepare() {
  cd "upower-$pkgver"
  patch -Np1 -i ../linux-clamp-percentage-for-overfull-batteries.patch
}

build() {
  cd "upower-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/upower \
    --disable-static
  make
}

package() {
  cd "upower-$pkgver"
  make DESTDIR="$pkgdir" install
}

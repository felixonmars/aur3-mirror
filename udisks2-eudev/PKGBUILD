# Maintainer: udeved <udeved@openrc4arch.site40.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-eudev
pkgver=2.1.3
pkgrel=1
pkgdesc="Disk Management Service, version 2 without systemd support"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
groups=('eudev-base')
depends=('glib2' 'eudev' 'polkit-consolekit' 'libatasmart' 'util-linux')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'udev' 'python')
optdepends=('parted: partition management'
            'gptfdisk: GUID partition table support'
            'ntfs-3g: NTFS filesystem management support'
            'dosfstools: VFAT filesystem management support')
provides=('udisks2')
conflicts=('udisks2')
options=(!libtool)
source=("http://udisks.freedesktop.org/releases/udisks-$pkgver.tar.bz2"
		'git-fixes.patch')

prepare() {
  cd udisks-$pkgver
  #patch -Np1 -i ../git-fixes.patch
}

build() {
	cd "udisks-$pkgver"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--with-udevdir=/usr/lib/udev \
		--localstatedir=/var \
		--disable-static
	make
}

package() {
	cd "udisks-$pkgver"
	make DESTDIR="$pkgdir" install \
    bash_completiondir=/usr/share/bash-completion/completions
}
sha256sums=('5cc92fd651ee49a7888f90d091282b949afc629b31fdb34e187208750720632d'
            '52a9b9f039f9f115414715375f2b5874b79b5b67fbe2bdf3105b46d3a35f673f')

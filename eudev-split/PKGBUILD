# Maintainer: udeved <udeved@openrc4arch.site40.net>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ivailo Monev <xakepa10@gmail.com>

_udevver=208

pkgbase=eudev-split
pkgname=eudev-split
true && pkgname=('eudev' 'eudev-openrc')
pkgver=1.3
pkgrel=2
pkgdesc="The split pkg userspace dev tools (udev) forked by Gentoo and openrc support"
arch=('i686' 'x86_64')
license=('GPL')
groups=('eudev-base')
makedepends=('gobject-introspection' 'gperf' 'gtk-doc' 'intltool')
url="http://dev.gentoo.org/~blueness/eudev"

_gentoo_uri=("http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86")

source=("${url}/${pkgname}-${pkgver}.tar.gz"
	"${_gentoo_uri}/sys-fs/eudev/files/udev-postmount"
        'initcpio_hooks'
        'initcpio_install')

sha256sums=('6f1f0b15971a53c7070a44c902c7c1303f952927aa6370dbdf4d84d8bc09fac2'
            '0220e949b1f31832a205021c0a8615e77b27b73b7c9b16ef4a61bbd2774aeecb'
            '892ce43218e0a458981bbce451252c8987dc398e60b8de288e7542b8f2409c13'
            '1a70e48d5f5b476ed624f745b03988f2e8950e33ae864c6b1c4ef088882c8390')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --with-rootprefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
	      --sbindir=/usr/bin \
              --with-firmware-path=/usr/lib/firmware/updates:/usr/lib/firmware \
              --with-modprobe=/usr/bin/modprobe \
              --enable-gudev \
              --enable-introspection \
              --enable-split-usr \
              --enable-rule-generator
  make
}

package_eudev() {
	true
	pkgdesc="The userspace dev tools (udev) forked by Gentoo"
	depends=('glib2' 'hwids' 'kbd' 'kmod' 'util-linux')
	optdepends=('eudev-openrc: eudev-postmount script'
		    'upower-eudev: upower without systemd'
		    'udisks2-eudev: udisks2 without systemd')
	provides=("udev=${_udevver}" "systemd=${_udevver}"
		  "libsystemd=${_udevver}" "systemd-tools=${_udevver}")
	conflicts=('systemd' 'libsystemd' 'systemd-tools')
	backup=('etc/udev/udev.conf')
	options=(!makeflags !libtool)

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	for i in "${pkgdir}/usr/lib/udev/rules.d/"*.rules; do
	    sed -i -e 's#GROUP="dialout"#GROUP="uucp"#g;
		      s#GROUP="tape"#GROUP="storage"#g;
		      s#GROUP="cdrom"#GROUP="optical"#g' "${i}"
	done

	install -Dm644 "${srcdir}/initcpio_hooks" "${pkgdir}/usr/lib/initcpio/hooks/udev"
	install -Dm644 "${srcdir}/initcpio_install" "${pkgdir}/usr/lib/initcpio/install/udev"
}

package_eudev-openrc(){
	true
	pkgdesc="OpenRC eudev postmount script"
	arch=('any')
	url="http://openrc4arch.site40.net"
	groups=('openrc' 'openrc-base' 'eudev-base')
	depends=('openrc-base' 'eudev')
	makedepends=('udev')
	install=eudev.install

	install -Dm755 "${srcdir}/udev-postmount" "${pkgdir}/etc/init.d/udev-postmount"
	sed -e 's|#!/sbin/runscript|#!/usr/bin/runscript|' -i "${pkgdir}/etc/init.d/udev-postmount"
}

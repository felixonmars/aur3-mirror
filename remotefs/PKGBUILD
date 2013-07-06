#Maintainer: Rene Peinthor <peinthor@gmail.com> 

pkgname=remotefs
pkgver=0.15.2
_pkgver=0.15-2
pkgrel=3
pkgdesc="remotefs is a network file system designed for use with home NAS. Simple to use, few dependencies, reasonable security, completely in user space."
arch=(i686 x86_64 armv7h)
license=('GPL')
url="http://remotefs.sourceforge.net"
depends=('fuse')
makedepends=('fuse')
backup=('etc/rfs-exports' 'etc/default/rfsd')
source=(http://download.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${_pkgver}.tar.bz2
	werror.patch
	rfsd.service)
sha1sums=('d137cc3baeac21c657c79fed0f5ec28d020a08eb'
	'931d9fa056ef352d222fd2acfce120690645feb7'
	'05e2f446b69424536de5ffb5a01e64d49a664152'
	)

build() {
	cd "${srcdir}/${pkgname}-${_pkgver}"

	patch -p1 < ../werror.patch

	make release -j1
}

package() {
	cd "${srcdir}/${pkgname}-${_pkgver}"
	install -d "${pkgdir}/usr"
	make INSTALL_DIR="${pkgdir}/usr" install

	install -d "${pkgdir}/usr/bin"
	install "build/sbin/mount.rfs" "${pkgdir}/usr/bin"
	install "build/sbin/rfsnsswitch.sh" "${pkgdir}/usr/bin"
	install "build/sbin/umount.fuse.rfs" "${pkgdir}/usr/bin"
	
	install -d "${pkgdir}/etc/default"
	install -m 600 "build/etc/rfs-exports" "${pkgdir}/etc"
	install -m 600 "build/debian/default/rfsd" "${pkgdir}/etc/default"
	
	install -d "${pkgdir}/usr/lib/systemd/system"
	install "../rfsd.service" "${pkgdir}/usr/lib/systemd/system/rfsd.service"
}

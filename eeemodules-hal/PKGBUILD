# Contributor: Prurigro
# Maintainer: Prurigro
# Part of asus_acpi.patch fixing an issue with recent kernels, asus_acpi_backlight.patch and madwifi-hal-0.10.5.6-ha-addr.patch were contributed by andreas_baumann

pkgname=eeemodules-hal
pkgver=14
pkgrel=2
pkgdesc="Kernel Modules for EEEPC"
arch=("i686")
license=('GPL')
depends=('kernel26')
makedepends=('unrar' 'svn')
url="http://aur.archlinux.org/packages.php?ID=19256"
install=eeemodules.install
_madwifiver="r4126-20100324"
source=(http://ftp.gpl-devices.org/pub/vendors/Asus/EeePC_4G_701/ASUS_ACPI_071126.rar
		http://snapshots.madwifi-project.org/madwifi-hal-0.10.5.6/madwifi-hal-0.10.5.6-$_madwifiver.tar.gz
		asus_acpi.patch
		asus_acpi.makefile.patch
		asus_acpi_backlight.patch
		madwifi-hal-0.10.5.6-ha-addr.patch
		)
md5sums=('9f4b2815b8965624e639d1e7588b6cd0'
         '583f60b7885700bc3dcf779dbb328798'
         'c9473f6800a615ad510a7eb2f6ac947f'
         '6a63f5452d91e17c5b74d256932bd699'
         '9fcb659a45a9c0175238c462324f17b5'
         '86688124cb40db9371cdebf897be20a9'
         )

build() {
# install the asus_acpi modules
	pushd ${startdir}/src || return 1
		unrar e -y ASUS_ACPI_071126.rar || return 1
		tar -xzf asus_acpi.tar.gz || return 1
		cd asus_acpi || return 1
		patch -p0 <../asus_acpi.patch || return 1
		patch -p0 < ../asus_acpi.makefile.patch || return 1
		patch -p1 < ../asus_acpi_backlight.patch || return 1
		make || return 1
		install -D -m644 asus_acpi.ko ${startdir}/pkg/lib/modules/$(uname -r)/kernel/drivers/platform/x86/asus_acpi.ko || return 1
	popd || return 1

	# install atheros wifi driver
	pushd ${startdir}/src/madwifi-hal-0.10.5.6-$_madwifiver || return 1
		patch -p1 < ../madwifi-hal-0.10.5.6-ha-addr.patch
		BINDIR=/usr/bin MANDIR=/usr/man make || return 1
		BINDIR=/usr/bin MANDIR=/usr/man make DESTDIR=${startdir}/pkg install || return 1
	popd || return 1
}

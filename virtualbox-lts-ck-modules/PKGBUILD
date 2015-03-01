# Maintainer: Joshua Houghton <joshua.j.houghton@googlemail.com>
# Contributer: graysky <graysky AT archlinux DOT us>
# Contributer: Ionut Biru <ibiru@archlinux.org>
# Contributer: Sébastien Luttringer <seblu@aur.archlinux.org>
pkgbase=(virtualbox-lts-ck-modules)
pkgname=(virtualbox-lts-ck-host-modules virtualbox-lts-ck-guest-modules)
pkgver=4.3.22
pkgrel=3
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-lts-ck-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-3.14-lts-ck
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
	# dkms need modification to be run as user
	cp -r /var/lib/dkms .
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
	# build host modules
	msg2 'Host modules'
	dkms --dkmsframework dkms.conf build "vboxhost/$pkgver" -k "$_kernver"
	# build guest modules
	msg2 'Guest modules'
	dkms --dkmsframework dkms.conf build "vboxguest/$pkgver" -k "$_kernver"
}

package_virtualbox-lts-ck-host-modules() {
	#_Hpkgdesc='Host kernel modules for VirtualBox running under Linux-lts-ck.'
	#pkgdesc="${_Hpkgdesc}"
	pkgdesc='Host kernel modules for VirtualBox running under Linux-lts-ck.'
	provides=("virtualbox-host-modules")
	depends=('linux-lts-ck>=3.14' 'linux-lts-ck<3.15')
	conflicts=('virtualbox-lts-ck-host-modules-atom' 'virtualbox-lts-ck-host-modules-barcelona' 'virtualbox-lts-ck-host-modules-bulldozer' 'virtualbox-lts-ck-host-modules-corex' 'virtualbox-lts-ck-host-modules-core2' 'virtualbox-lts-ck-host-modules-haswell' 'virtualbox-lts-ck-host-modules-ivybridge' 'virtualbox-lts-ck-host-modules-kx' 'virtualbox-lts-ck-host-modules-k10' 'virtualbox-lts-ck-host-modules-nehalem' 'virtualbox-lts-ck-host-modules-p4' 'virtualbox-lts-ck-host-modules-piledriver' 'virtualbox-lts-ck-host-modules-pentm' 'virtualbox-lts-ck-host-modules-sandybridge')
	#replaces=('virtualbox-lts-ck-host-modules-corex')
	#groups=('lts-ck-generic')
	install=host.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
}

package_virtualbox-lts-ck-guest-modules() {
	#_Gpkgdesc='Guest kernel modules for VirtualBox running under Linux-lts-ck.'
	#pkgdesc="${_Gpkgdesc}"
	pkgdesc='Guest kernel modules for VirtualBox running under Linux-lts-ck.'
	license=('GPL')
	provides=("virtualbox-guest-modules")
	depends=('linux-lts-ck>=3.14' 'linux-lts-ck<3.15')
	conflicts=('virtualbox-lts-ck-guest-modules-atom' 'virtualbox-lts-ck-guest-modules-barcelona' 'virtualbox-lts-ck-guest-modules-bulldozer' 'virtualbox-lts-ck-guest-modules-corex' 'virtualbox-lts-ck-guest-modules-core2' 'virtualbox-lts-ck-guest-modules-haswell' 'virtualbox-lts-ck-guest-modules-ivybridge' 'virtualbox-lts-ck-guest-modules-kx' 'virtualbox-lts-ck-guest-modules-k10' 'virtualbox-lts-ck-guest-modules-nehalem' 'virtualbox-lts-ck-guest-modules-p4' 'virtualbox-lts-ck-guest-modules-piledriver' 'virtualbox-lts-ck-guest-modules-pentm' 'virtualbox-lts-ck-guest-modules-sandybridge')
	#replaces=('virtualbox-lts-ck-guest-modules-corex')
	#groups=('lts-ck-generic')
	install=guest.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
}


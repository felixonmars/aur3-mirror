# Maintainer: udeved <udeved@openrc4arch.site40.net>

# file vars for easy update
_Cacpi=acpid-2.0.16-conf.d
_Iacpi=acpid-2.0.16-init.d
_Calsa=alsasound.confd-r4
_Ialsa=alsasound.initd-r5
_Ick=consolekit-0.2.rc
_Sck=90-consolekit-3
_Cxdm=xdm.confd-4
_Ixdm1=xdm.initd-11
_Ixdm2=xdm-setup.initd-1
_Sxdm=startDM.sh
_Cgpm=gpm.conf.d
_Igpm=gpm.rc6-2

_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

pkgbase=openrc-desktop-split
pkgname=openrc-desktop-split
true && pkgname=('acpid-openrc'
				'alsa-utils-openrc'
				'avahi-openrc'
				'consolekit-openrc'
				'displaymanager-openrc'
				'gpm-openrc'
				'openrc-desktop-split')
pkgver=20140416
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/udeved/pkgbuilds"
license=('GPL2')
groups=('openrc' 'openrc-desktop')
makedepends=('acpid'
			'alsa-utils'
			'avahi'
			'consolekit'
			'gpm'
			'xorg-server')
conflicts=('openrc-arch-services-git'
			'initscripts'
			'systemd-sysvcompat'
			'openrc'
			'openrc-git')

source=("${_gentoo_uri}/sys-power/acpid/files/${_Cacpi}"
		"${_gentoo_uri}/sys-power/acpid/files/${_Iacpi}"
		"${_gentoo_uri}/media-sound/alsa-utils/files/${_Calsa}"
		"${_gentoo_uri}/media-sound/alsa-utils/files/${_Ialsa}"
		"${_gentoo_uri}/sys-auth/consolekit/files/${_Ick}"
		"${_gentoo_uri}/sys-auth/consolekit/files/${_Sck}"
		"${_gentoo_uri}/x11-base/xorg-server/files/${_Cxdm}"
		"${_gentoo_uri}/x11-base/xorg-server/files/${_Ixdm1}"
		"${_gentoo_uri}/x11-base/xorg-server/files/${_Ixdm2}"
		"${_gentoo_uri}/x11-apps/xinit/files/${_Sxdm}"
		"${_gentoo_uri}/sys-libs/gpm/files/${_Cgpm}"
		"${_gentoo_uri}/sys-libs/gpm/files/${_Igpm}"
		'avahi-daemon'
		'avahi-dnsconfd')

pkgver() {
	date +%Y%m%d
}

_shebang='s|#!/sbin/runscript|#!/usr/bin/runscript|'
_runpath='s|/var/run|/run|g'
_binpath='s|/usr/sbin|/usr/bin|g'

package_acpid-openrc() {
	true
	pkgdesc="OpenRC acpid init script"
	depends=('openrc-base' 'acpid')
	backup=('etc/conf.d/acpid')
	install=acpid.install

	install -Dm755 "${srcdir}/${_Cacpi}" "${pkgdir}/etc/conf.d/acpid"
	install -Dm755 "${srcdir}/${_Iacpi}" "${pkgdir}/etc/init.d/acpid"

	sed -e "${_shebang}" -e "${_binpath}" -i "${pkgdir}/etc/init.d/acpid"
}

package_alsa-utils-openrc() {
	true
	pkgdesc="OpenRC alsa-utils init script"
	depends=('openrc-base' 'alsa-utils')
	install=alsa-utils.install

	install -Dm755 "${srcdir}/${_Calsa}" "${pkgdir}/etc/conf.d/alsasound"
	install -Dm755 "${srcdir}/${_Ialsa}" "${pkgdir}/etc/init.d/alsasound"

	sed -e "${_shebang}" -i "${pkgdir}/etc/init.d/alsasound"
}

package_avahi-openrc() {
	true
	pkgdesc="OpenRC avahi init script"
	depends=('avahi' 'dbus-openrc')
	install=avahi.install

	install -Dm755 "${srcdir}/avahi-daemon" "${pkgdir}/etc/init.d/avahi-daemon"
	install -Dm755 "${srcdir}/avahi-dnsconfd" "${pkgdir}/etc/init.d/avahi-dnsconfd"
}

package_consolekit-openrc() {
	true
	pkgdesc="OpenRC consolekit init script"
	depends=('openrc-base' 'consolekit')
	install=consolekit.install

	install -Dm755 "$srcdir/${_Sck}" "$pkgdir/etc/X11/xinit/xinitrc.d/90-consolekit"

	install -Dm755 "$srcdir/${_Ick}" "$pkgdir/etc/init.d/consolekit"

	sed -e "${_shebang}" -e "${_runpath}" -e "${_binpath}" -i "${pkgdir}/etc/init.d/consolekit"
}

package_displaymanager-openrc() {
	true
	pkgdesc="OpenRC dm init script"
	depends=('openrc-base' 'xorg-server')
	optdepends=('consolekit-openrc' 'dbus-openrc')
	backup=('etc/conf.d/xdm')
	install=displaymanager.install

	install -Dm755 "${srcdir}/${_Cxdm}" "${pkgdir}/etc/conf.d/xdm"
	install -Dm755 "${srcdir}/${_Ixdm1}" "${pkgdir}/etc/init.d/xdm"
	install -Dm755 "${srcdir}/${_Ixdm2}" "${pkgdir}/etc/init.d/xdm-setup"
	install -Dm755 "${srcdir}/${_Sxdm}" "${pkgdir}/etc/X11/startDM.sh"

	local _p1='s|/etc/profile.env|/etc/profile|g' \
	_p2='s|{ROOTPATH}|{PATH}|g'
	sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -e "${_p1}" -e "${_p2}" -i "${pkgdir}/etc/init.d/xdm"
	sed -e "${_shebang}" -i "${pkgdir}/etc/init.d/xdm-setup"
}

package_gpm-openrc() {
	true
	pkgdesc="OpenRC gpm init script"
	depends=('openrc-base' 'gpm')
	backup=('etc/conf.d/gpm')
	install=gpm.install

	install -Dm755 "${srcdir}/${_Cgpm}" "${pkgdir}/etc/conf.d/gpm"
	install -Dm755 "${srcdir}/${_Igpm}" "${pkgdir}/etc/init.d/gpm"

	sed -e "${_shebang}" -e "${_binpath}" -e "${_runpath}" -i "${pkgdir}/etc/init.d/gpm"
}

# Comment out if you build for your personal repo
# remove 'openrc-desktop-split' from pkgname array
# Dummy package to make AUR display correct info
# If installed, it should make upgrade from AUR possible
package_openrc-desktop-split() {
	true
	pkgdesc="OpenRC desktop init scripts, AUR upgrade and info split-pkg helper"
	depends=('openrc-base')
	provides=("openrc-desktop-split-helper=${pkgver}")
}
sha256sums=('3755d4eb8bb64a1304e5defedb949305ac550565da36fe4f94d5f31beee821ba'
            '980468e6bf96c7677898330cadbcff165b4d15f1197cd544548bd0f8c376983d'
            'd1c55400b701a72dcb8bb85e016b5013fa3eb6a2766ffc20dae278d0ee4c1a43'
            'daf46bbc4156a82e0c6c7135ee94b31a3dfb6d366fcf3f45e8c842d1348601be'
            'da849bae527a7a5c257301a99ac3fb5ec2ded48103ec114552ca7d2a24b12e49'
            '91e0900995f7db536220065959d236fb75ec2c77096981a142e2e948518d9761'
            '9d26b72bb28611a60a6b9f942b8d8cfe47b59f926be89af9709b5912668344d8'
            '86a17c9ba172481318d5fd51c3aadfdcad9e5d52ed7478379723ce1784061930'
            '942ce5e8d1a0770543b683dcc388bae7619a24eb9741c1cd678ed3df97c01406'
            'e7f2d95b3b4b6b5d711f926f8a3b7b0163b4d9e40b40489bcbd1316806e47499'
            '73e7483fdc4b12ab4225a4cb13bbe7da71b07b9e69b17e3a6a4c63cb5e2287c8'
            'e692e7b97efdd79f6e92fbdaed60f7a71bfd23a82c5561b160b88a7aa50c8461'
            '375ce44cc9cbfa660da68c5b07a0629daccca68477224fa5dd49c0f13dc50015'
            '4e74af8ed0305ee1c22d9a03de9c3fc0a9177c3cb1a0dc65cdfd904dd078653d')

# Maintainer: artoo <flower_of_life@gmx.net>

#Should this build be integrated in the split eudev build?

_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

pkgname=eudev-openrc
pkgver=20140611
pkgrel=1
pkgdesc="OpenRC eudev postmount script"
arch=('any')
url="https://github.com/udeved/pkgbuilds"
license=('GPL2')
groups=('eudev-base')
depends=('openrc-core'
	'eudev')
conflicts=('openrc-arch-services-git'
	  'initscripts'
	  'systemd-sysvcompat'
	  'openrc'
	  'openrc-git')
install=eudev.install
source=("${_gentoo_uri}/sys-fs/eudev/files/udev-postmount")
sha256sums=('0220e949b1f31832a205021c0a8615e77b27b73b7c9b16ef4a61bbd2774aeecb')

pkgver() {
  date +%Y%m%d
}

package(){
  install -Dm755 "${srcdir}/udev-postmount" "${pkgdir}/etc/init.d/udev-postmount"

  local _shebang='s|#!/sbin/runscript|#!/usr/bin/runscript|'
  sed -e "${_shebang}" -i "${pkgdir}/etc/init.d/udev-postmount"
}

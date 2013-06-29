# -*- shell-script -*-
#
# $Id: PKGBUILD 168542 2012-10-13 09:29:55Z thomas $
# Maintainer: Tom Gundersen <teg..jklm.no>
# Contributor: Thomas Bächler <thomas..archlinux.org>
# Contributor: Aaron Griffin <aaron..archlinux.org>
#
# AUR initscripts-aic 2013-06-10 12:28:50Z
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=initscripts-aic
_gitname=initscripts
pkgver=2013.06.2
pkgrel=3
pkgdesc="System initialization/bootup scripts for SysV init"
arch=('any')
url="http://git.sysphere.org/initscripts/"
license=('GPL2')
provides=('initscripts'  'initscripts-systemd')
conflicts=('initscripts' 'initscripts-systemd')
replaces=('initscripts'  'initscripts-systemd')
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=('glibc' 'bash' 'coreutils' 'systemd-tools' 'iproute2' 'ncurses' 'findutils' 'sysvinit-tools')
optdepends=('dhcpcd: DHCP network configuration'
            'bridge-utils: Legacy network bridging support'
            'net-tools: Legacy network support'
            'wireless_tools: Legacy wireless networking'
            'sysvinit: Legacy init support')
makedepends=(asciidoc)
install=initscripts.install
source=("http://git.sysphere.org/${_gitname}/snapshot/${_gitname}-${pkgver}.tar.xz")
md5sums=("e2f5f8b83b9ac995d3f9c77039228db4")


package() {
  cd ${srcdir}/${_gitname}-${pkgver}


# Build and install initscripts
  make DESTDIR=${pkgdir} install


# Cleanup systemd components
# - we do not want to conflict with another package, especially on
#   files we have no use for
  rm -rf ${pkgdir}/usr/lib
}

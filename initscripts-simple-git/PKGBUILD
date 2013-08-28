# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

# Update: 910JQK <910JQK@gmail.com>

pkgname=initscripts-simple-git
pkgver=2013.08.28
pkgrel=1
pkgdesc="System initialization/bootup scripts (simple edition)"
arch=('any')
url="https://github.com/910JQK/SimpleInit"
license=('GPL2')
provides=('initscripts-systemd' 'initscripts')
conflicts=('initscripts-systemd' 'initscripts')
replaces=('initscripts-systemd' 'initscripts')
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=('glibc' 'bash' 'coreutils' 'systemd-tools' 'iproute2' 'ncurses' 'findutils' 'sysvinit-tools')
optdepends=('dhcpcd: DHCP network configuration'
            'bridge-utils: Legacy network bridging support'
            'net-tools: Legacy network support'
            'wireless_tools: Legacy wireless networking'
            'sysvinit: Init support'
            'systemd-tools: Systemd tools support'
            'perl: init.pl support')
#makedepends=(asciidoc)
#install=initscripts.install
#source=("ftp://ftp.archlinux.org/other/initscripts/${pkgname}-${pkgver}.tar.xz")

package() {
  cd ${srcdir}
  git clone https://github.com/910JQK/SimpleInit
  cd SimpleInit
  make DESTDIR=${pkgdir} install
}
#md5sums=('a4a747e73819b81f2218cf5b9bd53703')

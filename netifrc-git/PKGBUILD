# Maintainer:  Kaleb Elwert <kelwert@mtu.edu>

# NOTE: this is based off of the openrc-git PKGBUILD.
# The following are contributors to openrc-git
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=netifrc-git
pkgver=0.1.7d3d30a
pkgrel=1
pkgdesc='Simple network management for openrc'
arch=('i686' 'x86_64')
url='https://github.com/rabisg/netifrc/'
license=('BSD')
depends=('openrc')
makedepends=('git')
provides=('netifrc')
conflicts=('netifrc')
backup=(etc/openrc/conf.d/net)
source=('git://github.com/rabisg/netifrc.git')
md5sums=('SKIP')

_makeargs=(PKG_PREFIX="")
_makeargs+=(SYSCONFDIR=/etc/openrc) # avoid conflict with initscripts

pkgver() {
    cd "$srcdir/netifrc"
	echo "$(cat Makefile.inc | grep '^VERSION=' | sed 's/VERSION=[ \t]*//').$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/netifrc"
	sed -i 's/\/usr\/sbin\/wpa_supplicant/\/usr\/bin\/wpa_supplicant/' net/wpa_supplicant.sh
}

build() {
    cd "$srcdir/netifrc"
    make "${_makeargs[@]}"
}

package() {
    cd "$srcdir/netifrc"
    make DESTDIR="$pkgdir" "${_makeargs[@]}" install
}

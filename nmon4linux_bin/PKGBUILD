# Contributor: Massimiliano Torromeo <massimiliano (dot) torromeo (at) gmail.com>
# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=nmon4linux_bin
pkgver=14a
pkgrel=1
pkgdesc="AIX & Linux Performance Monitoring tool (binary)"
arch=('i686' 'x86_64')
url="http://www-941.haw.ibm.com/collaboration/wiki/display/WikiPtype/nmon"
license="custom"
_arch="$CARCH"
source=("http://nmon.sourceforge.net/docs/MPG_nmon_for_Linux_14a_binaries.zip")
md5sums=('c6dca5c566cfbd600929f33591b17f87')
conflicts=('nmon4linux')
depends=('ncurses')

build() {
true
}

package() {
	[[ "$CARCH" == 'i686' ]] && _arch='x86'
	install -Dm 0755 "${srcdir}/nmon_${_arch}_ubuntu1004" "${pkgdir}/usr/bin/nmon"
}

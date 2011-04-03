# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=nmon4linux
pkgver=14f
pkgrel=1
pkgdesc="AIX & Linux Performance Monitoring tool"
arch=('i686' 'x86_64')
url="http://nmon.sourceforge.net/pmwiki.php?n=Main.HomePage"
license=("GPL")
_arch="$CARCH"
source=("http://sourceforge.net/projects/nmon/files/lmon${pkgver}.c" 'http://sourceforge.net/projects/nmon/files/code/makefile')
noextract=("lmon${pkgver}.c" 'makefile')
depends=('ncurses')

md5sums=('0386cb994f6739a103f297808b47c28f'
         'e30038c5d5a75e6bc2c6a62010eaac62')


[[ "$CARCH" == 'i686' ]] && _arch='x86'

build() {
	cd ${srcdir}/
	ln -s lmon${pkgver}.c lmon.c
	make nmon_${_arch}_ubuntu810
}

package() {
	cd ${srcdir}/
	install -D -m 0755 "nmon_${_arch}_ubuntu810" "${pkgdir}/usr/bin/nmon"
}

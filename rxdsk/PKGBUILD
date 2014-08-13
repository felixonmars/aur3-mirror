# Maintainer: Matthew Stobbs <matthew@stobbstechnical.com>

pkgname="rxdsk"
pkgver="2.12"
_srcdir="${pkgname}-${pkgver}"
pkgrel=2
pkgdesc="A kernel module and admin tool for setting up high efficieny disks in memory, including caching"
url="http://www.rapiddisk.org"
license=('GPL')
arch=( 'i686' 'x86_64')
depends=( 'zlib' 'dkms' )
makedepends=( 'linux-headers' )
provides=( 'rxdsk' )
install="rxdsk.install"

source=( "http://downloads.sourceforge.net/project/${pkgname}/2.x/${pkgname}-${pkgver}.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Frxdsk%2F&ts=1407629213&use_mirror=iweb" 
"rxdsk.install" )
md5sums=('523b8e74b0a1fbed4763355ac7d4b5cc'
         '6734393287ab1ef4a6fdd64e43062be6')
build() {
	cd "${srcdir}/${_srcdir}"
	find . -type f -iname 'Makefile' -exec sed -i 's/depmod -a//g' {} \;
	make
}

package() {
	cd "${srcdir}/${_srcdir}"
	install -dm755 "${pkgdir}/sbin"
	install -dm755 "${pkgdir}/usr/share/man/man1"
        install -dm755 "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/block"
	make DESTDIR="${pkgdir}" install
}

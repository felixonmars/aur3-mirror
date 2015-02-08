# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=libpcap-pfring-svn
_pkgname=PF_RING
pkgver=20150208
pkgrel=1
pkgdesc="pfring aware libpcap"
url="http://www.ntop.org"
arch=('x86_64' 'i686')
license=('GPL' 'LGPL')
depends=('numactl' 'libpfring-svn' 'libnl')
makedepends=('make' 'binutils' 'flex' 'bison' 'svn')
conflicts=('libpcap')
provides=('libpcap=1.6.2')
source=("svn+https://svn.ntop.org/svn/ntop/trunk/PF_RING/")
md5sums=('SKIP')


#pkgver() {
#   cd ${srcdir}
#   svnversion
#}

build() {
        cd "${srcdir}/${_pkgname}/userland/lib"
        ./configure --prefix=/usr --libdir=/usr/lib/libpfring --includedir=/usr/include/pfring
        make

	cd "${srcdir}/${_pkgname}/userland/libpcap"
	./configure --prefix=/usr \
	--disable-bluetooth \
#	--libdir=/usr/lib/libpcap/ --includedir=/usr/include/libpcap
	make
}

package() {
	cd "${srcdir}/${_pkgname}/userland/libpcap"
	make DESTDIR="${pkgdir}" install
	install -d  ${pkgdir}/usr/share/doc/${pkgname}
	install -d  ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 ${srcdir}/${_pkgname}/userland/libpcap/CHANGES $pkgdir/usr/share/doc/${pkgname}/ChangeLog
        install -Dm644 ${srcdir}/${_pkgname}/userland/libpcap/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
        install -Dm644 ${srcdir}/${_pkgname}/userland/libpcap/CREDITS $pkgdir/usr/share/doc/${pkgname}/CREDITS
        install -Dm644 ${srcdir}/${_pkgname}/userland/libpcap/README $pkgdir/usr/share/doc/${pkgname}/Readme
        install -Dm644 ${srcdir}/${_pkgname}/userland/libpcap/README.linux $pkgdir/usr/share/doc/${pkgname}/Readme.linux
}

## Contributor: Brad Arrington bradla @ yahoo.com
pkgname=ufs-tools
pkgver=0.1
pkgrel=1
pkgdesc='Utility for creating UFS 1 & 2 filesystems on Linux'
arch=('i686' 'x86_64')
url='http://ufs-linux.sourceforge.net/'
license=('GPL')
depends=('libbsd')
provides=('mkfs.ufs')
conflicts=('ufsutils')
source=("http://downloads.sourceforge.net/project/ufs-linux/ufs-tools/0.1/${pkgname}-${pkgver}.tar.bz2"
	'ufs-tools.patch')

md5sums=('c4a78473c8b5267b2799b53c878edaad'
	 'b162180a673450629801cc3bf485df77')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../ufs-tools.patch
	make -C libufs
	make
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/libufs/libufs.so.1.0" "${pkgdir}/usr/lib/libufs.so.1.0"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/UFS.txt" "${pkgdir}/usr/share/doc/${pkgname}/UFS.txt"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/mkufs" "${pkgdir}/usr/bin/mkufs"
	ln -rs "${pkgdir}/usr/lib/libufs.so.1.0" "${pkgdir}/usr/lib/libufs.so.1"
	ln -rs "${pkgdir}/usr/bin/mkufs" "${pkgdir}/usr/bin/mkfs.ufs"
}

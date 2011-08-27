# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=java-commons-vfs
pkgver=1.0
pkgrel=1
pkgdesc='Implementations of common vfs'
arch=('i686' 'x86_64')
url='http://commons.apache.org/vfs/'
license=('APACHE')
depends=('java-runtime')
source=("http://mirror.mkhelif.fr/apache//commons/vfs/binaries/commons-vfs-1.0.tar.gz")
md5sums=('f82dd8d68264b349462bb015f299a4b7')

build() {
    install -d -m755 ${pkgdir}/usr/share/java/commons-vfs/ || return 1
    install -m644 \
        ${srcdir}/commons-vfs-${pkgver}/commons-vfs-${pkgver}.jar \
	${pkgdir}/usr/share/java/commons-vfs/commons-vfs.jar || return 1
}

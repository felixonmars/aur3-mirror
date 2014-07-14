# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qgifer
pkgver=0.2.1
pkgrel=3
pkgdesc="A video-based animated GIF creator"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qgifer/"
license=('GPL3')
depends=('giflib>=5.1.0' 'opencv' 'qt4')
optdepends=('imagemagick: for GIF optimizer.')
makedepends=('cmake')
source=('http://downloads.sourceforge.net/project/qgifer/QGifer-0.2.1/qgifer-0.2.1-source.tar.gz'
  'giflib5.patch'
  'giflib_5.0.6_to_5.1.0.patch')
md5sums=('cacfcd25bb32352ea4fbb526c87efa0f'
         'b6c3fcfa45ec81469e88fac13a80f5cf'
         '010183c5b49c0a043feb577492ade13d')


build() {
	mkdir ${srcdir}/build
	cd ${srcdir}/${pkgname}-${pkgver}-source/
	patch -Np1 -i ../giflib5.patch
        patch -Np1 -i ../giflib_5.0.6_to_5.1.0.patch
        
	cd ${srcdir}/build
	cmake ../${pkgname}-${pkgver}-source \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DQUIET_MODE=ON \
          -DCMAKE_BUILD_TYPE=release
}

package() {
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}


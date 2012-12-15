# Maintainer: Elvirna <xanderxx@hotmail.fr>

pkgname=minilibx
pkgver=2
pkgrel=1
pkgdesc="MiniLibX for Epitech"
arch=('i686' 'x86_64')
url="http://galaparo.fr.cr/minilibx.tar"
license=('GPL2')
source=("http://epitips.bigis.fr/data/minilibx-install.tar")
md5sums=('90dad9165593469e894afe246d569d95')

build() {
	echo ${srcdir}
	echo ${pkgname}
	echo ${pkgdir}
	cd ${srcdir}/minilibx-install
	tar -xf minilibx.tgz
	cd minilibx
	make
}

package() {
   mkdir -p "${pkgdir}"/usr/lib
   mkdir -p "${pkgdir}"/usr/include
   
   cp -rPf ${srcdir}/minilibx-install/minilibx/libmlx.a "${pkgdir}"/usr/lib
   cp -rPf ${srcdir}/minilibx-install/minilibx/mlx.h "${pkgdir}"/usr/include
}

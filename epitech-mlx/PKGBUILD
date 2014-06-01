# Maintainer: mezzer <m3zz3r@gmail.com>

pkgname=epitech-mlx
pkgver=1
pkgrel=1
pkgdesc="MiniLibX for Epitech"
arch=('i686' 'x86_64')
url="http://aur.mezzer.eu/epitech/mlx/"
license=('GPL2')
source=("http://aur.mezzer.eu/epitech/mlx/mlx-install.tar")
md5sums=('f10989863310e6b105638d4675166ab2')

build() {
	cd ${srcdir}/mlx-install
	make
}

package() {
   mkdir -p "${pkgdir}"/usr/lib
   mkdir -p "${pkgdir}"/usr/include
   mkdir -p "${pkgdir}"/usr/share/man/man1/
   cp -rPf ${srcdir}/mlx-install/mlx.1 "${pkgdir}"/usr/share/man/man1/
   cp -rPf ${srcdir}/mlx-install/libmlx.a "${pkgdir}"/usr/lib
   cp -rPf ${srcdir}/mlx-install/mlx.h "${pkgdir}"/usr/include
}

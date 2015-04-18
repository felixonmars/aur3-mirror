# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-stream_filter
_hordename=Horde_Stream_Filter
pkgver=2.0.2
pkgrel=2
pkgdesc="A collection of various stream filters"
url="http://http://pear.horde.org/"
arch=('any')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('ae3bfce5ce7b44b79d2d454a3fbc7e15')
depends=('php')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}

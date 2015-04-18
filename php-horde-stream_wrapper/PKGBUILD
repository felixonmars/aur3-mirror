# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-stream_wrapper
_hordename=Horde_Stream_Wrapper
pkgver=2.1.0
pkgrel=2
pkgdesc="A collection of stream wrappers"
url="http://http://pear.horde.org/"
arch=('any')
license=('GPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('2fd063c1204e15dad6f5989f75d2e3e3')
depends=('php')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
}

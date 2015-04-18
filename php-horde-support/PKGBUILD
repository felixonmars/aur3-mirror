# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-support
_hordename=Horde_Support
pkgver=2.1.1
pkgrel=2
pkgdesc="Support classes not tied to Horde but is used by it. These classes can be used outside of Horde as well."
url="http://http://pear.horde.org/"
arch=('any')
license=('BSD')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('216da43be5c4602346e7777ee5fb9378')
depends=('php' 'php-horde-exception' 'php-horde-stream_wrapper')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}

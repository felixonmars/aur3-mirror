# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-mime
_hordename=Horde_Mime
pkgver=2.4.3
pkgrel=2
pkgdesc="Provides methods for dealing with Multipurpose Internet Mail Extensions (MIME) features (RFC 2045/2046/2047)."
url="http://http://pear.horde.org/"
arch=('any')
license=('GPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('4919d756971d4fb455d437fa02b8a530')
depends=('php' 'php-horde-exception' 'php-horde-stream_filter' 'php-horde-support' 'php-horde-text_flowed' 'php-horde-translation' 'php-horde-util')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}

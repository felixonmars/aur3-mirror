# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-mail
_hordename=Horde_Mail
pkgver=2.3.0
pkgrel=2
pkgdesc="A collection of various stream filters"
url="http://http://pear.horde.org/"
arch=('any')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('0b89c1bd8f7bcbd368113cc4026cf73f')
depends=('php' 'php-horde-exception' 'php-horde-mime' 'php-horde-stream_filter')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}

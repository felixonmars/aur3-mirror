pkgname=php-horde-crypt-blowfish
_hordename=Horde_Crypt_Blowfish
pkgver=1.0.2
pkgrel=1
pkgdesc="Provide functionality useful for all kind of applications"
url="http://pear.horde.org/"
arch=('any')
depends=('php')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('5709c2b5cdadd59f33720c2e8ac98c31')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}

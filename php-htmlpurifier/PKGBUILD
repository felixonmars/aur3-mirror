pkgname=php-htmlpurifier
pkgver=4.6.0
pkgrel=1
pkgdesc="Provide functionality useful for all kind of applications"
url="https://github.com/ezyang/htmlpurifier"
arch=('any')
depends=('php')
license=('LGPL')
source=("https://github.com/ezyang/htmlpurifier/archive/v$pkgver.tar.gz")
md5sums=('f29340c4258214722e4547a79d01a6a9')

package() {
  cd ${srcdir}/htmlpurifier-${pkgver}/
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./library/* ${pkgdir}/usr/share/pear/
#  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}

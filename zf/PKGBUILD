# Maintainer: Julio Napurí <julionc@gmail.com>
pkgname=zf
_name=zendframework
pkgver=1.11.6
pkgrel=1
pkgdesc='ZendFramework - An object-oriented web-application framework for PHP projects'
arch=('any')
url='http://framework.zend.com/'
license=('BSD')
depends=('php' 'php-pear')
source=("http://framework.zend.com/releases/ZendFramework-${pkgver}/ZendFramework-${pkgver}.tar.gz")
md5sums=('9fa00238274913eae59a3fb95f1947c3')

build() {
    true
}

package() {
  cd "${srcdir}/ZendFramework-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/pear/Zend"
  mkdir -p "${pkgdir}/usr/share/pear/ZendX"
  cp -R library/Zend/ "${pkgdir}/usr/share/pear/"
  cp -R extras/library/ZendX/ "${pkgdir}/usr/share/pear/"

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 bin/zf.sh "${pkgdir}/usr/bin/zf"
  install -D -m755 bin/zf.php "${pkgdir}/usr/bin/zf.php"
}

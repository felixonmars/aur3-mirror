# $Id$
# Maintainer: David Roheim <david dot roheim at gmail dot com>

pkgname=('magento2')
pkgver=2.0.0.0dev58
pkgrel=1
arch=('any')
pkgdesc="Magento Community Edition v2 - PHP based e-commerce"
url='http://www.magentocommerce.com/'
license=('OSLv3')

source=("${pkgname}-${pkgver}.zip::https://github.com/magento/${pkgname}/archive/master.zip")
sha256sums=('bc7e2292a5aed8be25b8a38c666e3a0f09175557e8d714274bf8d3913158d12e')

depends=('php>=5.3.3' 'php-mcrypt' 'php-gd' 'mariadb-clients' 'curl')
optdepends=('redis')
options=(!strip)
install=${pkgname}.install

backup=("")

build() {
  cd ${srcdir}
  mv magento2-master ${pkgname}
}

package() {
  install -d -m755 ${pkgdir}/usr/share/webapps
  install -d -m755 ${pkgdir}/etc/webapps/${pkgname}
  
  install -D -m644 ${srcdir}/${pkgname}/LICENSE.txt     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"     || return 1
  install -D -m644 ${srcdir}/${pkgname}/LICENSE.html    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"    || return 1
  install -D -m644 ${srcdir}/${pkgname}/LICENSE_AFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_AFL.txt" || return 1

  mv ${srcdir}/${pkgname}/.htaccess ${pkgdir}/etc/webapps/${pkgname}/htaccess
  mv $srcdir/$pkgname/app/etc $pkgdir/etc/webapps/${pkgname}
  mv ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps

  ln -s /etc/webapps/${pkgname}/etc ${pkgdir}/usr/share/webapps/${pkgname}/app/etc
  ln -s /etc/webapps/${pkgname}/htaccess ${pkgdir}/usr/share/webapps/${pkgname}/.htaccess
}

# Maintainer: Tomasz Cebula <tomaszc@o2.pl>

pkgname=mpm-itk
pkgver=2.4.7
pkgrel=2
pkgdesc="Running vhosts under separate UIDs/GIDs for Apache HTTP Server."
arch=('i686' 'x86_64')
url="http://mpm-itk.sesse.net/"
license=('APACHE')
depends=('apache>=2.4.7')
source=(http://mpm-itk.sesse.net/$pkgname-$pkgver-0$pkgrel.tar.gz)
md5sums=('241eddeef8d3931c6699a51d5d2169a7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-0${pkgrel}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-0${pkgrel}"
  install -m755 -d "${pkgdir}/usr/lib/httpd/modules"
  install -m755 .libs/mpm_itk.so "${pkgdir}/usr/lib/httpd/modules/mod_mpm_itk.so"
}

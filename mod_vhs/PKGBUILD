# Maintainer: Dan Vratil <vratil@progdansoft.com>

pkgname=mod_vhs
pkgver=1.0.32
pkgrel=1
pkgdesc="Apache module to configure LDAP-based virtual mass hosting"
arch=('i686' 'x86_64')
url="http://openvisp.fr/doku/doku.php?id=mod_vhs:intro"
depends=(libhome apache)
license=("apache")
source=("ftp://ftp.oav.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {

  cd ${srcdir}/${pkgname}
  
  apxs -c -L/usr/lib -lhome \
	  -I/usr/include -I/usr/include/home -I/usr/include/php -I/usr/include/php/Zend -I/usr/include/php/TSRM \
	  mod_vhs.c
}

package() {
  cd ${srcdir}/${pkgname}

  mkdir -p $pkgdir/usr/lib/httpd/modules
  apxs -i -S LIBEXECDIR=$pkgdir/usr/lib/httpd/modules mod_vhs.la

}

md5sums=('bccb58b68639c2ece2d6f0adc1628ec1')

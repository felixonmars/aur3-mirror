# Maintainer: Tim Hartman <tbhartman at gmail>
pkgname=php-openid
pkgver=2.2.2
pkgrel=1
pkgdesc="OpenID support for PHP"
arch=(any)
url="http://www.openidenabled.com/"
license=("APACHE")
depends=('php>=4.3.0' 'php-curl')
optdepends=('php-gmp: faster than PHP Bcmath extension'
            'mysql: data storage in MySQL'
            'postgresql: data storage in PostgreSQL'
            'sqlite3: data storage in SQLite'
            'php-pear: data storaage in any of the above databases')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openid/$pkgname/tarball/$pkgver")
install="${pkgname}.install"
md5sums=('f14bfe22b553936a5648dee1ca94455a')

package() {
  cd "${srcdir}/"
  mv "openid-${pkgname}-"* "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/lib/${pkgname}/"
  cp -r --preserve=all ./* "${pkgdir}/usr/lib/${pkgname}/"
  chown -R root:http "${pkgdir}/usr/lib/${pkgname}/Auth"
  chmod -R g+x "${pkgdir}/usr/lib/${pkgname}/Auth"

  mkdir -p "${pkgdir}/srv/"
  cd "${pkgdir}/srv"
  ln -s "../usr/lib/${pkgname}/Auth"  
  
}

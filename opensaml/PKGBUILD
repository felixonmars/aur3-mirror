# Maintainer: Kaiting Chen <kaitocracy@gmail.com>

pkgname='opensaml'
pkgver='2.4.3'
pkgrel='1'
pkgdesc='Security Assertion Markup Language (SAML)'
arch=('i686' 'x86_64')
url='http://shibboleth.net/downloads/c++-opensaml/'
license=('APACHE')

depends=('openssl' 'curl' 'log4shib'
  'xmltooling' 'xerces-c' 'xml-security-c')

md5sums=('368361d56992afafbc6f8190a77ffd53')
source=("${url}/$pkgver/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --disable-doxygen-doc
  make; make DESTDIR=$pkgdir install
}

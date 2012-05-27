# Maintainer: Kaiting Chen <kaitocracy@gmail.com>

pkgname='shibboleth-sp'
_pkgname='shibboleth'
pkgver='2.4.3'
pkgrel='1'
pkgdesc='Shibboleth2 Service Provider (Apache module)'
license=('APACHE')
url='http://shibboleth.net/'
arch=('i686' 'x86_64')
depends=('apache' 'openssl' 'log4shib'
  'opensaml' 'xmltooling'
  'xerces-c' 'xml-security-c')
backup=(
  'etc/shibboleth/shibboleth2.xml'
  'etc/shibboleth/accessError.html'
  'etc/shibboleth/httpd.conf'
  'etc/shibboleth/attribute-map.xml'
  'etc/shibboleth/attribute-policy.xml'
  'etc/shibboleth/bindingTemplate.html'
  'etc/shibboleth/console.logger'
  'etc/shibboleth/discoveryTemplate.html'
  'etc/shibboleth/globalLogout.html'
  'etc/shibboleth/localLogout.html'
  'etc/shibboleth/metadataError.html'
  'etc/shibboleth/native.logger'
  'etc/shibboleth/partialLogout.html'
  'etc/shibboleth/postTemplate.html'
  'etc/shibboleth/sessionError.html'
  'etc/shibboleth/shibd.logger'
  'etc/shibboleth/sslError.html'
  'etc/shibboleth/syslog.logger'
  'etc/shibboleth/upgrade.xsl')
source=("http://shibboleth.net/downloads/service-provider/latest/${pkgname}-${pkgver}.tar.gz" 'shibd.rc.d')
md5sums=('4152eeb80d878ff33f6015e3bcf19db1'
         '750a911d78df0e3a88cfb14983ecf1a2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-apache22 \
    --disable-doxygen-doc
  make; make DESTDIR=$pkgdir install

  install -Dm755 $srcdir/shibd.rc.d \
    $pkgdir/etc/rc.d/shibd

  mkdir -p $pkgdir/usr/share/$pkgname

  cd $pkgdir/etc/$_pkgname
  mv *.sh  $pkgdir/usr/share/$pkgname
  mv example-metadata.xml
    $pkgdir/usr/share/$pkgname
  mv *.pem $pkgdir/usr/share/$pkgname
  rm -rf apache.config apache2.config
  rm -rf *.dist shibd-*
  ln -s shibboleth2.xml shibboleth.xml
}

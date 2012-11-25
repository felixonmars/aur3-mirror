# Maintainer: Eric Renfro <erenfro@gmail.com>

pkgname=openais
pkgver=1.1.4
pkgrel=2
pkgdesc="The OpenAIS Standards Based Cluster Framework is an OSI Certified implementation of the Service Availability Forum  Application Interface Specification (AIS)."
arch=('i686' 'x86_64')
url="http://www.openais.org/"
license=('BSD')
depends=("corosync1")
source=(ftp://ftp:download@ftp.openais.org/downloads/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
source=(openais-1.1.4.tar.gz)
md5sums=('e500ad3c49fdc45d8653f864e80ed82c')
sha1sums=('c8fc8055bd9974253bc35051b51220da4a7e8ef6')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr        \
              --sysconfdir=/etc    \
              --localstatedir=/var
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  mkdir "${pkgdir}/etc/rc.d" || return 1
  mv "${pkgdir}/etc/init.d/openais" "${pkgdir}/etc/rc.d/openais" || return 1
  rm -r "${pkgdir}/etc/init.d" || return 1
}


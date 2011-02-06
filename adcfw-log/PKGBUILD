# Contributor: Nathan Owe <ndowens.aur at gmail>
pkgname=adcfw-log
pkgver=0.10.0
pkgrel=2
pkgdesc="A tool for analyzing firewall logs in order to extract meaningful information"
arch=('i686' 'x86_64')
url="http://adcfw-log.sourceforge.net/"
license=('GPL2')
depends=('perl')
source=(http://downloads.sourceforge.net/adcfw-log/${pkgname}-${pkgver}.tar.gz)
md5sums=('ef87de194d5a64e04b8d2553b3acad43') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man
  make 
  make DESTDIR=${pkgdir}/ install
}

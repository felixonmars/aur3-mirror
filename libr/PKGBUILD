# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=libr
pkgver=0.6.0
pkgrel=1
pkgdesc="Add icons to ELF files"
url="http://www.compholio.com/elficon/"
license=('LGPL2' 'LGPL3')
arch=(i686)
makedepends=('libtool')
depends=()
source=(http://ppa.launchpad.net/ehoover/compholio/ubuntu/pool/main/${pkgname}/${pkgname}/${pkgname}_${pkgver}~maverick.tar.gz)
md5sums=('2e060933a107fd9beb9194987bc470d9')

build() {
  install -d ${pkgdir}/usr

  cd ${srcdir}/${pkgname}-${pkgver}~maverick
  
  ln -s /usr/share/libtool/config/config.sub .
  ln -s /usr/share/libtool/config/config.guess .
  ./configure --prefix=${pkgdir}/usr || return 1
  make || return 1
  make install || return 1
}

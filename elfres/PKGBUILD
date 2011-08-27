# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=elfres
pkgver=0.4.2
pkgrel=1
pkgdesc="Add icons to ELF files"
url="http://www.compholio.com/elficon/"
license=('LGPL2' 'LGPL3')
arch=(i686)
makedepends=('libtool')
depends=('libr')
source=(http://ppa.launchpad.net/ehoover/compholio/ubuntu/pool/main/e/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('9f55d85fdfd951a43ca90a477ceb4de4')

build() {
  install -d ${pkgdir}/usr

  cd ${srcdir}/${pkgname}
  
  ln -s /usr/share/libtool/config/config.sub .
  ln -s /usr/share/libtool/config/config.guess .
  ./configure --prefix=${pkgdir}/usr || return 1
  make || return 1
  make install DESTDIR=${pkgdir}/usr || return 1
}

# Maintainer: fnord0 <fnord0 at riseup dot net>

pkgname=tcshrc
pkgver=1.6.2
pkgrel=1
pkgdesc="Configuration files for the enhanced version of the Berkeley C shell (csh)"
arch=('i686' 'x86_64')
url="http://tcshrc.sourceforge.net"
license=('GPL')
depends=('tcsh')
install=('tcshrc.install')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('1d16cfb163c3cd996a887557c6b59726')

build() {
  cd ${srcdir}/${pkgname}
  sed -i "s|/usr/share/tcshrc|${pkgdir}/usr/share/tcshrc|" Makefile || return 1
  sed -i "s|/usr/bin|${pkgdir}/usr/bin|" Makefile || return 1
  
  mkdir -p ${pkgdir}/usr/bin || return 1
  mkdir -p ${pkgdir}/usr/share/tcshrc || return 1
  make || return 1
  make backup || return 1
  make DESTDIR=${pkgdir} systeminstall || return 1
  for i in FAQ INSTALL README THANKS TODO VERSION; do
    /bin/install -D -m644 $i ${pkgdir}/usr/share/tcshrc/doc/$i
  done
  /bin/install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  cd ${srcdir}/${pkgname}/doc
  for o in tcshrc.pdf tcshrc.sgml tcshrc.ps; do
    /bin/install -D -m644 $o ${pkgdir}/usr/share/tcshrc/doc/$o
  done
  cp -R tcshrc ${pkgdir}/usr/share/tcshrc/html
}

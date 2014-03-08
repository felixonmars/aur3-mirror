# Maintainer: Fabiano Furtado - fusca < fusca14 *at* gmail *dot* com >

pkgname=pev
pkgver=0.70
pkgrel=3
pkgdesc='Command line based tool for PE32/PE32+ file analysis'
arch=('i686' 'x86_64')
url='http://pev.sourceforge.net/'
license=('GPL')
depends=('glibc' 'openssl' 'pcre')
#source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('425bdfabacbf314773c1655de44ebeed')

build() {
  cd "${srcdir}/${pkgname}"
  #./configure --prefix=/usr
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib
  install -d ${pkgdir}/usr/share/man/man1
  
  # Changes to correct hard coded destdir in Makefiles (bad practice from upstream)
  #sed -i "s|\$(DESTDIR)/\$(PREFIX)/bin|\$(DESTDIR)\$(PREFIX)/bin|" src/Makefile
  #sed -i "s|/usr/share/pev|${pkgdir}/usr/share/pev|" src/Makefile
  #sed -i "s|/usr/share/man/man1|${pkgdir}/usr/share/man/man1|" src/Makefile
  #sed -i "s|\$(DESTDIR)/\$(PREFIX)/lib|\$(DESTDIR)\$(PREFIX)/lib|" lib/libpe/Makefile

  #make DESTDIR=${pkgdir} install
  sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" src/Makefile
  sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" lib/libpe/Makefile
}

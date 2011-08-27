# Contributor: Thomas Bohn <thomas@bohnomat.de>
# Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=bibcursed
pkgver=2.0.1
pkgrel=4
pkgdesc="Cursed based BibTeX frontend"
arch=('i686' 'x86_64')
url="http://bibcursed.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=(http://downloads.sourceforge.net/bibcursed/${pkgname}_${pkgver}.tgz)
md5sums=('7645b7b7e3ff558d673a1ed6e2ebe99e')

build() {
      cd "${srcdir}/${pkgname}"
      make -f Makefile.ncurses
      install -Dm 755 bibcursed ${pkgdir}/usr/bin/bibcursed
      install -Dm 644 bibcursed.1 ${pkgdir}/usr/share/man/man1/bibcursed.1
      }

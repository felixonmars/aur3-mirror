# Maintainer: Semitsoglou-Tsiapos Dimitrios <madcatmk254<think>gmail<thinkharder>com>
# Contributor: maturain <maturain at _spam_gmail.com>
pkgname=grisbi-beta
_pkgname=grisbi
pkgver=0.9.5
pkgrel=1
pkgdesc="Personal financial management program"
arch=('i686' 'x86_64')
url="http://www.grisbi.org"
license=('GPL')
groups=('office')
conflicts=('grisbi' 'grisbi-git')
depends=('gtk2' 'libxml2' 'goffice')
optdepends=('libofx: used for ofx import')
source=(http://downloads.sourceforge.net/grisbi/grisbi%20unstable/$pkgver/grisbi-$pkgver.tar.bz2)
md5sums=('07fea78ae249880c54ecdd050d80fbcc')
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}


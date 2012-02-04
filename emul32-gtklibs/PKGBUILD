# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=emul32-gtklibs
pkgver=2.10.6.3
pkgrel=3
pkgdesc="Gentoo multilib GTK 1/2"
arch=(i686)
url="http://www.gentoo.org"
license=('GPL')
groups=emul32
depends=('emul32-xlibs' 'emul32-baselibs')
install=(emul32.install)
source=(ftp://ftp.ibiblio.org/pub/linux/distributions/gentoo/distfiles/emul-linux-x86-gtklibs-${pkgver}.tar.bz2)
md5sums=('40f2253d4f8952974e423675e7ff60df')

build() {
  cd $startdir/src
  rm *.tar.bz2
  cp -RPf $startdir/src/* $startdir/pkg
}

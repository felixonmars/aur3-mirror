# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=emul32-soundlibs
pkgver=2.5
pkgrel=3
pkgdesc="Gentoo multilib sound libraries"
arch=(i686)
url="http://www.gentoo.org"
license=('GPL')
groups=emul32
depends=('emul32-baselibs')
install=(emul32.install)
source=(ftp://ftp.ibiblio.org/pub/linux/distributions/gentoo/distfiles/emul-linux-x86-soundlibs-${pkgver}.tar.bz2)
md5sums=('dc247da8c5b9b83213e898e32fe4d0d8')

build() {
  cd $startdir/src
  rm *.tar.bz2
  cp -RPf $startdir/src/* $startdir/pkg
}

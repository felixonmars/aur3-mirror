# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Shiki <shiki@biomernok.hu>
pkgname=emul32-xlibs-64
pkgver=7.0
pkgrel=4
pkgdesc="Gentoo multilib X libraries for x86-64 ARCH"
arch=(x86_64)
url="http://www.gentoo.org"
license=('GPL')
groups=emul32
depends=('emul32-baselibs')
install=(emul32.install)
source=(ftp://ftp.ibiblio.org/pub/linux/distributions/gentoo/distfiles/emul-linux-x86-xlibs-7.0-r5.tar.bz2)
md5sums=('5c6bd3cd5efa00ad7a650a43f13b655e')


build() {
  cd $startdir/src
  rm *.tar.bz2
  cp -RPf $startdir/src/* $startdir/pkg
}

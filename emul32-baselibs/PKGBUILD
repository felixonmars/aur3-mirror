# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=emul32-baselibs
pkgver=2.5.5
pkgrel=3
pkgdesc="Gentoo multilib base libraries"
arch=(i686)
url="http://www.gentoo.org"
license=('GPL')
groups=emul32
# Yes, we need lib32-glibc. Too bad Gentoo doesn't distribute their 32-bit glibc in binary... :-)
depends=('emul32-compat' 'lib32-glibc')
install=(emul32.install)
source=(ftp://ftp.ibiblio.org/pub/linux/distributions/gentoo/distfiles/emul-linux-x86-baselibs-${pkgver}.tar.bz2)
md5sums=('e8058cbc5ef52c78dd92325ba216b9b3')

build() {
  cd $startdir/src
  rm *.tar.bz2
  cp -RPf $startdir/src/* $startdir/pkg
}

# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=emul32-compat
pkgver=1.0
pkgrel=3
pkgdesc="Gentoo multilib old libstdc++"
arch=(i686)
url="http://www.gentoo.org"
license=('GPL')
groups=emul32
install=(emul32.install)
source=(ftp://ftp.ibiblio.org/pub/linux/distributions/gentoo/distfiles/emul-linux-x86-compat-${pkgver}.tar.bz2)
md5sums=('ac439c666e1501e677211dbff915c406')

build() {
  cd $startdir/src
  rm *.tar.bz2
  cp -RPf $startdir/src/* $startdir/pkg
  # Remove libsmpeg to avoid collision with emul-sdl
  rm -f $startdir/pkg/emul/linux/x86/usr/lib/libsmpeg*
}

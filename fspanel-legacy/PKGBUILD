#Maintainer: jakob (hellwoofa [@]  arcor [.] de)
pkgname=fspanel-legacy
pkgver=0.7
pkgrel=2
pkgdesc="F***ing Small Panel. Old version with clock but not EWMH-compliant."
url="http://www.chatjunkies.org/fspanel"
arch=('i686')
license=()
depends=(libxpm)
source=(http://home.arcor.de/hellwoofa/fspanel-$pkgver.tar.gz patch.arch)
md5sums=('5f4d0cafd52a04fd7f174f084b3520b8' 'c5f72c221293f2e60c113e6cb002daad')

build() {
  cd $startdir/src/fspanel-$pkgver
  patch <../patch.arch Makefile
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp fspanel $startdir/pkg/usr/bin
}

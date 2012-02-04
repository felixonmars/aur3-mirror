# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=portmidi-newer
pkgver=200
pkgrel=1
pkgdesc="cross-platform midi port abstraction"
arch=('i686')
url="http://portmedia.sourceforge.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('portmidi')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/portmedia/portmidi/200/portmidi-src-200.zip" "http://www.akjmusic.com/packages/Makefile.portmidi")
noextract=()
md5sums=('26053a105d938395227bb6ae1d78643b' '0e5ca29f983be375334e5092ac399f6a') #generate with 'makepkg -g'

build() {
  unzip portmidi-src-$pkgver.zip
  cp Makefile.portmidi $srcdir/portmidi/pm_linux/Makefile
  cd "$srcdir/portmidi"
  make -f pm_linux/Makefile
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp pm_linux/libportmidi.a $pkgdir/usr/lib/
  cp porttime/libporttime.a $pkgdir/usr/lib/
  cp pm_common/portmidi.h $pkgdir/usr/include/
  cp porttime/porttime.h $pkgdir/usr/include/
}

# vim:set ts=2 sw=2 et:

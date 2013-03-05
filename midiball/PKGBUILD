# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=midiball
pkgver=v0
pkgrel=1
epoch=
pkgdesc="Midiball is a simple standalone musical application for Linux 
to generate midi events from the motion of a virtual ball. It uses Qt 
and ALSA midi API. It can be also used with the jack daemon."
arch=(any)
url="http://sourceforge.net/projects/midiball"
license=('GPL')
groups=()
depends=('qt4' 'alsa-lib' 'jack')
makedepends=()
checkdepends=()
optdepends=()
provides=(midiball)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/project/$pkgname/sources/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  qmake
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('1e40d02935ae222ef68f76bfc5b34655')

# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=fotowall
pkgver=0.9
pkgrel=3
pkgdesc="A tool for rendering collages from your favorite photos or pictures"
arch=('i686' 'x86_64')
url="http://www.enricoros.com/opensource/fotowall/"
license=('GPL')
depends=('qt4>=4.4')
source=(http://$pkgname.googlecode.com/files/Fotowall-$pkgver.tar.bz2)
sha256sums=('e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d')

build() {
  cd "$srcdir/Fotowall-$pkgver"
  sed -i '44c\#include <libv4l1-videodev.h>' 3rdparty/videocapture/VideoDevice.h
  qmake-qt4
  make
}

package() {
  cd "$srcdir/Fotowall-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

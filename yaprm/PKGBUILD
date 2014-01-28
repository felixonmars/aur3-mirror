# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=yaprm
pkgver=0.7.1
pkgrel=5
pkgdesc="A powerful modeller designed to seamlessly interact with the POV-Ray ray tracing renderer."
arch=(i686 x86_64)
url="http://sourceforge.net/p/yaprm/wiki/Home/"
license=('GPL')
depends=('povray' 'libgle' 'gdl2' 'gtkglextmm' 'ftgl' 'desktop-file-utils')
makedepends=('intltool')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/Y.A.P.R.M./Y.A.P.R.M.%20$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('965e14c739135bd32b33ab1452000d7d')

prepare() {
  cd $pkgname-$pkgver

  # include missing glu library
  export LIBS="-lGLU"

  # remove xdg-mime install
  sed -i "/xdg-mime/d" data/Makefile.*

  # remove disable deprecated on gtkmm
  sed -i '/GTKMM_DISABLE_DEPRECATED/d' configure
  sed -i '/thread_init/d' src/main.cc

  # add missing include
  sed -i '35i#include <unistd.h>' src/povdata/YPOVIniFileReader.cc
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make CXXFLAGS="$CXXFLAGS -fpermissive"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  install -Dm644 data/yaprm-yml_mime.xml "$pkgdir/usr/share/mime/packages/yaprm-yml.xml"
  install -Dm644 data/yaprm-ypm_mime.xml "$pkgdir/usr/share/mime/packages/yaprm-ypm.xml"
}

# vim:set ts=2 sw=2 et:

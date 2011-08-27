# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=kipi-plugins-slim
_origpkgname=kipi-plugins
pkgver=0.3.0
pkgrel=1
pkgdesc="kipi plugins for digikam-slim and kde apps"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.kipi-plugins.org"
makedepends=('pkgconfig' 'cmake')
depends=('kdelibs' 'libkipi>=0.3.0' 'libkexiv2>=0.4.0' 'libkdcraw>=0.4.1' 'opencv' 'libgpod>=0.7.0')
provides=('kipi-plugins')
conflicts=('kipi-plugins')
source=("http://downloads.sourceforge.net/sourceforge/kipi/$_origpkgname-0.3.0.tar.bz2")
optdepends=('imagemagick: for picture manipulation')
md5sums=('6fa2c7dae38055fb50d90bad458c3412')

build() {
  cd $startdir/src/$_origpkgname-0.3.0
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  # fix compiling
  make
  sed -i -e 's|#include <phonon/Phonon::VolumeSlider>|#include <KDE/Phonon/VolumeSlider>|g' advancedslideshow/ui_playbackwidget.h || return 1
  make || return 1
  make DESTDIR=$startdir/pkg/ install
 }

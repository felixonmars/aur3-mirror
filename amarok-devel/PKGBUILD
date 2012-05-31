# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok-devel
_appname=amarok
pkgver=2.6beta1
_pkgver=2.5.90
pkgrel=1
pkgdesc="A media player for KDE - Unstable version"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2' 'FDL')
depends=('kdebase-runtime' 'mysql' 'qtscriptgenerator' 'taglib-extras'
        'liblastfm' 'ffmpeg' 'libofa')
makedepends=('pkgconfig' 'automoc4' 'cmake' 'libgpod' 'libmtp' 'loudmouth' 'libmygpo-qt')
optdepends=("libgpod: support for Apple iPod audio devices"
	"libmtp: support for portable media devices"
	"loudmouth: backend needed by mp3tunes for syncing"
    "ifuse: support for Apple iPod Touch and iPhone")
conflicts=('amarok')
provides=('amarok')
install="$pkgname.install"
source=("ftp://ftp.kde.org/pub/kde/unstable/$_appname/$_pkgver/src/$_appname-$_pkgver.tar.bz2")
md5sums=('15f84e226759958fb3e76ebf438c9fc7')

build() {
  mkdir build
  cd build
  cmake ../$_appname-$_pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}

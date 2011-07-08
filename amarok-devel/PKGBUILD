# Maintainer: A Rojas <nqn1976 @ gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=amarok-devel
_appname=amarok
pkgver=2.4.2beta1
_pkgver=2.4.1.90
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
install="${pkgname}.install"
source=("ftp://ftp.kde.org/pub/kde/unstable/${_appname}/${_pkgver}/src/${_appname}-${_pkgver}.tar.bz2")
md5sums=('07237410d5e793ac95f47d7c16a96555')

build() {
  cd ${srcdir}
  sed -i 's/s_pluginFrameworkVersion = 60/s_pluginFrameworkVersion = 61/' ${_appname}-${_pkgver}/src/PluginManager.cpp
  mkdir build
  cd build
  cmake ../${_appname}-${_pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

# Contributor: hbdee

pkgname=amarok-minimal
pkgver=2.6.0
pkgrel=1
pkgdesc="The powerful music player for KDE without integrated web services and default scripts."
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdebase-runtime' 'mysql' 'qtscriptgenerator' 'taglib-extras' 'ffmpeg')
makedepends=('pkgconfig' 'automoc4' 'cmake')
optdepends=("libgpod: support for Apple iPod audio devices"
	    "libmtp: support for portable media devices"
	    "loudmouth: backend needed by mp3tunes for syncing"
	    "ifuse: support for Apple iPod Touch and iPhone"
	    "libmygpo-qt: gpodder.net Internet Service"
	    "liblastfm: LastFM Internet Service"
	    "libofa: support for Audio Fingerprint"
	    "qjson: support for JSON"
	    "mesa: support for the Spectrum Analyzer")
conflicts=('amarok' 'amarok-devel' 'amarok-git' 'amarok-minimal-git')
provides=('amarok')
install="amarok.install"
source=("http://download.kde.org/stable/amarok/${pkgver}/src/amarok-${pkgver}.tar.bz2")
sha1sums=('2cfcdabb67436418ba0012075ba105bbb630b48d')

build() {
  cd "${srcdir}"

  # services
  sed -i '/amazon/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/magnatune/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/ampache/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/mp3tunes/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/jamendo/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/opmldirectory/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/LIBMYGPO_QT_FOUND/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/gpodder/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/LIBLASTFM_FOUND/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/lastfm/d' amarok-${pkgver}/src/services/CMakeLists.txt
  
  # scripts
  sed -i '/free_music_charts_service/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/librivox_service/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/radio_station_service/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/lyrics_lyricwiki/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  
  if [[ -d build ]]
  then
    rm -rf build
  fi
   mkdir build

  cd build
  cmake ../amarok-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_LibLastFm=OFF \
    -DWITH_MP3Tunes=OFF \
    -DWITH_Mtp=OFF \
    -DWITH_IPOD=OFF \
    -DWITH_LibOFA=OFF \
    -DWITH_QJSON=OFF \
    -DWITH_Mygpo-qt=OFF \
    -DWITH_SPECTRUM_ANALYZER=OFF
  make
}

package(){
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=amarok-minimal
pkgver=2.8.0
pkgrel=2
pkgdesc="The powerful music player for KDE stripped of integrated web services, applets, default scripts, extra languages, and iPod and media devices support."
arch=("i686" "x86_64")
url="http://amarok.kde.org/"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdebase-runtime' 'mariadb' 'qtscriptgenerator' 'taglib-extras' 'ffmpeg')
makedepends=('pkgconfig' 'automoc4' 'cmake') # Add 'libgpod', 'libmtp', 'loudmouth', 'libmygpo-qt', and/or 'clamz' if you require them.
optdepends=("libgpod: support for Apple iPod audio devices"
	    "libmtp: support for portable media devices"
	    "loudmouth: backend for Mp3tunes.com integration"
	    "openssl: Mp3tunes.com integration"
	    "ifuse: support for Apple iPod Touch and iPhone"
	    "libmygpo-qt: gpodder.net Internet Service"
	    "liblastfm: LastFM Internet Service"
	    "libofa: Open Fingerprint Architecture library for Musicbrainz and AmpliFIND"
	    "qjson: JSON parser for the Playdar Collection"
	    "clamz: support for downloading songs from Amazon.com"
	    "phonon-gstreamer: alternative backend supports Equalizer and Audio Analyzer Visualization Applet"
	    "kdemultimedia-audiocd-kio: Compact Disc(CD) support"
	    "taglib-1.9-or-higher: support of Opus files")
conflicts=('amarok' 'amarok-devel' 'amarok-git' 'amarok-minimal-git')
provides=('amarok')
install="amarok.install"
source=("http://download.kde.org/stable/amarok/${pkgver}/src/amarok-${pkgver}.tar.bz2")
sha1sums=('e76ccd53c05d57f9457d74cd08c2c41383c00937')

prepare() {

  # applets
  sed -i '/albums/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/currenttrack/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/info/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/labels/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/lyrics/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/photos/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/tabs/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/wikipedia/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/analyzer/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/upcomingevents/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/similarartists/d' amarok-${pkgver}/src/context/applets/CMakeLists.txt
  
  # engines
  sed -i '/current/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/info/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/labels/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/lyrics/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/photos/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/tabs/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/wikipedia/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/similarartists/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/upcomingevents/d' amarok-${pkgver}/src/context/engines/CMakeLists.txt
  
  # collections
  sed -i '/daap/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/audiocd/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/ipodcollection/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/mtpcollection/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/umscollection/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/playdarcollection/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/upnpcollection/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/nepomukconnection/d' amarok-${pkgver}/src/core-impl/collections/CMakeLists.txt
  
  # services
  sed -i '/amazon/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/magnatune/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/ampache/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/mp3tunes/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/jamendo/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/opmldirectory/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/gpodder/d' amarok-${pkgver}/src/services/CMakeLists.txt
  sed -i '/lastfm/d' amarok-${pkgver}/src/services/CMakeLists.txt
  
  # scripts
  sed -i '/free_music_charts_service/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/librivox_service/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/radio_station_service/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/lyrics_lyricwiki/d' amarok-${pkgver}/src/scripts/CMakeLists.txt
  
  # utilities
  sed -i '/amzdownloader/d' amarok-${pkgver}/utilities/CMakeLists.txt
  
  # languages
  sed -i '/(sr@ijekavianlatin)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(fi)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(el)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(ca@valencia)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(sr)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(sl)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(fr)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(zh_CN)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(de)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(sr@ijekavian)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(es)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(ca)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(pt)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(it)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(sv)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(et)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(lt)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(zh_TW)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(tr)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(da)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(sr@latin)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(en_GB)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(nb)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(ja)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(eu)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(nl)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(uk)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(lv)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(ru)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(ro)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(bs)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(cs)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(hu)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(pt_BR)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(gl)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(ga)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(pl)/d' amarok-${pkgver}/po/CMakeLists.txt
  sed -i '/(pa)/d' amarok-${pkgver}/po/CMakeLists.txt

  # documentation languages
  #sed -i '(en_US)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(de)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(es)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(pt)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(sv)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(et)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(nl)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(uk)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(ru)/d' amarok-${pkgver}/doc/CMakeLists.txt
  sed -i '/(pt_BR)/d' amarok-${pkgver}/doc/CMakeLists.txt
  
  if [[ -d build ]]
  then
    rm -rf build
  fi
   mkdir build
  
}

build() {

  cd build
  cmake ../amarok-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_LibLastFm=OFF \
    -DWITH_MP3Tunes=OFF \
    -DWITH_Mtp=OFF \
    -DWITH_IPOD=OFF \
    -DWITH_LibOFA=OFF \
    -DWITH_QJSON=OFF \
    -DWITH_Mygpo-qt=OFF \
    -DWITH_NepomukCore=OFF \
    -DWITH_Soprano=OFF \
    -DWITH_PLAYGROUND=OFF
  make
  
}

package(){

  cd build
  make DESTDIR="${pkgdir}" install
  
}

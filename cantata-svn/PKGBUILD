# Maintainer: hbdee <hbdee.arch@gmail.com>
# Contributor: Martin Blumenstingl <martin.blumenstingl [AT] googlemail.com>

pkgname=cantata-svn
pkgver=r5675
pkgrel=1
pkgdesc="Qt5 client for the music player daemon (MPD) - svn version."
arch=('i686' 'x86_64')
url="http://code.google.com/p/cantata/"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'libmtp' 'libcddb' 'libmusicbrainz5' 'mpg123' 'taglib-extras' 'hicolor-icon-theme' 'cdparanoia' 'speexdsp' 'media-player-info')
optdepends=('perl-uri: dynamic playlist'
            'mpd: playback')
makedepends=('subversion' 'cmake' 'qt5-tools' 'qt5-svg')
conflicts=('cantata' 'cantata-kde' 'cantata-kde-svn')
provides=('cantata')
source=("$pkgname::svn+http://cantata.googlecode.com/svn/trunk/")
install="${pkgname}.install"
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  if [[ -d build ]]
  then
    rm -rf build
  fi
   mkdir build
}

build() {
  cd "${srcdir}/build"

  cmake ../${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_HTTP_STREAM_PLAYBACK=ON \
    -DENABLE_KDE=OFF -DENABLE_QT5=ON

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

# Contributor: Flow

pkgname=simpleaudioplayer
pkgver=1.10.3
pkgrel=1
pkgdesc="SimpleAudioPlayers main task is quick and easy open some music files selected by a filemanager"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/SimpleAudioPlayer?content=133147"
depends=('kdebase-workspace')
install=simpleaudioplayer.install
license=('GPL')
source=(http://kde-apps.org/CONTENT/content-files/133147-simpleaudioplayer.tar.bz2)
makedepends=('cmake' 'automoc4')
md5sums=('3fa90e5bc08ccad11b814243189b2785')

build() {
  cd ${srcdir}/SimpleAudioPlayer-${pkgver}
  #Patch
  sed -e 's/update_xdg_mimetypes(${XDG_MIME_INSTALL_DIR})//' -i ${srcdir}/SimpleAudioPlayer-${pkgver}/CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -Daudiocd=1 -Drecord=1 -Dequalizer=1 -Dbrowser=1 -Dlyrics=1
}

package() {
  cd ${srcdir}/SimpleAudioPlayer-${pkgver}
  make -j3 install/strip
}

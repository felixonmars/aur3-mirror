# Maintainer: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>
#
pkgname=exmplayer
_pkgname=ExMplayer
pkgver=3.8.0
pkgrel=1
url='http://exmplayer.sourceforge.net/'
pkgdesc='MPlayer GUI with thumbnail seeking, 3D Video support, ...'
license=('GPL')
#
arch=('i686' 'x86_64')
depends=('mplayer')
#
provides=('exmplayer')
conflicts=('exmplayer-git')
install="${pkgname}.install"

source=("https://launchpad.net/~exmplayer-dev/+archive/exmplayer/+files/exmplayer_${pkgver}.tar.gz")
md5sums=('7aa7fa7e2b00e0ba68f04926aeabb613')

#prepare() {
#  cd "${_pkgname}"
#}

build() {
  cd "${_pkgname}/src"
  qmake-qt4
  make 
}

package() {
  cd "${_pkgname}"
  install -Dm755 src/exmplayer "$pkgdir"/usr/bin/exmplayer
  #
  install -dm755 "$pkgdir"/usr/share/applications
  install -m644 exmplayer.desktop exmplayer_enqueue.desktop "$pkgdir"/usr/share/applications
  install -Dm644 debian/exmplayer.png "$pkgdir"/usr/share/pixmaps/exmplayer.png
  #
  install -dm755 "$pkgdir"/etc/exmplayer
  install -m644 linux_build/{sc_default.xml,fmts} "$pkgdir"/etc/exmplayer
  #
  install -dm755 "$pkgdir"/usr/share/exmplayer
  # use native installed ffmpeg 
  ln -s /usr/bin/ffmpeg  "$pkgdir"/usr/share/exmplayer/ffmpeg
  # or bundled ffmpeg
  #install -m755 linux_build/ffmpeg "$pkgdir"/usr/share/exmplayer
}

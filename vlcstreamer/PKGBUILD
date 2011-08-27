# Maintainer: Andre Wayand <aur-vlcstreamer@awayand.sleepmail.com>
pkgname=vlcstreamer
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="helper for VLC to stream to iOS devices using Apple Store -VLC Streamer- client"
arch=('i686' 'x86_64')
url="http://hobbyistsoftware.com/vlcstreamer"
license=('GPL')
depends=('lib32-qt' 'qt' 'avahi' 'vlc-git')
source=(
  "http://download.hobbyistsoftware.com/Download/desktop?file=VLCStreamer/VLCStreamer_$pkgver.tar.gz"
)
md5sums=('c8a63bd94c9d4b2e1c1ba3e2eb504cad')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/bin"
  install -T VLCStreamerClient "${pkgdir}/usr/bin/vlcstreamer"

  mkdir -p "${pkgdir}/usr/share/doc/vlcstreamer"
  install README "${pkgdir}/usr/share/doc/vlcstreamer"
}

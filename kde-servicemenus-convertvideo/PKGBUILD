# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=kde-servicemenus-convertvideo
pkgver=0.1
pkgrel=1
pkgdesc="Convert video files to widescreen or fullscreen PAL or NTSC DVD format"
arch=('any')
url="http://www.kde-apps.org/content/show.php/Mencoder+and+FFMPeg+video+to+DVD+format?content=87577"
license=('GPL')
depends=('mplayer' 'ffmpeg')
conflicts=('convertvideo-servicemenu-kde4')
replaces=('convertvideo-servicemenu-kde4')
source=("http://www.kde-apps.org/CONTENT/content-files/87577-convert.desktop")
md5sums=('e94cd0524c74e1de6fc742841d3f2776')

package() {
  install -Dm644 87577-convert.desktop \
    "${pkgdir}"/usr/share/kde4/services/convertvideo.desktop
}

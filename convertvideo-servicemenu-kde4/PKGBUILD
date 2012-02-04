# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=convertvideo-servicemenu-kde4
pkgver=0.1
pkgrel=2
pkgdesc="Convert video files to widescreen or fullscreen PAL or NTSC DVD format."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/Mencoder+and+FFMPeg+video+to+DVD+format?content=87577"
license=('GPL')
depends=('mplayer' 'ffmpeg')
source=(http://www.kde-apps.org/CONTENT/content-files/87577-convert.desktop)

build() {

install -D -m644 $startdir/src/*-convert.desktop $startdir/pkg/usr/share/kde4/services/convertvideo.desktop

}
md5sums=('e94cd0524c74e1de6fc742841d3f2776')

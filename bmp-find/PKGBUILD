pkgname=bmp-find
_pkgname=beepfind
pkgver=0.5.2
pkgrel=2
pkgdesc="A beep-media-player plugin that allows quick search and play of a song in the playlist"
url="http://xmmsfind.sourceforge.net/"
license="GPL"
depends=('bmp' 'x-server')
source=("http://dl.sourceforge.net/xmmsfind/$_pkgname-$pkgver.tar.gz")
md5sums=('2910573d4d7509f4073a95928a6f4322')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  make || return 1
  make PREFIX=$startdir/pkg/usr PLUGIN_INSTALL_DIR=$startdir/pkg/usr/lib/bmp/General install
}

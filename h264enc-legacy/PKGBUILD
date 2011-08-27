# Contributor: Markus Heuser <markus.heuser@web.de>

pkgname=h264enc-legacy
pkgver=8.9.4
pkgrel=2
pkgdesc="Same as h264enc - without x264-git dependency."
arch=("i686" "x86_64")
url="http://h264enc.sourceforge.net/"
license=('GPL')
depends=('mplayer' 'x264' 'lsdvd' 'lame' 'bc')
optdepends=('mkvtoolnix' 'gpac' 'ogmtools')
source=(http://downloads.sourceforge.net/h264enc/h264enc-$pkgver.tar.gz)
md5sums=('5fc4bc5a6ff3da108fe720d4889a9603')

build() {
  cd $startdir/src/h264enc-$pkgver
  sed -i -e "s|/usr/local|$startdir/pkg/usr|g" \
        -e 's|usr/local/|usr/|g' install
  ./install
}

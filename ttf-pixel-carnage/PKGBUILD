# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-pixel-carnage
_realname=PixelCarnageMono
pkgver=1
pkgrel=1.2
pkgdesc="Pixel Carnage a Monospaced Bitmap Programming Font True Type Font"
arch=('any')
license=('custom')
url="http://www.proggyfonts.com/"
_url="http://www.proggyfonts.com/download/download_bridge.php?get="
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$_url$_realname.ttf.zip")

md5sums=('0fddf691a0a4aeec159e02a8a8be7293')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $startdir/pkg/usr/share/fonts/TTF/ || return 1
}

# Maintainer: archtux <antonio.arias99999@gmail.com

pkgname=totem-plugin-cue
pkgver=0.1
pkgrel=2
pkgdesc="Totem plugin that shows CUE Sheet for the currently playing file"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/totem-cue/"
license=('GPL2')
depends=('totem')
source=(http://kent.dl.sourceforge.net/project/totem-cue/totem-cue-$pkgver.tgz)
md5sums=('6e869062d4fe9143fc1f9d937ed81cb4')

build() {

  cd $srcdir
  mkdir -p $pkgdir/usr/lib/totem/plugins
  cp -R totem-cue/ $pkgdir/usr/lib/totem/plugins
}

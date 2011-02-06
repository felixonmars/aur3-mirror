# Maintainer: daniel g. siegel <dgsiegel@gmail.com>
pkgname="chaplin"
pkgver="1.10"
pkgrel=1
pkgdesc="A dvd chapter tool for Linux"
depends=('libdvdread' 'transcode' 'vcdimager' 'imagemagick' 'mjpegtools')
source=(http://www.lallafa.de/bp/files/$pkgname-$pkgver.tgz)

url="http://www.lallafa.de/bp/chaplin.html"
md5sums=('76971356e3c2aebaca45dc0780490c0a')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  install -D -m755 $startdir/src/$pkgname/chaplin $startdir/pkg/usr/bin/chaplin
  install -D -m755 $startdir/src/$pkgname/chaplin-genmenu $startdir/pkg/usr/bin/chaplin-genmenu
}

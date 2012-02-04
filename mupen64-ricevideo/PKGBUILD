# Contributor: sh__

pkgname=mupen64-ricevideo
pkgver=6.1.0
pkgrel=2
pkgdesc="Rice Video plugin for Mupen64"
arch=('i686')
url="http://www.emutalk.net/showthread.php?t=41037"
license=('GPL')
depends=('mupen64')
makedepends=('nasm')
source=('http://www.emutalk.net/attachment.php?attachmentid=36584&d=1181256094')
md5sums=('b5e62daf67599311d3fa2ae01a11539e')

build() {
  cd $startdir/src/
  tar -xjf 'attachment.php?attachmentid=36584&d=1181256094'
  cd RiceVideo610
  sed -i "s|-march=athlon|-march=native|" Makefile
  make || return 1
  install -D -m755 ricevideo.so $startdir/pkg/usr/share/mupen64/plugins/ricevideo.so
  install -D -m644 RiceVideo6.1.0.ini $startdir/pkg/usr/share/mupen64/plugins/RiceVideo6.1.0.ini
}

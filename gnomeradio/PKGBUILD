#Submitter: Ivan Rojas kirdux@gmail.com
#Maintainer: tritonas00 tritonas00@gmail.com

pkgname=gnomeradio
pkgver=1.8
pkgrel=6
pkgdesc="A FM-radio tuner for the GNOME desktop"
url="http://www.wh-hms.uni-ulm.de/~mfcn/gnomeradio"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libgnomeui' 'lirc' 'gconf' 'gnome-vfs' 'libgnome-media-old' 'gnome-doc-utils')
makedepends=('gettext' 'intltool')
source=(http://ftp.de.debian.org/debian/pool/main/g/gnomeradio/gnomeradio_1.8.orig.tar.gz)
md5sums=('26f07c432dffeebec3cc904f99295427')

build() {
  cd $startdir/src/$pkgname-$pkgver

  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi

  sed -i 's|linux/videodev.h|libv4l1-videodev.h|g' src/v4l1.c
  sed -i -e '49s|1|2|g' src/radio.c

  CFLAGS=-lm ./configure --prefix=/usr --disable-install-schemas
  make || return 1
}

package () { 
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mkdir $pkgdir/usr/share/pixmaps
  install data/icons/scalable/gnomeradio.svg $pkgdir/usr/share/pixmaps/gnomeradio.svg
}
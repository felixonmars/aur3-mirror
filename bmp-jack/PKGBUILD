# Contributor:  Johannes Sjolund <j.sjolund@gmail.com>

pkgname=bmp-jack
pkgver=0.19
pkgrel=1
pkgdesc="JACK output plugin for Beep Media Player"
url="http://xmms-jack.sf.net/"
arch=('i686')
license="GPL"
options=('!libtool')
depends=('libsamplerate' 'jack-audio-connection-kit' 'bmp')
makedepends=('glib' 'gtk')
source=(http://dl.sourceforge.net/sourceforge/xmms-jack/xmms-jack-$pkgver.tar.gz)
md5sums=('3e3ed2e3ca4a4ca558b43e1b8e3a83d5')

build() {
 cd $startdir/src/xmms-jack

 ./autogen.sh
 ./configure --prefix=/usr

 make -f Makefile.BMP clean || return 1
 make -f Makefile.BMP || return 1
 mkdir -p $startdir/pkg/usr/lib/bmp/Output
 make -f Makefile.BMP PLUGIN_DIR=$startdir/pkg/usr/lib/bmp/Output install

}

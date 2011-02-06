# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=bmp-crossfade
pkgver=0.3.11
pkgrel=2
pkgdesc="Beep Media Player plugin for crossfading, and continuous output."
url="http://www.eisenlohr.org/xmms-crossfade/"
license="GPL"
arch=('i686')
depends=('bmp' 'libsamplerate')
source=(http://www.eisenlohr.org/xmms-crossfade/xmms-crossfade-${pkgver}.tar.gz)
md5sums=('db8fea679d4178323baf5a2508602492')

build() {
  cd $startdir/src/xmms-crossfade-${pkgver}
  export PATH=$PATH:$startdir # for beep-config
  ./configure --prefix=/usr --enable-player=bmp \
		--disable-oss \
		--libdir=/usr/lib/bmp/Output
  make || return 1
  make DESTDIR=$startdir/pkg install
}

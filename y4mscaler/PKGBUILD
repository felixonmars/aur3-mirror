# Contributor: Tom K <tomk@runbox.com>
pkgname=y4mscaler
pkgver=9.0
pkgrel=2
pkgdesc="y4mscaler is a video scaler which operates on YUV4MPEG2 streams"
depends=('mjpegtools')
source=(http://www.mir.com/DMG/Software/$pkgname-$pkgver-src.tgz)
md5sums=('6b5d110aeacb22b865591e6203666195')
url="http://www.mir.com/DMG/Software/"
license="GPL"

build() {
  mkdir -p $startdir/pkg/usr/{bin,man/man1}

  cd $startdir/src/$pkgname-$pkgver

  sed -i -e "s:-mcpu=$CARCH:-O2 -pipe:g" Makefile
  sed -i -e 's:MJPEG_PREFIX = /usr/local:MJPEG_PREFIX = /usr:g' Makefile

  make || return 1

  cp y4mscaler $startdir/pkg/usr/bin
  cp y4mscaler.1 $startdir/pkg/usr/man/man1

  chmod 755 $startdir/pkg/usr/man/man1/y4mscaler.1
}

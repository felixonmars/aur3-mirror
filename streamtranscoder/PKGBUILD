pkgname=streamtranscoder
pkgver=1.2.8
pkgrel=1
pkgdesc="provide opportunities for broadcasters to support multiple types of formats/bitrates/samplerates for their streams"
arch=('i686' 'x86_64')
url="http://www.oddsock.org/tools/streamTranscoder/"
license=('custom')
makedepends=('gcc' 'libvorbis' 'curl' 'libmad' 'lame')
depends=('gcc' 'libvorbis' 'curl' 'libmad' 'lame')
md5sums=('9a046ff6aadc62df3598af11dac400b8')
source=(http://www.oddsock.org/tools/streamTranscoder/streamtranscoder-1.2.8.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir PREFIX=$pkgdir install || return 1

  install -d $pkgdir/usr/bin
  install -d $pkgdir/etc

  install -m 755 $srcdir/$pkgname-$pkgver/src/streamTranscoder.sh $pkgdir/usr/bin/streamTranscoder.sh
  install -m 644 $srcdir/$pkgname-$pkgver/src/transcoder.cfg $pkgdir/etc/streamtranscoder.cfg
}

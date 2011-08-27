pkgname=xmms-timidity
pkgver=0.1
pkgrel=2
pkgdesc="MIDI support in xmms with libTiMidity"
arch=('i686' 'x86_64')
url="http://libtimidity.sourceforge.net/"
license=('GPL')
depends=('libtimidity' 'xmms')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/libtimidity/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('c368ad9ebd9153d97cfdf56c0428bff6')
optdepends=('timidity-freepats: instrument samples which are compatible with timidity++')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure
	make || return 1
	make DESTDIR=${pkgdir} install

	msg "For MIDI playback with libTiMidity, you will need some \
instrument samples (see the timidity-freepats package)"
}

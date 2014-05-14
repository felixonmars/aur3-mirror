# Maintainer: Richard Jackson <rj@iinet.net.au>
pkgname=yweather
pkgver=0.1a
pkgrel=2
pkgdesc="A simple tray icon weather app"
arch=('i686' 'x86_64')
url="http://murga-linux.com/puppy/viewtopic.php?t=83598&search_id=1904935221"
license=('GPL')
depends=('gtk2' 'wget')
makedepends=('bacon')
source=("http://members.iinet.net.au/~rj/yweather-0.1a-src.tar.gz"
	yweather.diff)

md5sums=('83f8337e1d6c1f6e7d4cd5c66675b191'
         '12acb6a59acfee92bab42e52c7d8396c')

prepare() {
	cd $srcdir/$pkgname-0.1a-src
	patch -p1 < $srcdir/yweather.diff
}

build() {
	cd $srcdir/$pkgname-0.1a-src
	bacon -o -s -o -Os -o -fdata-sections -o -ffunction-sections -o -Wl,--gc-sections yweather.bac

}

package() {
	cd $srcdir/$pkgname-0.1a-src
	install -Dm755 yweather "$pkgdir/usr/bin/yweather"
	
}

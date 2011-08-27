# Contributor: Mateusz Herych <heniekk@gmail.com>
pkgname=lnkmusic
pkgver=0.2.22
pkgrel=1
pkgdesc="lnkMusic is a powerful and easy-to-use interface for MPD"
arch=('i686')
url="http://sourceforge.net/projects/lnkmusic/"
license=('GPL')
depends=('gambas2')
source=(http://downloads.sourceforge.net/sourceforge/lnkmusic/$pkgname-$pkgver-binary.tar.gz)
md5sums=('9b215d84e6c880f5162e031aae3b944d')

build() {
	cd $startdir/src/
	install -D -m 755 lnkmusic $startdir/pkg/usr/bin/lnkmusic
}

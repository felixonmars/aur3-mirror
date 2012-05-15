pkgname=chipw
pkgver=2.0.6
pkgrel=1
pkgdesc="An editor for Chip's Challenge levels."
url="http://www.microstupidity.com/chipw/"
arch=(i686 x86_64)
depends=(wxgtk)
optdepends=('tworld: for playtesting')
license=(GPL3)
source=(http://www.microstupidity.com/$pkgname/distfiles/$pkgname-$pkgver.tar.gz
        $pkgname.png
        $pkgname.desktop)
md5sums=('4816216cfb3a9168d1c93ce25e175b30'
         '786936509752b3a423e0e02a9b137a3a'
         '118f3f148527cfbce7eff41b1425288d')

build () {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package () {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	mkdir -p "$pkgdir"/usr/share/{applications,pixmaps}
	install -m644 ../$pkgname.desktop "$pkgdir/usr/share/applications/"
	install -m644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/"
}

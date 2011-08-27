# Contributor: Eric Forgeot < http://ifiction.free.fr > & swiftscythe
pkgname=tubularix
pkgver=0.5.1.7
pkgrel=1
pkgdesc="A game similar to Tetris with a tubular perspective."
arch=(i686 x86_64)
url="http://tubularix.sourceforge.net/"
license=('gpl')
depends=('qt')
source=(http://downloads.sourceforge.net/sourceforge/tubularix/$pkgname-$pkgver-src.tar.gz)
md5sums=('dbf28353592c6762f1e3bec9632d85ec')

build() {
  cd $srcdir/$pkgname-$pkgver
	qmake
	make || return 1
	install -D -m755 tubularix $pkgdir/usr/bin/tubularix || return 1
    install -Dm644 $srcdir/$pkgname-$pkgver/icons/tubularix.desktop $pkgdir/usr/share/applications/tubularix.desktop
	mkdir -p $pkgdir/usr/share/pixmaps
	cp $srcdir/$pkgname-$pkgver/icons/tubularix.png $pkgdir/usr/share/pixmaps/
}

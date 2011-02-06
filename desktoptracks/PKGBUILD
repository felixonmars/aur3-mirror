#Maintainer: kiefer <jorgelmadrid@gmail.com>


pkgname=desktoptracks
pkgver=0.1.2
pkgrel=4
pkgdesc="Record statistics about used applications"
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://code.google.com/p/desktoptracks/"
depends=('dbus' 'dbus-python' 'glibc' 'glib2' 'gtk2' 'fontconfig' 'pygtk' 'python2-gnomecanvas')
source=("http://dl.dropbox.com/u/162810/$pkgname-$pkgver.tar.gz" "$pkgname.desktop" "$pkgname.png")
md5sums=('ae1067c5888c37d215dc44dc2a62825d' '43a59f2676bf66609abfe3b583e6b77d' '35285114ac1c520429ef515055cdfb15')

build() {
	cd $srcdir/$pkgname-$pkgver
  	./autogen.sh
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1
	
	install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m 644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

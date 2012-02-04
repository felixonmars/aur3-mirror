pkgname=mmc-lin
pkgver=1.7.3
_pkgver=173
pkgrel=1
pkgdesc="Mobile Media Convertor"
url="http://www.miksoft.net/mobileMediaConverter.htm"
arch=('i686' 'x86_64')
license=('GPL')
[ "$CARCH" = "i686" ] && depends=('glibc' 'gtk2' 'libstdc++5' 'expat' 'ffmpeg' 'opencore-amr' 'mencoder')
[ "$CARCH" = "x86_64" ] && depends=('lib32-glibc' 'lib32-gtk2' 'lib32-libstdc++5' 'lib32-expat' 'ffmpeg' 'opencore-amr' 'mencoder')
install=mmc-lin.install
source=(http://www.miksoft.net/products/mmc-older/$pkgname-$_pkgver.tar.gz mmc.png mmc.desktop)
md5sums=('44e9b10746e46424ec6ca895bda5102b'
	 '6c0b039085a07df66c445261bead1837'
	 '83b5ca50caf3225a4d7e6d6e9eb8c247')

build() {
	mkdir -p $pkgdir/opt/MIKSOFT/MobileMediaConverter
	cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/opt/MIKSOFT/MobileMediaConverter
	# icon and .desktop file
	mkdir -p $pkgdir/usr/share/pixmaps/
	mkdir -p $pkgdir/usr/share/applications/
	install -D -m644 $srcdir/mmc.png $pkgdir/usr/share/pixmaps/
	install -D -m644 $srcdir/mmc.desktop $pkgdir/usr/share/applications/
}
# Contributor: Darren M < dar7272@gmail.com >
pkgname=yoda-soccer
pkgver=0.77
pkgrel=1
pkgdesc="A game with the gameplay and the style of Sensible World of Soccer (SWOS) or Kick Off."
arch=(i686 x86_64)
url="http://yodasoccer.sourceforge.net/"
license=('GPL')

if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-libxxf86vm')
else
        depends=('')
fi

source=(http://downloads.sourceforge.net/sourceforge/yodasoccer/yoda_soccer_077_lin.tar.gz)

md5sums=('c6b43940219856ef3161559b3ac53e3c')


build() {

	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin

	cp -fr $srcdir/yoda_soccer_077/* $pkgdir/usr/share/${pkgname}/

	echo "cd /usr/share/yoda-soccer/
./yoda_soccer" > $pkgdir/usr/bin/${pkgname}

	chmod +x $pkgdir/usr/bin/${pkgname}


	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/../${pkgname}.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}


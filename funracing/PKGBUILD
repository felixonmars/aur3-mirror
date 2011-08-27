# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=funracing
pkgver=3.1
pkgrel=2
pkgdesc="A 2D car game similar to burning metal 2d."
url="http://clement.s.pagesperso-orange.fr/"
license=('GPL')
arch=(i686 x86_64)
depends=('sdl' 'sdl_mixer' 'sdl_image')
source=(http://clement.s.pagesperso-orange.fr/ftp/FunRacing_3_1.zip)

md5sums=('770a4757b88feb4b26e78be4c808b42f')


build() {

	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin

	cd $srcdir/FunRacing_3_1/src
	gcc main.c funracing.c pixel.c -o funracing -L/usr/lib -lSDL -lSDL_mixer -lSDL_image -lpthread
	
	cp $srcdir/FunRacing_3_1/src/funracing $pkgdir/usr/share/$pkgname
	cp -fr $srcdir/FunRacing_3_1/data $pkgdir/usr/share/$pkgname
	cp -fr $srcdir/FunRacing_3_1/README $pkgdir/usr/share/$pkgname
	
	touch $pkgdir/usr/share/$pkgname/config.cfg
	chgrp games $pkgdir/usr/share/$pkgname/config.cfg
	
	echo "cd /usr/share/funracing/
./funracing" > $pkgdir/usr/bin/${pkgname}
	
	chmod +x $pkgdir/usr/bin/${pkgname}

	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/../${pkgname}.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}


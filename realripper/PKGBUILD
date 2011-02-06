# Maintainer: Wido <widomaker2k7 at gmail>

pkgname=realripper
pkgver=1.1
pkgrel=2
pkgdesc="An application to record a user-friendly manner in a stream Real files .ram rtsp://."
arch=('i686' 'x86_64')
url="http://www.loicp.eu/realripper/"
license=('GPL3')
depends=('wxpython>=2.8' 'python2' 'mplayer')
source=("http://pub.loicp.eu/realripper/$pkgname-$pkgver.tar.gz" "http://pub.loicp.eu/realripper/realripper_pixmap_path_fix.diff")
md5sums=('b87a946697a335d8266c0523cda8cb4b' 'f8a741c0caa020339597d6c78d93844b')

build () {
	cd $srcdir/$pkgname-$pkgver/
	patch -p0 < $startdir/realripper_pixmap_path_fix.diff
    # python2 fix
    for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done

	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$pkgname-$pkgver/realripper.py $pkgdir/usr/bin/realripper

	mkdir -p $pkgdir/usr/share/applications
	cp $srcdir/$pkgname-$pkgver/realripper.desktop $pkgdir/usr/share/applications/

	mkdir -p $pkgdir/usr/share/doc/realripper
	cp $srcdir/$pkgname-$pkgver/Changelog $pkgdir/usr/share/doc/realripper/
	cp $srcdir/$pkgname-$pkgver/Copyright $pkgdir/usr/share/doc/realripper/
	cp $srcdir/$pkgname-$pkgver/README $pkgdir/usr/share/doc/realripper/

	mkdir -p $pkgdir/usr/share/man/man1/
	gzip -9 $srcdir/$pkgname-$pkgver/realripper.1
	cp $srcdir/$pkgname-$pkgver/realripper.1.gz $pkgdir/usr/share/man/man1/

	mkdir -p $pkgdir/usr/share/pixmaps
	cp $srcdir/$pkgname-$pkgver/realripper.png $pkgdir/usr/share/pixmaps/

	chmod 755 $pkgdir/usr/bin/realripper

}

# ORIGINAL Contributor: Ronny Radke <ronnymichaelradke at web point de>

pkgname=hourglass
orgname=Hourglass
pkgver=0.7.2
pkgrel=2
pkgdesc="Hourglass is a PSP (personal software process) time tracking utility written in Java. It allows you to track the time spent on various programming (or other) tasks, and provides reporting mechanisms for analyzing the use of your time."
url="http://hourglass.wiki.sourceforge.net/"
depends=('java-runtime')
source=(http://garr.dl.sourceforge.net/sourceforge/hourglass/hourglass-$pkgver.tar.gz
$pkgname
$pkgname.desktop
$pkgname.png)
provides=('hourglass')
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd $startdir/src

	mkdir -p $startdir/pkg/usr/share/java/$pkgname
	cp -R $pkgname-$pkgver/lib $startdir/pkg/usr/share/java/$pkgname/

	mkdir -p $startdir/pkg/usr/bin
	install -m 755 $pkgname $startdir/pkg/usr/bin/
	mkdir -p $startdir/pkg/usr/share/applications
	install -m 644 ../*.desktop $startdir/pkg/usr/share/applications/
	mkdir -p $startdir/pkg/usr/share/pixmaps
	install -m 644 ../*.png $startdir/pkg/usr/share/pixmaps/

}


md5sums=('dcf30e63034a79687138632a543e5477'
         '20e9e1537b8bfab61a5f47cb5b13217d'
         '26268147c640bf1b21f9229ea2e0cbb2'
         '4998556ded41addd38a5a51289bb23e6')

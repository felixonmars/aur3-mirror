# Contributor: sevenfourk <sevenfourk@gmail.com>

pkgname=abakus
pkgver=0.91
pkgrel=1
pkgdesc="Abakus is a simple calculator for KDE. Think of it as bc (the command-line calculator) with a nice GUI." 
url="http://purinchu.net/abakus/" 
depends=('qt')
source=(http://purinchu.net/abakus/$pkgname-$pkgver.tar.bz2) 
arch=('i686' 'x86_64')
license='GPL2' 

build() { 
     cd $startdir/src/$pkgname-$pkgver
     ./configure
     make || return 1

	install -D -m 775 -p $startdir/src/$pkgname-$pkgver/src/$pkgname $startdir/pkg/opt/kde/bin/$pkgname
	install -D -m 775 -p $startdir/src/$pkgname-$pkgver/src/abakus.desktop $startdir/pkg/opt/kde/share/applnk/Utilities/abakus.desktop
	install -D -m 775 -p $startdir/src/$pkgname-$pkgver/src/hi64-app-abakus.png $startdir/pkg/opt/kde/share/icons/hicolor/64x64/apps/abakus.png

}
md5sums=('56eaa5d98caa96973c09d62ae7da3061')

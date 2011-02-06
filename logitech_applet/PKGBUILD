# Contributor: heidi <heidi@heidi.linuxpl.com>
pkgname=logitech_applet
pkgver=0.4test1
pkgrel="2"
pkgdesc="Logitech Mouse Applet is a small command line tool for setting the special features that are available on some Logitech mice. It is particularly useful to those who want to switch their mouse to 800cpi instead of the default 400cpi."
url="http://freshmeat.net/projects/logitech_applet/"
makedepends=('gcc' 'make' 'libusb')
depends=('libusb')
source=(http://www.frogmouth.net/$pkgname-$pkgver.tar.gz logitech)

md5sums=('6f1a6bf11940efbdeb5d0ebff8c5a5c5' '42490543a140eb610e7b37eb5273ac0e')

build() {
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make prefix=$startdir/pkg/usr install
        install -D -m 755 $startdir/logitech  $startdir/pkg/etc/rc.d/logitech
} 

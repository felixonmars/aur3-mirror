# Contributor: Jan Jezek <honzin.jezek@gmail.com>

pkgname=xfce4-gvfs-mount
pkgver=0.0.4
pkgrel=1
pkgdesc="A small application that is meant to mount remote file systems only."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-gvfs-mount"
license=('GPL')
depends=('gtk2>=2.12' 'glib2>=2.16''libxfce4util')
source=("http://goodies.xfce.org/releases/$pkgname/$pkgname-$pkgver-6d2684b.tar.bz2")
md5sums=('5850d959e1cb62ef056eb2f574480f35')

build() {
	cd $startdir/src/$pkgname-$pkgver-6d2684b
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

}

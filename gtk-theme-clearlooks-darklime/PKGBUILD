pkgname=gtk-theme-clearlooks-darklime
pkgver=0.1
pkgrel=1
pkgdesc="Clearlooks-DarkLime theme for Clearlooks engine"
arch=('i686' 'x86_64')
url="http://art.gnome.org/themes/gtk2/1364"
license=('GPL')
depends=('gtk-engines')
source=(http://art.gnome.org/download/themes/gtk2/1364/GTK2-ClearlooksDarkLime.tar.gz)
md5sums=('200e6a847b0b54aef3f8e15bec1bc026')
build () {
	mkdir -p $pkgdir/usr/share/themes/
	cp -r $srcdir/Clearlooks-DarkLime $pkgdir/usr/share/themes/
}

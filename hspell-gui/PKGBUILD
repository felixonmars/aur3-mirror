# Contributor: Jack <nim901@gmail.com>
pkgname=hspell-gui
pkgver=0.2.6
pkgrel=1
pkgdesc="Hspell-gui is a graphical front end to hspell , a Hebrew spell checker and linguistic analyzer, using the gnome-2.0 graphics library."
depends=('gtk2' 'hspell' 'libgnome')
url="http://hspell-gui.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/hspell-gui/$pkgname-$pkgver.tar.gz)
md5sums=(681be043d21cae57d84970c8704c4ba2)

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make
make DESTDIR=$startdir/pkg install
}

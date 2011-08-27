# Contributor: Scott Cassidy <scottlc@cpan.org>
# Contributor: Joonas Niilola <juippis@roskakori.org>
# Maintainer: Lukasz Fidosz <virhilo@gmail.com>

pkgname=kdestyle-klearlook
pkgver=0.9.9.2
pkgrel=4
arch=(i686 x86_64)
license="GPL"
pkgdesc="KDE style based on the Clearlooks GTK2 theme."
url="http://www.kde-look.org/content/show.php?content=31717"
depends=('kdebase')
source=("http://www.kde-look.org/CONTENT/content-files/31717-klearlook-$pkgver.tar.bz2")
md5sums=('4d4784ad1e0c901ff8e7dfc9763254ae')

build() {
	cd $startdir/src/klearlook-$pkgver
	./configure --disable-debug --prefix=/opt/kde --with-qt-dir=/opt/qt
	make || return 1
	make prefix=$startdir/pkg/opt/kde install
}
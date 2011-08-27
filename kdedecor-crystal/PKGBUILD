#Contributor: vinz <vinz@archlinux.us>

pkgname=kdedecor-crystal
pkgver=1.0.7
pkgrel=1
arch=(i686 x86_64)
pkgdesc="KDE window decoration, with pseudo-transparent titlebar, buttons and borders"
url="http://www.kde-look.org/content/show.php?content=13969"
license="GPL"
depends=('kdebase')
makedepends=()
conflicts=('kwin-decor-crystal')
replaces=()
backup=()
install=
source=(http://www.kde-look.org/CONTENT/content-files/13969-crystal-$pkgver.tar.bz2)
md5sums=('07b426b929a41c5eee6fc7c686be632a')

build() {
        cd $startdir/src/crystal-$pkgver
         ./configure --prefix=`kde-config --prefix`
        make || return 1
        make DESTDIR=$startdir/pkg install
}



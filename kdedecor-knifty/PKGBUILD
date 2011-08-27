# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=kdedecor-knifty
pkgver=0.4.2
pkgrel=1
pkgdesc="Knifty is lightweight KDE 3.4.x Window Decoration"
url="http://www.kde-look.org/content/show.php?content=8841"
license="GPL"
depends=('kdebase')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.kde-look.org/content/files/8841-knifty-$pkgver.tar.bz2)
md5sums=('3cec48f3405b9605cae0275cd0077edc')

build() {
        cd $startdir/src/knifty-$pkgver
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}


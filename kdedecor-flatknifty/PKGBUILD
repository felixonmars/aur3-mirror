# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=kdedecor-flatknifty
pkgver=0.5
pkgrel=1
pkgdesc="flatKnifty is a window decoration for KDE based on Knifty"
url="http://www.kde-look.org/content/show.php?content=30483"
license="GPL"
depends=('kdebase')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.kde-look.org/content/files/30483-flatknifty-$pkgver.tar.bz2)
md5sums=('fa8860ea60a1d44378410fc161d6352b')

build() {
        cd $startdir/src/flatknifty-$pkgver
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}

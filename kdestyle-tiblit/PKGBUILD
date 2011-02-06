pkgname=kdestyle-tiblit
pkgver=1.2
pkgrel=2
pkgdesc="A lightweight KDE 3.4.x Style focused on customization"
url="http://www.kde-look.org/content/show.php?content=20798"
license="GPL"
depends=('kdebase')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.kde-look.org/content/files/20798-tiblit-$pkgver.tar.bz2)

build() {
cd $startdir/src/tiblit-$pkgver
./configure --disable-debug --prefix=/opt/kde
make || return 1
make DESTDIR=$startdir/pkg install
}
md5sums=('bbed2e80d9710cd3528e37b822f89ca6')

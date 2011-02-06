pkgname=kdedecor-pureline
pkgver=0.1
pkgrel=1
pkgdesc="Port of the Windows Visual Style by SwaySo (http://www.deviantart.com/deviation/24025352/) made with DecGen"
url="http://kde-look.org/content/show.php?content=30501"
license=""
depends=('qt')
makedepends=('kdelibs')
source=(http://mitglied.lycos.de/cswb/deco/pureline-$pkgver.tar.gz)
md5sums=('1351f16f1aaa1ff2dbc36ea32da814a1')

build() {
cd $startdir/src/pureline-$pkgver
./configure --prefix=/opt/kde
make || return 1
make prefix=$startdir/pkg/opt/kde install
}

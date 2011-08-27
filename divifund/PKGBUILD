pkgname=divifund
pkgver=0.6.2
pkgrel=1
pkgdesc="A finance manager that does what you want it to, and no more"
url="http://www.divifund.com/"
license="GPL"
depends=('gnome-python')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.divifund.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('5afb535c8fee00949c6e51d9c09cf416')

build() {
 cd $startdir/src/$pkgname-0.62
 ./install.py $startdir/pkg/usr
}

#contributor:Benjamin Wild <benwild@gmx.de>
pkgname=bpkg
pkgver=0.5
pkgrel=1
pkgdesc="distribution specific package creator"
url="http://swapoff.org/bpkg"
license="GPL-2"
depends=('bash' 'wget' 'installwatch')
source=(http://swapoff.org/files/bpkg/$pkgname-$pkgver.tar.gz)
md5sums=('be2fcc350a100ee70bd04b4e55c20e6e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg install-raw
}

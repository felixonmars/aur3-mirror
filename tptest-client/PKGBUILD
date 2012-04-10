# Contributor: Tim 'timtux' Jansson <timtux@gmail.com>
pkgname=tptest-client
pkgver=3.1.7
pkgrel=1
pkgdesc="Measure the speed of your Internet connection."
arch=(i686)
url="http://tptest.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=()
source=("http://downloads.sourceforge.net/project/tptest/tptest%20source/tptest%203.1/tptest-$pkgver.tar.gz")
md5sums=('46f941bdab738a2a11ecc2a5f757ec77')

build() {
  cd "$startdir/src/tptest-$pkgver/apps/unix/client/" &&
  make &&
  mkdir -p "$startdir/pkg/usr/bin" &&
  install -m755 tptestclient "$startdir/pkg/usr/bin"
}

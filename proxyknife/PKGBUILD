# Contributor: Valentin-Costel Haloiu <vially.ichb@gmail.com>

pkgname=proxyknife
pkgver=1.7
pkgrel=3
pkgdesc="A program mainly used to validate free proxies for the users behind firewall"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/proxyknife/"
license=('GPL')
source=("http://ftp.gnu.org/gnu/proxyknife/$pkgname-$pkgver.tar.gz" "texi2pod.patch")
md5sums=('13857e5b429c0b33db2fab6a1dd86977' 'bbe628aa6972977431a2cb041b629abb')

prepare() {
  patch "$srcdir/$pkgname-$pkgver/doc/texi2pod.pl.in" "$srcdir/texi2pod.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=$pkgdir/usr install
  mv $pkgdir/usr/etc $pkgdir/etc
}

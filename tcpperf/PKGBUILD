# Contributor: Orivej Desh <smpuj@bk.ru>
# Maintainer: Orivej Desh <smpuj@bk.ru>
pkgname=tcpperf
pkgver=1.754
pkgrel=1
pkgdesc="A simple network performance testing utility"
arch=("i686" "x86_64")
url="http://www.wand.net.nz/~stj2/nsc/software.html"
license=("custom:BEERWARE")
depends=("glibc")
source=("http://www.wand.net.nz/~stj2/nsc/files/tcpperf-1.754.tar.gz")
md5sums=('8d34cb6ba5fa196d536c78f1b134534b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  install -D tcpperf "$pkgdir/usr/bin/tcpperf" || return 1
  head tcpperf.c >LICENSE || return 1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}


# Maintainer:  Daniel YC Lin <dlin.tw@gmail.com>

pkgname=sockperf-svn
pkgver=244
pkgrel=1
pkgdesc='A benchmarking utility for measuring network performance (latency and throughput) over socket API, with focus on high performance systems'
url='https://code.google.com/p/sockperf'
license=('custom') # BSD-3
arch=('i686' 'x86_64')
source=("repo::svn+http://sockperf.googlecode.com/svn/branches/sockperf_v2")
md5sums=('SKIP')
depends=('bash' gawk )
pkgver() {
  cd repo
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}
build() {
  cd repo
  ./autogen.sh
  ./configure --prefix=/usr --enable-test --enable-doc --enable-tool
  make
}

package() {
  cd repo
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/share/sockperf # remove wrong place
  mkdir -p $pkgdir/etc
  mv $pkgdir/usr/etc/sockperf $pkgdir/etc/sockperf
  rm -rf $pkgdir/usr/etc
  # license
  install -D -m 644 copying "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 doc/man/man/man3/sockperf.3 $pkgdir/usr/share/man/man3/sockperf.3
}

# vim:set ts=2 sw=2 et:

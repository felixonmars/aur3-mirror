# Contributor: buergi <patbuergi@gmail.com>

pkgname=idleize
pkgver=2.0
pkgrel=1
pkgdesc="A tool to run a process during idle time (low load average) only"
arch=(i686 x86_64)
license=('unknown')
url="http://web.archive.org/web/20080709053307/http://www.pattosoft.com.au/jason/idleize/"
source=(http://web.archive.org/web/20070108035236/http://www.pattosoft.com.au/jason/idleize/$pkgname-$pkgver.tar.gz
        build.patch)
md5sums=('e885b00142be622b7749aa46e43ec03c'
         'bff1600ce9e0d7144950702c77779cf1')

build() {
  cd $pkgname-$pkgver
  patch -Np1 -i ${srcdir}/build.patch
  make
  gzip -f idleize.man
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 idleize "$pkgdir/usr/bin/idleize"
  install -D -m644 idleize.man.gz "$pkgdir/usr/share/man/man1/idlize.1.gz"
}

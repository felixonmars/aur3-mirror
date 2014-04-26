# Maintainer: Thomas Gessler <th.gessler at gmail dot com>

pkgname=vhdocl-git
pkgver=0.2.5.r0.g5b5cd6a
pkgrel=1
pkgdesc="VHDL documentation utility"
arch=('any')
url="http://www.volkerschatz.com/hardware/vhdocl.html"
license=('GPL3')
depends=('perl')
makedepends=('git')
source=("$pkgname"::'git+http://volkerschatz.com/repositories/vhdocl')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/$destdir\/man\/man1/$destdir\/share\/man\/man1/'\
      vhdocl-dist/install-vhdocl.pl
}

package() {
  cd "$srcdir/$pkgname"
  ./install-from-git.pl $pkgdir/usr
}

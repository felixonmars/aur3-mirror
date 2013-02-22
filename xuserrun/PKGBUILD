# submitter: Gen2ly <toddrpartridge@gmail.com>

pkgname=xuserrun
pkgver=1f18bda
pkgrel=1
pkgdesc="Run a command as the currently-active X.org server user"
arch=(any)
url="https://github.com/rephorm/xuserrun"
license=('GPL')
makedepends=('systemd')
conflicts=('xuserrun-git')
install=${pkgname}.install
changelog=
#source=(https://github.com/rephorm/$pkgname/tarball/master)
source=(${pkgname})
md5sums=('5db761fceda2c8a67f1a1f5e2d311a99')

package() {
  #cd "$srcdir/rephorm-$pkgname-$pkgver"
  #install -Dm755 "$srcdir/rephorm-$pkgname-$pkgver"/$pkgname \
  #$pkgdir/usr/bin/$pkgname
  install -Dm755 "$startdir"/$pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:

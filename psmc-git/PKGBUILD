# Maintainer: Bruno Vieira <mail@bmpvieira.com>

pkgname=psmc-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Infers population size history from a diploid sequence using the Pairwise Sequentially Markovian Coalescent (PSMC) model"
arch=('i686' 'x86_64')
url="https://github.com/lh3/psmc"
license=('MIT')
depends=('zlib')
makedepends=('git')
conflicts=('psmc')
provides=('psmc')
source=("$pkgname"::'git://github.com/lh3/psmc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 psmc "$pkgdir/usr/bin/psmc"
}
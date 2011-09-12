# Maintainer: Anselm Helbig <anselm.helbig+aur@googlemail.com>
pkgname=jscoverage
pkgver=0.5.1
pkgrel=1
pkgdesc="code coverage for JavaScript"
arch=('i686' 'x86_64')
url="http://siliconforks.com/jscoverage/"
license=('GPL2')
groups=()
depends=('python2' 'zip')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('strip')
install=
changelog=
source=($url/download/$pkgname-$pkgver.tar.xz)
noextract=()
md5sums=('a45574f3dd6f04b73f2308ec6fe17eed')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

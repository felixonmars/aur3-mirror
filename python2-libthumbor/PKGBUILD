# Maintainer: Eric Liu <eric@hnws.me>
pkgname=python2-libthumbor
relname=libthumbor
pkgver=1.1.0
pkgrel=1
pkgdesc="Python's extensions to thumbor. These are used to generate safe urls among others."
arch=('any')
url="https://github.com/thumbor/libthumbor"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
provides=('python2-libthumbor')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/thumbor/$relname/archive/$pkgver.tar.gz")
md5sums=('76d3414edb9be93510190fedcaea45a4')


package() {
  tar xzf "$pkgver.tar.gz"
  cd "$srcdir/$relname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

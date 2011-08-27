# Contributor: Ferenc Boldog <ferenc.boldog@gmail.com>
pkgname=stupidgit
pkgver=0.1.1
pkgrel=2
pkgdesc="A cross-platform git GUI with strong submodule support."
pkghash=8cf28d7
arch=('i686' 'x86_64')
url="http://github.com/gyim/stupidgit"
license=('MIT')
depends=('python>=2.6' 'wxpython>=2.8' 'git>=1.6')
source=(${pkgname}-${pkgver}.tar.gz::http://github.com/gyim/${pkgname}/tarball/v${pkgver})
md5sums=(eb530dd742498e88c091a8cdf0ef0936)

build() {
  msg "Starting build"
  cd "$srcdir/gyim-$pkgname-$pkghash"

  python setup.py install --root=${pkgdir} --prefix=/usr || return 1
}

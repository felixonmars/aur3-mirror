# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=rugg
pkgver=0.2.3
pkgrel=3
pkgdesc="Benchmark drives and filesystems, by writing simple to complex scenarios that can mimic the behaviour of real-world applications"
arch=('any')
url="http://rugg.sourceforge.net"
license=('GPL')
depends=('python2')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/Rugg-$pkgver.tar.gz)
md5sums=('893312f38f9e8bf508ca2391f51143bb')

build() {
  cd ${srcdir}/Rugg-$pkgver

  python2 setup.py install --root=${pkgdir}
}

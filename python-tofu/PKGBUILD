# Contributor: David 'wornaki' Lemma <wornaki@gmail.com>

pkgname=python-tofu
pkgver=0.5
pkgrel=2
pkgdesc="A high-level network game engine"
url="http://home.gna.org/oomadness/en/soya"
arch=(any)
license=('GPL')
depends=('python2' 'twisted' 'python-cerealizer')
changelog=Changelog
source=(http://download.gna.org/soya/Tofu-$pkgver.tar.bz2)
md5sums=('e38dfcc74b30adf62f05755b4255fa57')

build() {
  cd $srcdir/Tofu-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir
} 

# vim:set ts=2 sw=2 et:

# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=panda3d-samples
pkgver=1.8.1
pkgrel=1
pkgdesc="Code samples for Panda3D"
arch=('i686' 'x86_64')
url="http://www.panda3d.org/"
license=('BSD')
depends=('panda3d')
makedepends=('unzip')
install=panda3d-samples.install
source=(http://panda3d.org/download/panda3d-$pkgver/panda3d-$pkgver-samples.zip
panda3d-samples.install)
md5sums=('a7a6a158b895b58ddc17ec1e48354fff'
         'd5ab60031dad5abb911340d630780808')

build() {
  mkdir -p $pkgdir/opt/panda3d
  cp -r $srcdir/panda3d-$pkgver/samples $pkgdir/opt/panda3d/ || return 1
}

# vim:set ts=2 sw=2 et:


# Maintainer: Jonny Gerold <fsk141@gmail.com>

pkgname=vzpkg
pkgver=2.7.0
_patchver=18
pkgrel=2
pkgdesc="OpenVZ VPS package tools"
arch=('i686' 'x86_64')
url="http://openvz.org/"
license=('GPL')
depends=('yum')
makedepends=('gcc')
options=(!strip)
source=(http://download.openvz.org/template/utils/$pkgname/$pkgver-${_patchver}/src/$pkgname-$pkgver-${_patchver}.tar.bz2
        vzpkg-paths.patch)
md5sums=('3ce22962f7b1c82252948e7365ebc89f'
         '8f8623bfe1126ef2dd597b0cec3c919a')

build() {
  cd "$startdir/src/$pkgname-$pkgver-${_patchver}"

  patch -Np0 < ../vzpkg-paths.patch

  make DESTDIR="$startdir/pkg" install
}

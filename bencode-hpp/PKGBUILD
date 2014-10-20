# Maintainer: Vincenzo Giovanni Comito <clynamen@gmail.com>
pkgname=bencode-hpp
pkgver=20141001
pkgrel=1
pkgdesc="A C++ parser for bencoded data"
arch=('i686' 'x86_64')
url="https://github.com/jimporter/bencode.hpp"
license=('BSD')
makedepends=('git')
provides=('bencode-hpp')

_dir='bencode.hpp'
source=("${_dir}"::"git+https://github.com/jimporter/bencode.hpp")
md5sums=('SKIP')

build() {
  msg "no build to do"
}

package() {
  cd "${srcdir}/${_dir}"
  include_dir="${pkgdir}/usr/"
  mkdir $include_dir
  make PREFIX=$include_dir install
}


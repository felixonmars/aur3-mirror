# Maintainer: Allen Choong Chieng Hoon <allencch at hotmail dot com>
pkgname=mono-basic-git
_gitname=mono-basic
pkgver=a74642a
pkgrel=2
pkgdesc="Mono Visual Basic.NET"
arch=('any')
url="https://github.com/mono/mono-basic"
license=('MIT')
depends=('mono')
makedepends=('git')
source=("git+https://github.com/mono/mono-basic.git")
conflicts=("mono-basic")
provides=('mono-basic')
md5sums=("SKIP")

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  export MONO_SHARED_DIR="${srcdir}/weird"
  mkdir -p "${MONO_SHARED_DIR}"
  cd $_gitname
  
  # build mono
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}

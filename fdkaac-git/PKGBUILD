# Maintaner: PelPix <kylebloss[at]pelpix.info>

pkgname=fdkaac-git
pkgver=0.3.0.2f960ef
pkgrel=3
pkgdesc="Encoder frontend for libfdk-aac from GIT"
arch=('i686' 'x86_64')
url="https://github.com/nu774/fdkaac"
license=('custom')
depends=('libfdk-aac-git')
conflicts=('fdkaac')
provides=('fdkaac')
makedepends=('git')
source=("git://github.com/nu774/fdkaac.git")
_gitname="fdkaac"
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "$(cat version.h | grep version | cut -d '"' -f2).$(git log -1 --format="%h")"
}

build() {
  cd "${_gitname}"
  autoreconf -if
  ./configure --prefix=/usr --disable-rpath

  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}


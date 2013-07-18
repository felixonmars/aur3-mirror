# Maintainer: Yachi Lo <yaachi@gmail.com>
pkgname=pxz-git
_gitname=pxz
pkgver=20130718.eb3bb6b
pkgrel=1
pkgdesc="A compression utility that takes advantage of multiple cores and processes to do LZMA compression."
arch=(x86_64 i686)
url="https://github.com/jnovy/pxz"
license=('GPL2')
depends=(xz gcc-libs)
makedepends=('git')
conflicts=('pxz')
provides=('pxz')
source=(git+https://github.com/jnovy/pxz.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  GITREV=$(git describe --always|awk -F"-" '{print  $NF}')
  echo `date +%Y%m%d`.${GITREV}
}

build() {
  cd "$_gitname"
  make || return 1
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}

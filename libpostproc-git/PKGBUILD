#Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=libpostproc-git
pkgver=0.202.3b7053f
pkgrel=1
pkgdesc="A postprocessing library."
arch=('i686' 'x86_64')
url="http://git.videolan.org/?p=libpostproc.git"
license=('GPL2')
depends=('glibc')
makedepends=('git')
source=('libpostproc::git://git.videolan.org/libpostproc.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libpostproc"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "${srcdir}/libpostproc"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "${srcdir}/libpostproc"

  make DESTDIR="${pkgdir}/" install
}

pkgname=criterion-git
pkgver=v1.2.1.r0.g4a04a8a
pkgrel=1
pkgdesc="A KISS, non-intrusive C unit testing framework."
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/Criterion.git"
license=('MIT')
makedepends=('git')
provides=('criterion')
conflicts=('criterion')

source=("$pkgname"::"git://github.com/Snaipe/Criterion.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="$pkgdir/" install
}

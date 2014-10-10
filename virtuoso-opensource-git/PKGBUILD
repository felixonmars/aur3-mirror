# Maintainer: prash <prash dot n dot rao at gmail dot com>
pkgname=virtuoso-opensource-git
pkgver=v7.0.0.r1171.g2e95100
pkgrel=1
pkgdesc="Openlink Virtuoso opensource edition"
arch=('x86_64' 'i686')
url="https://github.com/openlink/virtuoso-opensource"
license=('GPL')
provides=('openlink-virtuoso')
conflicts=('openlink-virtuoso')
depends=('openssl' 'java-environment' 'imagemagick')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'flex' 'bison' 'gperf' 'gawk' 'm4' 'make')

_gitname='virtuoso-opensource'
source=("$pkgname"::'git://github.com/openlink/virtuoso-opensource.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/opt/${_gitname}/ --exec-prefix=/opt/${_gitname}/
  make -s -j2
}

package() {
  cd "$srcdir/$pkgname"
  make -s DESTDIR="$pkgdir" install
}

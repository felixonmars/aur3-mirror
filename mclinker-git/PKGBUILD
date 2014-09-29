# Maintainer: L <alaviss0 at gmail dot com>
pkgname=mclinker-git
_pkgname=mclinker
pkgver=2.9.0.r4308.cc2ce1f
pkgrel=1
pkgdesc="MCLinker is a UIUC license linkage editor"
arch=('x86_64' 'i686')
url="https://code.google.com/p/mclinker"
license=('custom:University of Illinois')
depends=('llvm')
source=('git+https://code.google.com/p/mclinker')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "%s.%s.%s.r%s.%s" \
  "$(grep -m1 MAJOR configure.ac | cut -d \= -f2)" \
  "$(grep -m1 MINOR configure.ac | cut -d \= -f2)" \
  "$(grep -m1 MICRO configure.ac | cut -d \= -f2)" \
  "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  export CPPFLAGS+=" -Qunused-arguments"
  export LDFLAGS+=" --rtlib=compiler-rt"
  ./autogen.sh
  ./configure --prefix=/usr --enable-optimized
  find -name Makefile -exec sed -r -e -i 's/-Werror//g' "{}" \;
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

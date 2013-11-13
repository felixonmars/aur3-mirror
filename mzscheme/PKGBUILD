
# Contributor: Martin Segoe <segoe@hotmail.es>
# Adapted from the drscheme package in extra.
# maintainer: perlawk

pkgname=mzscheme
pkgver=4.2
pkgrel=2
pkgdesc="Lightweight CLI subset of the PLT Scheme package."
arch=('i686' 'x86_64')
url="http://www.plt-scheme.org/software/mzscheme"
license=('LGPL')
depends=('gcc')
conflicts=('racket')
options=('!makeflags')
source=(http://download.plt-scheme.org/bundles/${pkgver}/mz/mz-${pkgver}-src-unix.tgz)
md5sums=('0ad90c102374be89e211533cebf2fb2f')

build() {
  cd "${srcdir}/mz-${pkgver}/src"
	sed -i 's/struct siginfo/siginfo_t/;' "$srcdir"/mz-4.2/src/mzscheme/gc2/sighand.c
  ./configure --prefix=/usr --enable-noopt || return 1
  make -j4 || return 1
}

package() {
  cd "${srcdir}/mz-${pkgver}/src"
  make DESTDIR="${pkgdir}" install || return 1
}


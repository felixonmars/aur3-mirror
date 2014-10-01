# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so> 
pkgname=pretrace
pkgver=r1.c445537
pkgrel=1
pkgdesc='Preload library that allows specified (dynamically linked) applications to always be executed under a debugging environment'
arch=('i686' 'x86_64')
url='http://freecode.com/projects/pretrace/'
license=('GPL2')
makedepends=('git' 'gcc' 'make' 'glibc')
provides=('pretrace')
source=('git+https://github.com/robholland/pretrace.git')
md5sums=('SKIP')
install='pretrace.install'

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr CFLAGS="-DARG_MAX=$(getconf ARG_MAX)" LDFLAGS=
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man"
  make PREFIX="${pkgdir}/usr" DOCDIR="${pkgdir}/usr/share/doc/pretrace" install
}
# vim:set ts=8 sts=2 sw=2 et:

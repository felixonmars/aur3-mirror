# Maintainer: Sergio Correia <sergio.correia@uece.net>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=valgrind-svn
_pkgname=valgrind
pkgver=r13779
pkgrel=1
pkgdesc="A tool to help find memory-management problems in programs"
arch=('i686' 'x86_64')
url="http://valgrind.org/"
license=('GPL')
depends=('glibc' 'perl')
makedepends=('gdb' 'svn')
provides=('valgrind')
conflicts=('valgrind')
source=("valgrind::svn://svn.valgrind.org/valgrind/trunk/")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}"/"${_pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}"/"${_pkgname}"

  ./autogen.sh

  if [[ "${CARCH}" = x86_64 ]]; then
    ./configure --prefix=/usr --mandir=/usr/share/man --enable-only64bit
  else
    ./configure --prefix=/usr --mandir=/usr/share/man
  fi

  make
}

check() {
  cd "${srcdir}"/"${_pkgname}"
  make check
}

package() {
  cd "${srcdir}"/"${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

# Contributor: FreakGuard
# Maintainer: Luva Bennati <lucak3 AT gmail DOT com>

pkgname=foma-svn
pkgver=141
pkgrel=1
pkgdesc="Compiler, programming language, and C library for constructing finite-state automata and transducers for various uses."
arch=('i686' 'x86_64')
url="http://code.google.com/p/foma/"
license=('GPL2')
depends=('readline' 'zlib')
makedepends=('subversion')
provides=('foma')
conflicts=('foma')

_svntrunk=http://foma.googlecode.com/svn/trunk/foma/
_svnmod=foma

build() {
  cd "${srcdir}"
  msg "Connecting to SVN server...."

  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  sed -i 's/ltermcap/lncurses/' Makefile
  make CFLAGS+=-fPIC
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make prefix="${pkgdir}/usr" install
  chmod 0644 "${pkgdir}/usr/lib/libfoma.a"
}

# vim:set ts=2 sw=2 et:

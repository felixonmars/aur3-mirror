# Contributor: Eric Belanger <eric@archlinux.org>
# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=kdiff3-svn
pkgver=126
pkgrel=1
pkgdesc="KDE file comparator/merge tool. SVN version"
arch=('i686' 'x86_64')
url="http://kdiff3.sourceforge.net/"
license=('GPL2')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'kdebase-lib' 'docbook-xml' 'subversion')
optdepends=('kdebase-lib: for the plugin')
provides=('kdiff3')
conflicts=('kdiff3')
install=kdiff3.install

_svntrunk=https://kdiff3.svn.sourceforge.net/svnroot/kdiff3/trunk/kdiff3
_svnmod=kdiff3

build() {
  cd "${srcdir}"
  msg "Connecting to SVN server...."

  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi
  msg "SVN checkout done or server timeout"

  msg "Configuring source..."
  mkdir -p build && cd build
  cmake "../${_svnmod}" \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

  msg "Starting build..."
  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:

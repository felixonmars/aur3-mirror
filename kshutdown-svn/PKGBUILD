# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgbase=kshutdown
pkgname=${_pkgbase}-svn
_basever=3.0
pkgver=3.0r720
pkgrel=1
pkgdesc='Shutdown Utility for KDE'
arch=('x86_64' 'i686')
url='http://kshutdown.sourceforge.net/'
license=('GPL')
conflicts=($_pkgbase)
replaces=($_pkgbase)
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
install="${_pkgbase}.install"
source=("${_pkgbase}::svn://svn.code.sf.net/p/kshutdown/code/trunk/kshutdown2")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  local ver="$(svnversion)"
  printf "${_basever}r%s" "${ver//[[:alpha:]]}"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "../$_pkgbase" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

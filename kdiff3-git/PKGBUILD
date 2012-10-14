# Contributor: Eric Belanger <eric@archlinux.org>
# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=kdiff3-git
pkgver=20121014
pkgrel=1
pkgdesc="KDE file comparator/merge tool. Git version"
arch=('i686' 'x86_64')
url="http://kdiff3.sourceforge.net/"
license=('GPL2')
depends=('kdebase-runtime')
makedepends=('git' 'cmake' 'automoc4' 'kdebase-lib' 'docbook-xml')
optdepends=('kdebase-lib: for the plugin')
provides=('kdiff3')
conflicts=('kdiff3' 'kdiff3-svn' 'kdiff3-svn')
install=kdiff3.install

_gitroot=git://git.code.sf.net/p/kdiff3/code
_gitname=kdiff3

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake "../$_gitname/$_gitname" \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

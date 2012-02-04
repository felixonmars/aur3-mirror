# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Lex Rivera <x-demon@x-demon.org>

pkgname=qutim-plugin-kde-integration-git
pkgver=20110904
pkgrel=1
pkgdesc="KDE4 integration for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim' 'kdelibs')
makedepends=('git' 'cmake')
optdepends=()
provides=()

_gitroot="git://gitorious.org/qutim/plugins.git"
_gitname="kdeintegration"

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

  #
  # BUILD HERE
  #

  cd ${_gitname}
  msg "Building and installing..." 
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "$srcdir/$_gitname-build"
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
}

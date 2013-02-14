# Contributor: Patrick Schwalm <patrick [dot] schwalm "at" googlemail {dot} com>
# Contributor: Renan Fernandes <renan "at" kauamanga {dot} com {dot} br>
# Manteiner: vicky91
# Maintainer: Fat Cat <carlos dot manuel250 at gmail dot com>

pkgname=bangarang-git
pkgver=20130214
pkgrel=1
pkgdesc="A KDE Media Player"
arch=('i686' 'x86_64')
url="http://bangarangkde.wordpress.com/"
license=('LGPL')
depends=('kdebase-runtime' 'taglib')
makedepends=('git' 'cmake' 'automoc4')
provides=('bangarang')
conflicts=('bangarang')
install=bangarang.install

_gitroot="git://anongit.kde.org/bangarang"
_gitname="bangarang"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install || return 1
}

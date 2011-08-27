# Maintainer: Rich Lane <rlane@club.cc.cmu.edu>

pkgname=risc-win32-git
pkgver=20110116
pkgrel=1
pkgdesc="A space fleet programming game - win32 installer"
arch=('i686' 'x86_64')
url="https://github.com/rlane/risc"
license=("GPL")
depends=()
makedepends=('pkgconfig' 'vala' 'mingw32-gcc' 'mingw32-glib2' 'mingw32-gtk2' 'mingw32-gtkglext' 'mingw32-glew' 'zip')

_gitroot="git://github.com/rlane/risc"
_gitname="risc"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
	git submodule init
	git submodule update

  ./autogen.sh && ./configure PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/" --host=i486-mingw32 --with-mingw32 && make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  echo "Installer will be left at /opt/risc-win32/risc-installer-win32.exe"
}

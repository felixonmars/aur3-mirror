# Maintainer: Nick Matvyeyev <mnasoft@gmail.com>

pkgname=terminal-card-games
pkgver=20130831
pkgrel=2
pkgdesc="Card games in terminal."
url="http://www.mnasoft.mksat.net"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('boost')
optdepends=()
makedepends=('git' 'cmake')
conflicts=()
replaces=()
backup=()

_gitroot='https://github.com/MNAS/Labs.git'
_gitname='Labs'
_gitsubdir='terminal-card-games'


build() {
  msg "srcdir...."
  echo ${srcdir}
  msg "srcdir...."
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]
  then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    msg "git clone ${_gitroot} ${_gitname}"
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cd "${_gitsubdir}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build/${_gitsubdir}/"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
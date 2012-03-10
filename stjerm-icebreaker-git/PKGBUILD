# Maintainer: bal <b.vajdics {at} gmail {dot} com>
pkgname=stjerm-icebreaker-git
_realname=stjerm
pkgver=20120307
pkgrel=1
pkgdesc="Enhanced fork of stjerm."
arch=('i686' 'x86_64')
url="https://github.com/icebreaker/stjerm"
license=('GPLv2')
depends=('vte>=0.16' 'gtk2>=2.10')
makedepends=('autoconf' 'pkg-config' 'git')
provides=('stjerm')
conflicts=('stjerm')

_gitroot=https://github.com/icebreaker/stjerm.git
_gitname=stjerm

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

  export LIBS=-lXinerama
  ./autogen.sh
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}

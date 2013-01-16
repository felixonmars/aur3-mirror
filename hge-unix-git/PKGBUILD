# Maintainer: demonicmaniac <namida1@gmx.net>
pkgname=hge-unix-git
pkgver=20130109
pkgrel=1
pkgdesc="A C/C++ library for creating hardware accelerated 2D games."
arch=(i686 x86_64)
url="http://code.google.com/p/hge-unix/"
license=('zlib')
depends=(sdl openal libpng libjpeg libvorbis)
makedepends=('git')
provides=('hge-unix' 'hge-unix-hg')
conflicts=('hge-unix' 'hge-unix-hg')

_gitroot=https://code.google.com/p
_gitname=hge-unix

build() {
  cd "$srcdir"
  msg "Connecting to git server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"/"$_gitname"
  fi

  msg "git checkout done or server timeout"
  msg "Starting build..."

  [ -d "$srcdir/$_gitname/build" ] && rm -rf "$srcdir/$_gitname/build"
  mkdir "$srcdir/$_gitname/build"
  cd "$srcdir/$_gitname/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SINGLE_LIB=ON ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/$_gitname/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

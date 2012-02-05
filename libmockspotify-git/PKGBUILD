# Maintainer: Marco Tuominen <marco at tuominen dot dy dot fi>
pkgname=libmockspotify-git
pkgver=20120205
pkgrel=1
pkgdesc="A mock of libspotify for use in development of language bindings."
arch=('i686' 'x86_64')
url="https://github.com/mopidy/libmockspotify"
license=('Apache')
provides=('libmockspotify')

_gitroot=git://github.com/mopidy/libmockspotify.git
_gitname=libmockspotify


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
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
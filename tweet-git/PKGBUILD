# Contributor: Andrea Cimitan <andrea.cimitan@gmail.com>

pkgname=tweet-git
pkgver=20080624
pkgrel=1
pkgdesc="A GNOME Twitter client using OpenGL with Clutter"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Tweet/"
license=('GPL')
depends=('clutter=0.6.4' 'clutter-cairo' 'clutter-gtk' 'gtk2' 'json-glib')
makedepends=('autoconf' 'automake' 'git' 'pkgconfig')
provides=('tweet')
conflicts=('tweet')
source=()
md5sums=()
install=tweet.install

_gitroot="git://github.com/ebassi/tweet.git"
_gitname="tweet"

build() {
  cd ${srcdir}

  if [ -d ${_gitname} ]; then
    (cd ${_gitname} && git-pull origin)
  else
    git clone ${_gitroot}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build
  cd ${_gitname}-build

  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}


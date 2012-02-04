# Contributor: Chrysalis <mindaxis[at]gmail[dot]com>

pkgname=libmpdclient-git
pkgver=20110220
pkgrel=1
pkgdesc="Library for interfacing Music Player Daemon (MPD)"
arch=('i686' 'x86_64')
url="http://mpd.wikia.com/wiki/ClientLib:libmpdclient"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('libmpdclient=2.5')
conflicts=('libmpdclient')
replaces=()
options=('!libtool')
install=
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://git.musicpd.org/master/libmpdclient.git"
_gitname="libmpdclient"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
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

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

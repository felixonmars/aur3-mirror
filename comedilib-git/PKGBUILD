# Contributor: Oscar Davila <odavilar at gmail dot com>
pkgname=comedilib-git
pkgver=20110720
pkgrel=1
pkgdesc="Comedilib is a user-space library that provides a developer-friendly interface to Comedi devices. Included in the Comedilib distribution is documentation, configuration and calibration utilities, and demonstration programs."
arch=('i686')
url="http://www.comedi.org"
license=('GPL')
groups=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://comedi.org/git/comedi/comedilib.git"
_gitname="comedilib"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# Contributor: Chrysalis <mindaxis[at]gmail[dot]com>
# Contributor: DarkJesus <priestoftimes[at]gmail[dot]com>

pkgname=libmpd-git
pkgver=20130318
pkgrel=1
pkgdesc="Signal based wrapper around libmpdclient"
arch=('i686' 'x86_64')
url="http://mpd.wikia.com/wiki/ClientLib:libmpd"
license=('GPL')
depends=('glib2')
makedepends=('git')
provides=('libmpd=11.8.90')
conflicts=('libmpd' 'libmpd-svn')
replaces=('libmpd')
options=('!libtool')
install=
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://git.musicpd.org/master/libmpd.git"
_gitname="libmpd"

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

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

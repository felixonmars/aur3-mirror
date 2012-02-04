# Contributor: Friedrich Weber <fred@reichbier.de>
pkgname=reia-git
pkgver=20090311
pkgrel=1
pkgdesc="A Ruby/Python-like scripting language for the Erlang virtual machine (BEAM)"
arch=('i686' 'x64')
url="http://reia-lang.org/"
license=('MIT')
depends=('erlang')
makedepends=('rake')
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/tarcieri/reia.git"
_gitname="reia"

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
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  patch -p1 -i ../../install.patch
  mkdir -p $pkgdir/usr/lib/erlang/lib
  mkdir -p $pkgdir/usr/share/licenses/reia
  cp LICENSE /usr/share/licenses/reia
  rake build || exit 1
  rake PREFIX="$pkgdir/usr" DESTDIR="$pkgdir/" install || exit 1
}

# Maintainer: Jan <jangingnicht@web.de>
# I am only maintaining this package. Bugs and suggestions should be directed to
# the original author here: https://github.com/syed/erlcscope.git
pkgname=erlcscope-git
pkgver=20130102
pkgrel=1
pkgdesc="Program which builds cscope database for erlang files"
arch=('any')
url="https://github.com/syed/erlcscope.git"
license=('custom')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=('erlcscope')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot="https://github.com/syed/erlcscope.git"
_gitname=erlcscope

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname" && git checkout-index -a -f --prefix="../$_gitname-build/" # do not copy over the .git folder
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make clean
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  if [ ! -d $pkgdir/usr/bin ]; then
    mkdir -p $pkgdir/usr/bin
  fi
  make DEST_BIN="$pkgdir/usr/bin" install
  if [ ! -f $pkgdir/usr/share/licenses/erlcscope/LICENSE ]; then
    mkdir -p $pkgdir/usr/share/licenses/erlcscope/
    cp LICENSE $pkgdir/usr/share/licenses/erlcscope/
  fi
}

# vim:set ts=2 sw=2 et:

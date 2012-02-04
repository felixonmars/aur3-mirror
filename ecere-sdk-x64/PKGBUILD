# Maintainer: Nick Markwell <nick@duckinator.net>
pkgname=ecere-sdk-x64
pkgver=git
pkgrel=1
pkgdesc="The Ecere SDK is a cross-platform toolkit for building software applications."
arch=('x86_64')
url="http://www.ecere.com/"
license=('BSD')
groups=()
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libpng' 'lib32-freetype2'
         'lib32-ncurses' 'lib32-giflib' 'lib32-libjpeg-turbo' 'lib32-zlib'
         'lib32-fontconfig' 'lib32-libxext' 'lib32-libxrender' 'lib32-mesa'
         'ttf-liberation' 'ttf-bitstream-vera')
makedepends=('git' 'gcc-libs-multilib' 'gcc-multilib' 'mesa')
provides=('ecere-sdk')
conflicts=('ecere-sdk')
replaces=()
backup=()
options=(!strip)
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/ecere/sdk.git"
_gitname="ecere-sdk"

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
  #git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build" --depth=1
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  rm -rf `find "$pkgdir" -type d -name ".git"`
}

# vim:set ts=2 sw=2 et:

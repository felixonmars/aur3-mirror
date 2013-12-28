# Maintainer: KISBread <kisbread@gmail.com>
pkgname=starruby-git
pkgver=0.3.3
pkgrel=1
pkgdesc="A 2D games Library for Ruby"
arch=('i686' 'x86_64')
license=('MIT')
depends=('git' 'fontconfig' 'freetype2' 'libgl' 'libpng' 'libogg' 'libvorbis' 'sdl' 'sdl_mixer' 'sdl_ttf' 'smpeg' 'zlib' 'glu' )
url="http://www.starruby.info/"
md5sums=('SKIP')

_gitroot="https://github.com/hajimehoshi/starruby.git"
_gitname="starruby"

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
  
  ruby ./extconf.rb
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

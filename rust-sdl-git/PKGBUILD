# Maintainer: Richard Harris <richardjharris@gmail.com>
pkgname=rust-sdl-git
pkgver=20130210
pkgrel=1
pkgdesc="SDL bindings for Rust"
arch=(i686 x86_64)
url="https://github.com/brson/rust-sdl"
license=('custom:MIT')
depends=('gcc-libs')
makedepends=('git' 'curl' 'rust' 'sdl')

_gitroot="git://github.com/brson/rust-sdl.git"
_gitname="rust-sdl"

build() {
  cd "$srcdir"
  msg "Connecting to git server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin && cd ..
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "git checkout done or server timeout"

  test -e $_gitname-build || git clone $_gitname{,-build}
  cd "$srcdir/$_gitname-build"
  git checkout master; git clean -dfX

  ./configure --prefix=/usr

  msg "Starting make..."
  make all check
}

package() {
  cd "$srcdir/$_gitname-build"

  install -d "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib/"
  install -m 644 libsdl-*.so "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib/"

  install --directory "$pkgdir/usr/share/licenses/rust-sdl-git/"
  install -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/rust-sdl-git/"
}


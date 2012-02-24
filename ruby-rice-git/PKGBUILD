# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=ruby-rice-git
pkgver=20120223
pkgrel=1
pkgdesc="A C++ interface to Ruby's C API"
arch=(i686 x86_64)
url="http://rice.rubyforge.org/"
license=('GPL')
groups=()
depends=('ruby')
makedepends=('git')
provides=('ruby-rice')
conflicts=('ruby-rice')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/jameskilton/rice.git
_gitname=rice

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
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

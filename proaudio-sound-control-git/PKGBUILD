# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=proaudio-sound-control
pkgname=$_name-git
pkgver=20111218
pkgrel=1
pkgdesc="A single-window mash-up of QJackCtl and QasMixer."
arch=(i686 x86_64)
url="https://gitorious.org/gabrbedd/ivory"
license=('GPL')
depends=('qt' 'jack' 'portaudio')
makedepends=('git' 'cmake')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"

_gitroot=git://gitorious.org/gabrbedd/$_name.git
_gitname=$_name

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

  mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build/bld"
  make DESTDIR="$pkgdir/" install

  # rm gz
  rm "$pkgdir/usr/share/man/man1/$_name.1.gz"
}

# vim:set ts=2 sw=2 et:

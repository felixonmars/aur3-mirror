# Maintainer: Eugene Nikolsky <pluton dot od at gmail dot com>

pkgname=clipit-git
pkgver=20120506
pkgrel=1
pkgdesc="Lightweight GTK+ clipboard manager (fork of Parcellite)"
arch=('i686' 'x86_64' 'mips64el')
url="http://clipit.rspwn.com/"
license=('GPL3')
depends=('gtk2' 'hicolor-icon-theme')
makedepends=('git' 'intltool')
optdepends=('xdotool: for automatic paste')
provides=('clipit')
conflicts=('clipit')
install='.install'

_gitroot='git://github.com/shantzu/ClipIt.git'
_gitname='clipit'
_gitbranch='1.4.3'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 --branch="$_gitbranch" "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:


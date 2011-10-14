
# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=pixasso-git
pkgver=20111014
pkgrel=1
pkgdesc="PiXasso is an easy-to-use LaTeX snippet manager"
arch=('i686' 'x86_64')
url="http://pixasso.sourceforge.net/"
install=pixasso.install
license=('GPL3')
depends=('gtkmm3>=3.2.0' 'poppler-glib' 'hicolor-icon-theme')
makedepends=('git' 'gnome-common')
provides=(pixasso)
conflicts=(pixasso)
install=pixasso.install

_gitroot=git://github.com/stfacc/pixasso.git
_gitname=pixasso

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

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

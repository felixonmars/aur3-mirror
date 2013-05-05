# $Id: PKGBUILD 170725 2012-11-10 05:22:37Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgbase=gdk-pixbuf2
pkgname=${pkgbase}-git
_realver=2.29.1
pkgver=2.29.0.1.gf4ce83a
pkgrel=1
epoch=1
pkgdesc="An image loading library"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL2.1')
depends=('glib2-git' "libpng>=1.6" "libpng<1.7" 'libtiff'
  "libjpeg>=8" "libjpeg<9" 'libx11')
makedepends=('gtk-doc' 'gobject-introspection-git')
options=('!libtool' 'strip' 'debug')
install=gdk-pixbuf2.install
provides=("$pkgbase=$_realver")
conflicts=("$pkgbase")

_gitname=gdk-pixbuf

_gitroot="http://git.gnome.org/browse/gdk-pixbuf"
_gitref=master

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  local outfile=/dev/null
  [[ -e /dev/tty ]] && outfile=/dev/tty
  (_fetch_git &> ${outfile})
  cd "$srcdir/$_gitname"

  git describe | sed -e 's/-/./g'
}

build() {
  (_fetch_git)
  cd "$srcdir/$_gitname/"

  ./autogen.sh --prefix=/usr \
    --without-libjasper \
    --with-x11 \
    --with-included-loaders=png
  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir" install
}

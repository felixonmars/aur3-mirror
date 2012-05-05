# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=gtk-vnc-git
pkgver=20120505
pkgrel=1
pkgdesc="A VNC viewer widget for GTK"
arch=(i686 x86_64)
url="http://www.gnome.org"
license=('LGPL')
provides=('gtk-vnc')
conflicts=('gtk-vnc')
options=('!libtool')
depends=('gtk3')
optdepends=('gtk2: GTK2 widget')
makedepends=('git' 'intltool' 'pygtk' 'pygobject2-devel' 'perl-text-csv' 'gtk-doc' 'gtk2')

_gitroot=git://git.gnome.org/gtk-vnc
_gitname=gtk-vnc

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

  rm -rf "$srcdir/$_gitname-build-gtk2"
  rm -rf "$srcdir/$_gitname-build-gtk3"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build-gtk2"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build-gtk3"

  (
    cd "$srcdir/$_gitname-build-gtk2"

    PYTHON=/usr/bin/python2 CFLAGS=-Wno-error ./autogen.sh --prefix=/usr \
        --with-python --disable-static --with-gtk=2.0
    make
  )

  (
    cd "$srcdir/$_gitname-build-gtk3"

    PYTHON=/usr/bin/python2 CFLAGS=-Wno-error ./autogen.sh --prefix=/usr \
        --with-python --with-examples --disable-static --with-gtk=3.0
    make
  )
}

package() {
  cd "$srcdir/"
  make -C $_gitname-build-gtk2 -j1 DESTDIR="$pkgdir/" install
  make -C $_gitname-build-gtk3 -j1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

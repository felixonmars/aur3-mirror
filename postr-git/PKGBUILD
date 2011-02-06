# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=postr
pkgname=postr-git
pkgver=20110203
pkgrel=1
pkgdesc="GNOME Flickr Uploader"
arch=('any')
url="http://projects.gnome.org/postr/"
license=('GPL')
depends=('dbus-python' 'python2-gconf' 'python2-libgnome' 'python2-gtkspell' 'twisted' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'gnome-common' 'intltool>=0.40.0' 'gnome-doc-utils>=0.3.2')
optdepends=('python-nautilus: nautilus extension')
provides=('postr')
conflicts=('postr')
install=$pkgname.install

_gitroot="git://git.gnome.org/postr"
_gitname="postr"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  sed -i 's@^#!.*python$@#!/usr/bin/python2@' postr

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               --disable-scrollkeeper \
               PYTHON=python2
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install

 # fix missing postr.glade file
  ln -s ../../../../share/postr/postr.glade "$pkgdir/usr/lib/python2.7/site-packages/postr/postr.glade"
} 

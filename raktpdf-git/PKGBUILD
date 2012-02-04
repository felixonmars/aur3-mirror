# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=raktpdf-git
pkgver=20100423
pkgrel=1
pkgdesc="A GTK+ based PDF viewer"
arch=('x86_64')
url="http://git.code-monkey.de/?p=raktpdf.git;a=summary"
license=('GPL')
depends=('poppler-glib')
makedepends=('git')
_gitroot="git://git.code-monkey.de/raktpdf.git"
_gitname="raktpdf"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"
  cd "$srcdir/${_gitname}-build/src"

  #
  # BUILD HERE
  #
  cp ../config.h .
  gcc -I. -DHAVE_CONFIG_H -c `pkg-config --cflags poppler-glib gtk+-2.0` \
    -o rakt-window.o rakt-window.c || return 1
  gcc -I. -DHAVE_CONFIG_H -c `pkg-config --cflags poppler-glib gtk+-2.0` \
    -o main.o main.c || return 1
  gcc `pkg-config --libs poppler-glib gtk+-2.0` \
    main.o rakt-window.o -o ${_gitname}  || return 1
  install -Dm755 ${_gitname} $pkgdir/usr/bin/${_gitname} || return 1
} 

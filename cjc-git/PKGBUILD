# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=cjc-git
pkgver=20110826
pkgrel=1
pkgdesc="Jabber client with text-based user interface resembling those known from popular IRC clients"
arch=('any')
url="http://cjc.jajcus.net/"
license=('GPL')
depends=('python-pyxmpp')
makedepends=('git')
conflicts=('cjc')
provides=('cjc')
source=()
md5sums=()

_gitroot=git://github.com/Jajcus/cjc.git
_gitname=cjc

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

  # python2 fix
  sed -i 's_python_python2_' Makefile
  for file in $(find . -name '*.py' -print) cjc.in; do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  sed -i 's#/usr/share/sgml/docbook/xsl-stylesheets/#/usr/share/xml/docbook/xsl-stylesheets-1.76.1/#' doc/Makefile

  sed -r 's@/usr/local@/usr@g' -i Makefile
  make DESTDIR=${pkgdir} install
}

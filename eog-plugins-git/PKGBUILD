# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgname=eog-plugins
pkgname=$_pkgname-git
pkgver=20110523
pkgrel=1
pkgdesc="Plugins for Eye of Gnome"
arch=('i686' 'x86_64')
url="http://www.gnome.org/"
license=('GPL2')
depends=('eog' 'libpeas' 'libchamplain' 'libexif' 'dconf')
makedepends=('git' 'intltool')
options=('!libtool')
provides=('eog-plugins')
conflicts=('eog-plugins')
install=$_pkgname.install

_gitroot="git://git.gnome.org/eog-plugins"
_gitname="eog-plugins"

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

  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

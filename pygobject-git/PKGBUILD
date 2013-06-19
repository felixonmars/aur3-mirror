# Contributor: Jan de Groot <jgc@archlinux.org>
# Adapted from ABS package
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pygobject-git
pkgver=3.9.2.2.g94167e1
pkgrel=1
pkgdesc="Python bindings for GObject - git version"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python2' 'glib2>=2.26.0' 'pycairo>=1.8.10' 'gobject-introspection>=0.10.2')
conflicts=('pygobject')
provides=('pygobject=$pkgver')
options=('!libtool')
url="http://www.pygtk.org/"
source=('git://git.gnome.org/pygobject')
md5sums=('SKIP')
_gitname="pygobject"

pkgver() {
  cd $srcdir/$_gitname
  echo $(git describe --always|sed 's+-+.+g')
}

build() {
  cd "$srcdir"/$_gitname

  export PYTHON=/usr/bin/python2
  # BUILD
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}

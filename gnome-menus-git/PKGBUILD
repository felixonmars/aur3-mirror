# Contributor: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=gnome-menus
pkgname=$_pkgname-git
pkgver=20130320
pkgrel=1
pkgdesc="GNOME menu specifications"
arch=('i686' 'x86_64')
depends=('glib2' 'python2-gobject')
makedepends=('intltool' 'gobject-introspection')
options=('!libtool')
license=('GPL' 'LGPL')
url="http://www.gnome.org"
conflicts=('gnome-menus')
replaces=('gnome-menus')
provides=('gnome-menus' 'gnome-menus=3.7.91')

_gitroot=git://git.gnome.org/gnome-menus
_gitname=gnome-menus

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  PYTHON=/usr/bin/python2 ./autogen.sh \
      --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var  --disable-static
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  rm -rf "$srcdir/$_gitname-build"
}

# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=libcroco
pkgname=$_pkgname-git
pkgver=20130320
pkgrel=1
pkgdesc="A CSS parsing library"
arch=('x86_64' 'i686')
depends=('glib2' 'libxml2')
makedepends=('intltool')
license=('LGPL')
options=('!libtool')
url="http://www.gnome.org"
conflicts=('libcroco')
replaces=('libcroco')
provides=('libcroco' 'libcroco=0.68')

_gitroot=http://git.gnome.org/browse/libcroco
_gitname=libcroco

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
  
  ./autogen.sh --prefix=/usr --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  rm -rf "$srcdir/$_gitname-build"
}

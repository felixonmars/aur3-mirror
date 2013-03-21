# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=libsecret
pkgname=$_pkgname-git
pkgver=20130320
pkgrel=1
pkgdesc='library for storing and retrieving passwords and other secrets.'
arch=('i686' 'x86_64')
license=('LGPL')
url="https://live.gnome.org/Libsecret"
depends=('glib2' 'libgcrypt')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection')
options=('!libtool')
conflicts=('libsecret')
replaces=('libsecret')
provides=('libsecret' 'libsecret=0.15')

_gitroot=http://git.gnome.org/browse/libsecret
_gitname=libsecret

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
  
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  rm -rf "$srcdir/$_gitname-build"
}

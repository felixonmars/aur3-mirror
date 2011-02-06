# Contributor: Matt Arsenault <arsenm2@rpi.edu>
pkgname=seed-git
pkgver=20100226
pkgrel=1
pkgdesc="Library and interpreter for JavaScript with GObject type system bindings."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Seed/"
license=('LGPL')
depends=('glib2' 'gnome-js-common' 'gobject-introspection' 'gir-repository' 'libwebkit' 'readline' 'libsoup')
makedepends=('git' 'autoconf' 'bison' 'python' 'libtool' 'pkgconfig'
'intltool' 'gtk-doc' 'gnome-common' 'gtk-doc')
optdepend=('mpfr')
provides=('seed' 'seed-git')
conflicts=('seed' 'seed-svn')
replaces=('seed-svn' 'seed')
backup=()
groups=()
options=(!makeflags docs)
install=seed.install
source=()
noextract=()
md5sums=()

_gitroot="git://git.gnome.org/seed"
_gitname="seed"

build() {
  cd $srcdir
  msg "Connecting to git.gnome.org GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Starting build"
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -rf $srcdir/$_gitname-build
}


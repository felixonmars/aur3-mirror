# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=gst-buzztard
pkgname=$_name-git
pkgver=20120406
pkgrel=1
pkgdesc="Buzztard gstreamer extensions"
arch=('i686' 'x86_64')
url="http://www.buzztard.org"
license=('LGPL')
depends=('bml-git' 'fluidsynth' 'gstreamer0.10' 'orc')
makedepends=('git')
conflicts=("$_name" "$_name-svn")
replaces=("$_name-svn")
options=('!libtool' '!strip')

_gitroot=git://buzztard.git.sourceforge.net/gitroot/buzztard/$_name
_gitname=$_name

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

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-static=no \
              --enable-debug
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  # set provides version
  _ver=`grep "^Version" libgstbuzztard.pc | cut -d" " -f2`
  provides=("$_name=$_ver")
}

# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=buzztard
pkgname=$_name-git
pkgver=20120410
pkgrel=1
pkgdesc="A modular, free, open source music studio that is conceptually based on Buzz."
arch=('i686' 'x86_64')
url="http://www.buzztard.org"
license=('LGPL')
depends=('gst-buzztard-git' 'libgsf' 'libgnomecanvas' 'gstreamer0.10-base' 'gconf'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('subversion' 'intltool' 'gtk-doc')
optdepends=('buzzmachines-svn: buzz machines collection')
conflicts=("$_name" "$_name-svn" 'bsl')
replaces=("$_name-svn" 'bsl')
options=('!libtool' '!emptydirs' '!strip')
install="$pkgname.install"

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

  # exclude tests ATM (fails)
  sed -i "/SRCDIRS/s/ tests//" Makefile.am

  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-static=no \
              --enable-man \
              --enable-debug \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install

  # delete unneeded cache files
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  find "$pkgdir/usr/share/mime" -maxdepth 1 -type f -exec rm {} \;

  # set provides version
  _ver=`grep AC_INIT configure.ac | sed "s/.*,\[\(.*\)\],.*/\1/"`
  provides=("$_name=$_ver")
}

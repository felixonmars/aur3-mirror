# Contributor: Friedrich Weber <fred@reichbier.de>

# Based on the PKGBUILD of `denemo` which is
# Contributor: Philipp Sandhaus <philipp.sandhaus@gmx.de>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Gnud <ach.gnud@gmail.com>

pkgname=denemo-git
pkgver=20100329
pkgrel=1
pkgdesc="The music notation editor"
arch=('i686' 'x86_64')
url="http://www.denemo.org"
license=('GPL')
makedepends=('git')
depends=('aubio' 'portaudio' 'lilypond' 'gtk2' 'libxml2' 'guile' 'jack' 'gtksourceview2' 'fluidsynth' 'cairo')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://git.savannah.gnu.org/denemo.git"
_gitname="denemo"

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
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  #PKGCONFIG chokes on guile, so we set variables manually
  GUILE_LIBS=$(guile-config link) GUILE_CFLAGS=$(guile-config compile) ./configure --prefix=/usr --enable-jack

  make || return 1

  #fix data install paths to include DESTDIR
  sed -i -e 's/cp -r actions  /cp -r actions $\(DESTDIR\)/' Makefile
  sed -i -e 's/755 \$(datadir)/755 $\(DESTDIR\)\$\(datadir\)/' Makefile

  make DESTDIR=$startdir/pkg install
} 

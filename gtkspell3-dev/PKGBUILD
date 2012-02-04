# Maintainer: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=gtkspell3-dev
pkgver=143
pkgrel=1
url="http://gtkspell.hg.sourceforge.net/hgweb/gtkspell/gtkspell/"
pkgdesc="Highlighting and replacement of misspelled words in a GtkTextView widget"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'enchant>=1.5.0')
makedepends=('intltool' 'gtk-doc' 'mercurial')
options=('!libtool')

_hgroot="http://gtkspell.hg.sourceforge.net:8000/hgroot/gtkspell/gtkspell"
_hgrepo="gtkspell"

build() {
  cd $srcdir
  msg "Connecting to the Mercurial repository..."

  if [[ -d $srcdir/$_hgrepo ]] ; then
      cd $_hgrepo
      msg "Cleaning working directory."
      hg status -in0|xargs -r0 rm
      hg update --clean
      msg "Updating local files."
      hg pull --update
      msg "The local files are updated."
  else
      hg clone "$_hgroot"
  fi

  msg "Mercurial checkout done"

  cd $srcdir/$_hgrepo

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $srcdir/$_hgrepo
  make DESTDIR="$pkgdir" install
}

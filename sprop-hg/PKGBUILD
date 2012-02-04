# Maintainer: Tom Vincent <http://www.tlvince.com/contact/>
pkgname=sprop-hg
pkgver=3
pkgrel=1
pkgdesc="sprop is a simple X property utility"
arch=('any')
url="http://tools.suckless.org/sprop"
license=('MIT')
makedepends=('mercurial')

_hgroot="http://hg.suckless.org/"
_hgrepo="sprop"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
} 

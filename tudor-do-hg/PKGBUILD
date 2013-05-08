# Maintainer: Bryan Bennett<bbenne10ATgmailDOTcom>
pkgname=tudor-do-hg
pkgver=5
pkgrel=1
pkgdesc="A lightweight run dialog that has a minimal feature set and resource footprint."
arch=('i686' 'x86_64')
url="http://www.bitbucket.org/darvid/tudor-do"
license=('BSD')
depends=('glibmm' 'gtkmm' 'gtk2' 'glib2')
makedepends=('mercurial')
install=tudor-do.install

_hgroot="http://www.bitbucket.org/darvid"
_hgrepo="tudor-do"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  install -D -m755 "tudor-do" "$pkgdir/usr/bin/tudor-do"
}

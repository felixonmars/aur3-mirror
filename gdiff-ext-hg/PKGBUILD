# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=gdiff-ext-hg
pkgver=1
pkgrel=1
pkgdesc="A Nautilus extension for launching file comparison tools"
arch=('i686' 'x86_64')
url="http://diff-ext.sourceforge.net/"
license=('BSD')
depends=('gnome-vfs' 'hicolor-icon-theme' 'nautilus>=2.14.0')
makedepends=('mercurial' 'intltool' 'pkgconfig>=0.9.0')
provides=('gdiff-ext')
conflicts=('gdiff-ext')
install=$pkgname.install

_hgroot="http://diff-ext.hg.sourceforge.net:8000/hgroot/diff-ext/gdiff-ext"
_hgrepo="gdiff-ext"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc --with-gconf-schema-file-dir=/usr/share/gconf/schemas --disable-schemas-install
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

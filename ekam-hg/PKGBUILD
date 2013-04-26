# Maintainer: zined <zined@adrianer.de>
pkgname=ekam-hg
pkgver=115.864f7155f940
pkgrel=2
pkgdesc="Build system that needs no rule files."
arch=('i686', 'x86_64')
url="http://code.google.com/p/ekam/"
license=('BSD')
makedepends=('mercurial')
provides=('ekam')

_hgroot=https://code.google.com/p/ekam/
_hgrepo=ekam

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

  ./bootstrap.sh
}

package() {
  cd "$srcdir/$_hgrepo-build"
  install -Dm0755 "$srcdir/$_hgrepo-build/bin/ekam" "$pkgdir/usr/bin/ekam"
}

# vim:set ts=2 sw=2 et:

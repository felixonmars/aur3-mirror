# Maintainer: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=vala-vapis-hg
pkgver=11
pkgrel=1
pkgdesc="Unofficial Vala vapi files"
arch=('any')
url="http://hg.youterm.com/vala-vapis/"
license=('unknown')
depends=()
makedepends=('mercurial' 'git' 'wget')
provides=('vala-vapis')
conflicts=('vala-vapis')

_hgroot="http://hg.youterm.com"
_hgrepo="vala-vapis"

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
  
  make sync
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

# Maintainer: William Robertson <nullptr@gmail.com
pkgname=b-hg
pkgver=82
pkgrel=1
pkgdesc='b is a command-line bug tracker for the Mercurial VCS.'
arch=('any')
url='http://www.digitalgemstones.com/projects/b/'
license=('GPL')
groups=()
depends=()
makedepends=('mercurial')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='b-hg.install'
source=()
noextract=()
md5sums=()

_hgroot='http://hg.digitalgemstones.com/hg'
_hgrepo='b'

build() {
  cd "$srcdir"
  msg 'Connecting to Mercurial server...'

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg 'The local files are updated.'
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg 'Mercurial checkout done or server timeout.'
  msg 'Starting build...'

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
}

package() {
  cd "$srcdir/$_hgrepo-build"
  install -o root -g root -d "$pkgdir/usr/lib/b-hg"
  install -o root -g root src/* "$pkgdir/usr/lib/b-hg"
}

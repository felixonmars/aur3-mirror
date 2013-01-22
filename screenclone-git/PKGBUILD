# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=screenclone-git
pkgver=20130120
pkgrel=1
pkgdesc="Clones a Xinerama screen to another X server. Useful for hybrid graphics (eg Nvidia Optimus)"
arch=(i686 x86_64)
url="https://github.com/liskin/hybrid-screenclone"
license=('GPL')
groups=()
depends=(gcc-libs libxdamage libxinerama libxtst libxcursor)
makedepends=('git')
provides=(screenclone)
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=git://github.com/liskin/hybrid-screenclone.git
_gitname=screenclone

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D screenclone "$pkgdir/usr/bin/screenclone"
}

# vim:set ts=2 sw=2 et:

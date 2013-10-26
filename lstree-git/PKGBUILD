# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=lstree-git
pkgver=0.1
pkgrel=1
pkgdesc="ls in tree form"
arch=('any')
url="http://github.com/ErkiDerLoony/lstree"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitroot=http://github.com/ErkiDerLoony/lstree.git
_gitname=lstree

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d -m755 "$pkgdir/usr/bin/"
  install -m755 lstree "$pkgdir/usr/bin/"
}

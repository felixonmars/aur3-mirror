# Maintainer: H.Gökhan Sarı <th0th@returnfalse.net>
pkgname=harmony-git
pkgver=20120902
pkgrel=1
pkgdesc="A music folder organizer with the help of ID3 tags"
arch=('any')
url="https://github.com/th0th/harmony"
license=('GPL')
depends=('python2' 'mutagen')
makedepends=('python2' 'git')

_gitroot=https://github.com/th0th/harmony
_gitname=harmony

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
  cd "$srcdir/$_gitname"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:

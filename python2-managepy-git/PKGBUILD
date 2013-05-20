# Maintainer: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python2-managepy-git
pkgver=20130519
pkgrel=1
pkgdesc="Human friendly CLI builder"
arch=('any')
url="https://github.com/Birdback/manage.py"
license=('GPL')
makedepends=('git')
depends=('python2-clint')

_gitroot=git://github.com/Birdback/manage.py.git
_gitname=managepy

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
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

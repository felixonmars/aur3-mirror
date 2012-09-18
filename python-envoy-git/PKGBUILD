# Maintainer: Andrew Kluger <gmail: evilgnome>

pkgname="python-envoy-git"
_pkgname="envoy"
pkgver=20120918
pkgrel=1
pkgdesc="Convenience wrapper around the subprocess module"
arch=('any')
url="https://github.com/kennethreitz/envoy"
license=('MIT')
depends=('python')
makedepends=('git')
options=(!emptydirs)

_gitroot="git://github.com/kennethreitz/envoy"
_gitname="envoy"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Running setup.py..."
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

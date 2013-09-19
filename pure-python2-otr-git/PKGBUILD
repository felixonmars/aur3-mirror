# Maintainer: strata <strata@dropswitch.net>
pkgname=pure-python2-otr-git
pkgver=20130918
pkgrel=1
pkgdesc="A pure python implementation of the OTR encryption protocol."
arch=('any')
url="https://github.com/afflux/pure-python-otr"
license=('LGPL3')
depends=('python2' 'python2-crypto>=2.1')
makedepends=('git')

_gitroot='git://github.com/afflux/pure-python-otr.git'
_gitname=pure-python-otr

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

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-build

  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:

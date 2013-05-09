# Maintainer: Anselm Helbig <aur@mnemonikk.org>
pkgname=python2-pysilc-git
pkgver=0.5
pkgrel=1
pkgdesc="Python Binding for SILC Toolkit"
arch=('i686' 'x86_64')
url="http://www.liquidx.net/pysilc/"
license=('BSD')
makedepends=('git')
depends=('python2' 'silc-toolkit')
options=(!emptydirs)

_gitroot=git://github.com/mnemonikk/pysilc.git
_gitname=pysilc

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

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

  python2 setup.py build --debug
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:

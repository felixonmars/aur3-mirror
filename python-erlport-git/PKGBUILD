# Maintainer: Garrett Smith <g@rre.tt>

pkgname=python-erlport-git
pkgver=20110912
pkgrel=1
pkgdesc="Erlang port protocol for Python"
arch=('any')
url="https://github.com/hdima/erlport"
license=('custom')
depends=('python2')
makedepends=('git python2 python2-distribute')
provides=('python-erlport')
conflicts=('python-erlport')

_gitroot="git://github.com/hdima/erlport.git"
_gitname="erlport"

build() {
  msg "Updating git repository..."
  cd "$srcdir"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  msg "Building package..."
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir" || return 1

  msg "Copying license..."
  licdir="$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$licdir"
  cp "$srcdir/$_gitname/LICENSE" "$licdir"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=python2-mongrel2
pkgver=1.7.5
pkgrel=1
pkgdesc="Python bindings for Mongrel2"
arch=('any')
url="https://github.com/zedshaw/mongrel2/tree/master/examples/python"
license=('BSD')
depends=('python2')
options=(!emptydirs)

build() {
  local _gitroot=https://github.com/zedshaw/mongrel2
  local _gitname=repo

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
  cd "$srcdir/repo/examples/python"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D $srcdir/repo/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

# Maintainer: Daniel Wallace <daniel.wallace@gatech.edu>
_pypkg=pygooglevoice
pkgname=python2-$_pypkg-hg
pkgver=54
pkgrel=1
pkgdesc="hg of python2-pygooglevoice"
arch=('any')
url="https://code.google.com/r/fracai-pygooglevoice2/"
license=('GPL')
depends=('python2')
makedepends=('mercurial' 'python2-distribute')
provides=(gvoice)
conflicts=(python-pygooglevoice)
replaces=(python-pygooglevoice)
options=(!emptydirs)
source=(settingspatch.diff)

_hgroot="http://pygooglevoice.googlecode.com/hg/"
_hgrepo="pygooglevoice"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
  patch -p1 -i "$srcdir/settingspatch.diff"
}

package() {
  cd "$srcdir/$_hgrepo-build"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('b7270f7fa797f064bc2590c66705d904')

# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=bpython-hg
pkgver=dev
pkgrel=1
pkgdesc="A fancy interface for the Python interpreter"
arch=('any')
url="http://www.bpython-interpreter.org/"
license=('MIT')
depends=('python-pygments')
makedepends=('mercurial')
provides=('bpython')
conflicts=('bpython')
_hgroot="https://bitbucket.org/bobf/bpython/"
_hgname="bpython"

build() {
  cd "$srcdir"
  msg "Connecting to mercurial server"
  if [ -d $_hgname ] ; then
    cd "$_hgname" && hg pull
    msg "Local files are updated"
  else
    hg clone "$_hgroot"
  fi
  msg "Mercurial checkout done or server timeout"
  cd "$srcdir"
  cp -r "$_hgname" "$_hgname-build"
  msg2 "Building..."
  cd "$_hgname-build"
  python setup.py build
}

package() {
  msg2 "Packaging..."
  cd "$_hgname-build"
  python setup.py install --root=$pkgdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

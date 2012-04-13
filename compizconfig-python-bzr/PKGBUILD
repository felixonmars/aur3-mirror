pkgname=compizconfig-python-bzr
pkgver=168
pkgrel=1
pkgdesc="Compizconfig bindings for python"
arch=('i686' 'x86_64')
url="https://launchpad.net/compiz-compizconfig-python"
license=('GPL')
depends=('libcompizconfig-bzr' 'glib2' 'python2')
makedepends=('intltool' 'pkgconfig' 'cython2')
provides=('compizconfig-python')
conflicts=('compizconfig-python')

_bzrtrunk=lp:compiz-compizconfig-python
_bzrmod=compiz-compizconfig-python

build() {
  cd "$srcdir"

  msg "Connecting to Launchpad..."
  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi
  msg "Bazaar checkout done or server timeout."

  rm -rf "$srcdir/$_bzrmod-build"
  msg "Creating build directory..."
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"
  
  python2 setup.py build
}

package() {
  cd "$srcdir/$_bzrmod-build"
  python2 setup.py install --prefix="/usr" --root="$pkgdir"
}

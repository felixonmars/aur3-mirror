_pkgbase=gevent
pkgname=python2-${_pkgbase}-hg
pkgver=2574
pkgrel=1
pkgdesc="Python networking library based on greenlet and libev."
arch=('i686' 'x86_64')
url="http://www.gevent.org/"
license=('MIT')
depends=('python2') 
conflicts=('python2-gevent')
provides=('python2-gevent')
makedepends=('mercurial' 'cython2')
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot=https://bitbucket.org/denis
_hgrepo=${_pkgbase}

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

  #
  # BUILD HERE
  #
  env LIBEV_EMBED=true CARES_EMBED=true CYTHON=cython2 PYTHON=python2 python2 setup.py build
}

package() {
  cd "$srcdir/$_hgrepo-build"
  python2 setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}

# vim:set ts=2 sw=2 et:

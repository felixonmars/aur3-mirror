# Contributor: Igor Scabini <furester@gmail.com>
pkgname=cython-devel
pkgver=727
pkgrel=1
pkgdesc="C-Extensions for Python"
arch=(i686)
url="http://www.cython.org"
license=('GPL')
depends=('python>=2.4')
provides=(cython)
conflicts=(cython)
source=()
md5sums=()

_hgrepo='cython-devel'
_hgroot="http://hg.cython.org/$_hgrepo"

build() {
  cd $srcdir

  msg "Connecting to $_hgrepo mercurial repository..."
  if [ -d "$_hgrepo/.hg" ]; then
    (cd $_hgrepo && hg pull -u -r $pkgver)
  else
    hg clone -r $pkgver $_hgroot || return 1
  fi

  msg "Mercurial clone finished"
  msg "Starting make..."

  cp -rT ${_hgrepo} ${_hgrepo}-build
  cd "${_hgrepo}-build"

  python setup.py install --root=$startdir/pkg || return 1
}
# vim: ts=2

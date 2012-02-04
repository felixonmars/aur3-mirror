# Maintainer: Mathieu Pasquet <mathieui@mathieui.net>
# Contributor: Mathieu Pasquet <mathieui@mathieui.net>

pkgname=python-dnspython-hg
pkgver=1
pkgrel=1
pkgdesc="A DNS toolkit for python"
arch=('any')
url="http://www.dnspython.org"
license=('BSD')
depends=('python')
makedepends=('setuptools' 'mercurial')

_hgrepo="dnspython"
_hgroot="http://hg.louiz.org/"

build() {
  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."

  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  python setup.py build
}

package() {
  cd "$srcdir/$_hgrepo-build"
  python setup.py install --root=$pkgdir/
}

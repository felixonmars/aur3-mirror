# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=python-pypeul-hg
pkgver=82
pkgrel=1
pkgdesc="A Python 3 IRC library thought for the programmer (hg version)"
arch=('any')
license=('GPL')
url="https://bitbucket.org/Zopieux/pypeul/"
makedepends=('mercurial' 'python-distribute')
depends=('python')
provides=('python-pypeul')
conflicts=('python-pypeul')

_hgroot=https://bitbucket.org/Zopieux/pypeul
_hgrepo=pypeul

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
}

package() {
  cd "$srcdir/$_hgrepo"
  python setup.py install --root="$pkgdir/" --optimize=1
}


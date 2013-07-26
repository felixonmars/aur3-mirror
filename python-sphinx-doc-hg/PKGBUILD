# Maintainer: William Giokas <1007380@gmail.com>

pkgname=python-sphinx-doc-hg
_pkgname="sphinx"
pkgver=1.2b1.r4226
pkgrel=1
pkgdesc='Documentation for python-sphinx'
url="http://sphinx.pocoo.org/latest/"
license=('GPL')
arch=(any)
makedepends=("python-sphinx-hg")

source=("hg+http://bitbucket.org/birkenfeld/sphinx")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _revno="$(hg id -n)"
  echo "$(hg log -r "$_revno" --template '{latesttag}' | sed 's/^v//;s/-/./g').r${_revno}"
}

build() {
  cd "$srcdir/$_pkgname"
  # Build docs using sphinx (hence the requirment for python-sphinx)
  sphinx-build -b man doc doc/_build/man
}

package() {
  # Install the manual pages to man1
  mkdir -p "$pkgdir"/usr/share/man/man1
  for i in "$srcdir/$_pkgname"/doc/_build/man/*.1; do
    install -D -m644 "$i" "$pkgdir"/usr/share/man/man1/"$(basename $i)"
  done
}

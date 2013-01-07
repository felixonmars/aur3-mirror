# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=python-orange-hg
pkgver=10392
pkgrel=2
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('i686' 'x86_64')
url="http://www.ailab.si/orange"
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-numarray' 'python-numeric' 'python2-matplotlib')
makedepends=('mercurial')
optdepends=('pyqwt: GUI support' 'python-networkx: Network module')
provides=('python-orange')
replaces=('python-orange-svn')
source=()
md5sums=()

_hgroot='https://bitbucket.org/biolab'
_hgrepo='orange'

build() {
  cd "$srcdir"
  #msg "Connecting to Mercurial server...."

  #if [[ -d "$_hgrepo" ]]; then
  #  cd "$_hgrepo"
  #  hg pull -u
  #  msg "The local files are updated."
  #else
  #  hg clone "$_hgroot" "$_hgrepo"
  #fi

  #msg "Mercurial checkout done or server timeout"
  #msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
  
  python2 setup.py build || return 1
}

package() {
  cd "${srcdir}/$_hgrepo-build"
  python2 setup.py install --root="${pkgdir}" || return 1
  
  find ${pkgdir} -name '*.py' | while read FILE; do
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
           -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
        "$FILE"
  done
}

# vim:set ts=2 sw=2 et:

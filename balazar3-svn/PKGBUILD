# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: rensel <rensel@email.it>
# Contributor: mar77i <mysatyre at gmail dot com>

pkgname=balazar3-svn
pkgver=153
pkgrel=3
pkgdesc="Balazar in the rancid skull dungeon!"
url="http://home.gna.org/oomadness/en/balazar_iii/index.html"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2' 'pyogg' 'pyvorbis' 'python2-soya' 'python2-cerealizer')
makedepends=('subversion')
conflicts=('balazar3')
provides=('balazar3')
[ "$CARCH" = "i686" ] && optdepends=('psyco (Used for speed optimization)')
source=()
md5sums=()

_svntrunk=svn://svn.gna.org/svn/balazar/trunk/balazarIII/balazar3/
_svnmod=balazar3

build() {

  #Grab the sources with svn
  cd "$srcdir"
  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver "$_svnmod"
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  [[ -d "$srcdir/$_svnmod-build" ]] && rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  sed -i 's@^#! /usr/bin/python -O$@#! /usr/bin/python2 -O@' balazar3

  #Build and install the package
  python2 setup.py build
  python2 setup.py install --root="$pkgdir"

}

# vim:set ts=2 sw=2 et:

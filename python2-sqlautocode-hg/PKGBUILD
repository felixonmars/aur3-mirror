# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Preston <pentie@gmail.com>

pkgname=python2-sqlautocode-hg
pkgver=82
pkgrel=1
pkgdesc="AutoCode is a flexible tool to autogenerate a model from an existing database."
arch=('any')
url="http://code.google.com/p/sqlautocode/"
license=('MIT')
#groups=()
depends=('python2')
makedepends=('mercurial' 'python2')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
#install=
#source=()
#md5sums=()

_hgroot=https://code.google.com/p/sqlautocode/
_hgrepo=" "

package() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    msg hg clone "$_hgroot" "$_hgrepo"
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python2-bitly-svn
pkgver=12
pkgrel=3
pkgdesc="A python wrapper around the bit.ly API"
arch=('i686' 'x86_64')
url="https://code.google.com/p/python-bitly/"
license=('GPL')
groups=()
depends=('python-simplejson')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://python-bitly.googlecode.com/svn/trunk/
_svnmod=python-bitly-read-only

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

}

package() {
  cd "$srcdir/$_svnmod-build"
  install -d "$pkgdir/usr/lib/python2.7/site-packages/bitly"
  install -m 644 bitly.py "$pkgdir/usr/lib/python2.7/site-packages/bitly.py"
}

# vim:set ts=2 sw=2 et:

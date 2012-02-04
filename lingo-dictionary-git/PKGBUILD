# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=lingo-dictionary-git
pkgver=63
pkgrel=1
pkgdesc="Dictionary application from the Elementary project"
arch=('i686' 'x86_64')
url="http://projects.minipenguin.com/projects/lingo"
license=('GPL')
depends=('libunique' 'json-glib' 'libsoup' 'libgee' 'sqlite3')
makedepends=('git' 'vala')

_bzrtrunk="lp:lingo-dictionary"
_bzrmod="lingo-dictionary"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting waf..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "$srcdir/$_bzrmod-build"
  ./waf install --destdir="$pkgdir/"
} 

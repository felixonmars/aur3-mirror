# Maintainer: L42y <423300@gmail.com>
pkgname=bzr-svn-bzr
pkgver=3219
pkgrel=1
pkgdesc="subversion foreign branch support for bazaar"
arch=('i686' 'x86_64')
url="http://bazaar-vcs.org/BzrForeignBranches/Subversion"
license=('GPL')
depends=('bzr>=2.0' 'tdb' 'subvertpy')
makedepends=('bzr')
conflicts=('bzr-svn')
source=()
md5sums=()

_bzrtrunk="https://code.launchpad.net/~bzr-svn/bzr-svn/trunk"
_bzrmod="bzr-svn"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"
}

package() {
  cd "$srcdir/$_bzrmod-build"
  python2 setup.py install --root=$pkgdir
} 

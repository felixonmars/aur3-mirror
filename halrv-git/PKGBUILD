# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: grey <grey271 at btinternet dot com>
pkgname=halrv-git
pkgver=20090223
pkgrel=1
pkgdesc="Command line tool to manage removable volumes using HAL"
arch=('i686' 'x86_64')
url="http://github.com/rg3/halrv/tree/master"
license=('GPL')
depends=('python>=2.5')
makedepends=('git')
provides=('halrv')

_gitroot="git://github.com/rg3/halrv.git"
_gitname="halrv"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  python setup.py install --root=${startdir}/pkg || return 1
}

# vim:set ts=2 sw=2 et:

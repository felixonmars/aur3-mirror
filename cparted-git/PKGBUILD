# Maintainer: David Campbell <davekong@archlinux.us>
pkgname=cparted-git
pkgver=20110319
pkgrel=1
pkgdesc="Curses based disk partition manipulation program"
arch=('any')
url="https://github.com/davekong/cparted"
install=cparted.install
license=('GPL')
depends=('python2' 'pyparted-git')
conflicts=('cparted')
makedepends=('git')
options=(!emptydirs)

_gitroot="git://github.com/davekong/cparted.git"
_gitname="cparted"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py build_scripts -e "/usr/bin/env python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# $Id: PKGBUILD 120115 2011-04-20 11:08:02Z ibiru $
# Maintainer: Patrick Louis <patrick at unixhub dot net>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Patcher    : Patrick Louis <patrick at unixhub dot net>
pkgname=mirage-patched-for-scroll
pkgver=20130330
pkgrel=1
pkgdesc="Mirage with a patch for better scrolling"
url="http://mirageiv.berlios.de"
license=("GPL")
depends=('pygtk' 'desktop-file-utils')
makedepends=('git')
arch=('i686' 'x86_64')
provides=('mirage')
conflicts=('mirage')
install=$pkgname.install
source=(mirage-patched-for-scroll.install)
md5sums=('e297b473f8fd1b6f26642da1d7206123')

_gitroot="git://github.com/venam/mirage-patched"
_gitname="mirage-patched"
_gitbranch="master"



build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ ! -d "$_gitname" ] ; then
    git clone "$_gitroot"
  fi

  cd "$_gitname"
  git pull origin "$_gitbranch"

  msg2 "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/mirage-0.9.5.2/"
    python2 setup.py build
}
package() {
    cd "$srcdir/$_gitname-build/mirage-0.9.5.2"
    python2 setup.py install --root="${pkgdir}"
}

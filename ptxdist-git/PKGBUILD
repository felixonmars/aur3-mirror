# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist-git
pkgver=20130224
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
makedepends=('git')
source=("ptxdist-python2.diff")
md5sums=('a9ec03a19f79ebafdfaf6c1095d67f24')
conflicts=('ptxdist')

_gitroot="git://git.pengutronix.de/git/ptxdist.git"
_gitname="ptxdist"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -p1 -i "${srcdir}/ptxdist-python2.diff"
  ./autogen.sh
  ./configure --prefix=/usr --with-python=python2
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}/" install
  local pkg_bindir=$(dirname "${pkgdir}"/$(readlink "${pkgdir}/usr/bin/ptxdist"))
  ln -s /usr/bin/python2 "${pkg_bindir}/python2"
}

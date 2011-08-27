# Contributor: Maël Leclair <mael.leclair@gmail.com>
pkgname=grisbi-git
pkgver=20101128
pkgrel=1
pkgdesc="Personal financial management program"
arch=('any')
url="http://www.grisbi.org"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme')
optdepends=('libofx: for OFX support')
makedepends=('git')
provides=('grisbi')
conflicts=('grisbi')
replaces=('grisbi')
options=(!libtool)
install=(grisbi.install)

_gitroot="git://grisbi.git.sourceforge.net/gitroot/grisbi/grisbi"
_gitname="grisbi"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull --rebase
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #build here
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

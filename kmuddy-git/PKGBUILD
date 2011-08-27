# Maintainer: Kevin Kyzer <kev@k3v.in>
pkgname=kmuddy-git
pkgver=20110406
pkgrel=1
pkgdesc="Mud client for KDE4"
arch=('i686' 'x86_64')
url="http://kmuddy.org"
license=('GPL')
depends=('kdelibs' 'kdebase-runtime')
makedepends=('git' 'automoc4' 'cmake')
provides=('kmuddy')
conflicts=('kmuddy')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/kmuddy"
_gitname="kmuddy"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  git clone $_gitroot

  msg "GIT checkout done."
  msg "Starting make..."

  cd $_gitname
  ./configure
  make
  make DESTDIR=$pkgdir install
}
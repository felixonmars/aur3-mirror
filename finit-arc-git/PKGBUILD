# Contributor: adriano <adriano.src@gmail.com>
pkgname=finit-arc-git
pkgver=20090511
pkgrel=1
pkgdesc="Fastinit reimplementation adapted for ArchLinux"
arch=('i686' 'x86_64')
url="http://www.obliquo.net"
license=('GPL2')
install=finit-arc.install
depends=('udev>=139-1')
makedepends=('glibc' 'git')
provides=('finit-arc')
conflicts=('finit-arc')
source=()
md5sums=()

_gitroot="git://github.com/obliquo/finit-arc.git"
_gitname="finit-arc"

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [ -d "$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg2 "Local files updated"
  else
    git clone $_gitroot
    msg2 "Git checkout done"
  fi

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Starting make..."

  make || return 1
  mkdir -p $startdir/pkg/etc
  mkdir -p $startdir/pkg/sbin
  mkdir -p $startdir/pkg/usr/sbin
  install -m0755 finit-arc $startdir/pkg/sbin/
  install -m0755 finittab $startdir/pkg/etc/
  install -m0755 stop-services.sh $startdir/pkg/usr/sbin/
}

# Maintainer: Joakim Hernberg <jbh at alchemy dot lu>
pkgname=rt-tests-git
pkgver=20121115
pkgrel=1
pkgdesc="A collection of tools for testing the -rt patched kernel"
arch=('i686' 'x86_64')
url="http://rt.wiki.kernel.org/"
license=('GPL2')
depends=('numactl')
makedepends=('git' 'python2')
provides=('rt-tests')
conflicts=('rt-tests')
_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git"
_gitname="rt-tests"

build() {
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
  sed 's/shell python/shell python2/g' -i Makefile

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make prefix=/usr DESTDIR="$pkgdir/" install
}
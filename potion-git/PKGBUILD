# Contributor: mr_chapendi <mr.chapendi@gmail.com>
pkgname=potion-git
pkgver=20100104
pkgrel=1
pkgdesc="Potion is an object- and mixin-oriented (traits) language."
arch=('i686' 'x86_64')
url="http://github.com/fogus/potion/"
depends=()
makedepends=('ragel')
license=('MIT')
source=()
md5sums=()

_gitroot="git://github.com/fogus/potion.git"
_gitname="potion"

build() {
  cd "$srcdir"
  msg "Connecting to the potion git repository..."

  if [ -d "$srcdir/$_gitname" ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  ./configure

  # Changing to build in arch
  for i in `find . -type f`
  do
    sed -i 's/-O0/-O2/g' $i
  done
  # It will not build correctly in parallel.
  make JIT=0 -j1 || return 1

  install -D bin/potion $pkgdir/usr/bin/potion
  install -D bin/greg $pkgdir/usr/bin/greg
  install -D lib/libpotion.so $pkgdir/usr/lib/potion/libpotion.so
  install -D lib/libuv.so.11.0.0 $pkgdir/usr/lib/potion/libuv.so.11.0.0
}

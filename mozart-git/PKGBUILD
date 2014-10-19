# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
# Contributer: Matt Beisser <beissemj(at)gmail(dot)com>
# Contributor: Stewart Mackenzie <setori88@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>

_pkgname=mozart
_gitstdname=mozart-stdlib
pkgname=mozart-git
pkgver=r14262.f7589b8
pkgrel=1
pkgdesc="The Mozart Programming System"
arch=('i686' 'x86_64')
url="http://www.mozart-oz.org"
license=('custom:X11style')
depends=('tk' 'emacs')

if test "$CARCH" == i686; then
  depends+=('gmp' 'gdbm')
fi

if test "$CARCH" == x86_64; then
  depends+=('gcc-multilib' 'gcc-libs-multilib' 'binutils-multilib' 'libtool-multilib' 'lib32-glibc' 'lib32-gmp' 'lib32-gdbm' 'lib32-zlib')
fi

options=('!makeflags')
source=("git://github.com/mozart/mozart.git"
    "git://github.com/mozart/mozart-stdlib.git"
    "mozart.profile")
md5sums=('SKIP'
         'SKIP'
         'cc4567bb8fad4a81da1903ee092a4886')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Fix for Tcl >= 8.6
  echo "#define USE_INTERP_RESULT 1" >> platform/wish/conf.h
}

build() {
  cd "$srcdir/$_pkgname"
  export BUILDTOP=$srcdir/$_pkgname
  msg "Starting to configure Mozart Oz"
  ./configure --prefix=$pkgdir/opt/$_pkgname
  msg "starting to build Mozart Oz"
  make

  cd "$srcdir/$_gitstdname"
  #some systems break on the stdlib configure due to missing dep binaries
  #this seems to fix it
  PATH=$pkgdir/opt/mozart/bin:$PATH
  msg "Starting to configure Mozart Oz Stdlib"
  ./configure --prefix=$pkgdir/opt/$_gitname
  msg "Starting to build Mozart Oz Stdlib"
  make
}

package() {
  msg "Packaging Mozart Oz"
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/opt/$_pkgname" install
  cd "$srcdir/$_gitstdname"
  make DESTDIR="$pkgdir/opt/$_pkgname" install

  mkdir -p $pkgdir/usr/share/licenses/mozart
  install -m 755 -D $srcdir/mozart.profile $pkgdir/etc/profile.d/mozart.sh
  cp $pkgdir/opt/mozart/LICENSE* $pkgdir/usr/share/licenses/mozart
}

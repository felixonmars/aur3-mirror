 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=libbsd-git
pkgver=20110613
pkgrel=3
pkgdesc="Provides useful functions commonly found on BSD systems like strlcpy()"
arch=('i686' 'x86_64')
url="http://libbsd.freedesktop.org"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('libbsd')
conflicts=('libbsd')
source=(LICENSE)
md5sums=('5bd59ff83a7df4873b034478ffae62a6')
_gitroot=('git://anongit.freedesktop.org/git/libbsd')
_gitname=('libbsd')

build() {
 cd $srcdir

 cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..." 

 rm -rf $srcdir/build

 cp -ar "$srcdir/$_gitname" $srcdir/build

 cd $srcdir/build
 make exec_prefix=/usr includedir=/usr/include/libbsd || return 1
}

package() {
  cd $srcdir/build

  make exec_prefix=/usr includedir=/usr/include/libbsd DESTDIR=$pkgdir install
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

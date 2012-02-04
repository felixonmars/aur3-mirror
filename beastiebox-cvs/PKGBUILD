# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=beastiebox-cvs
pkgver=1.6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A BSD alternative to busybox"
url="http://beastiebox.sourceforge.net/"
license=('BSD')
depends=('libbsd')
makedepends=('cvs' 'bmake')
#netbsd-pkgsrc might be needed due to missing mkfiles
source=()
md5sums=()

build() {

msg "getting sources"

  cvs -d :pserver:anonymous@beastiebox.cvs.sourceforge.net:/cvsroot/beastiebox login
  cvs -d :pserver:anonymous@beastiebox.cvs.sourceforge.net:/cvsroot/beastiebox co beastiebox
  
msg "creating sepparate build directory"
  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/beastiebox $srcdir/build

  cd $srcdir/build/beastiebin
  msg "setting up some build variables"
  CFLAGS="${CFLAGS} -lbsd -I/usr/include/libbsd/"
  bmake STATIC=1  -m/usr/share/mk
  bmake install
}

package() {
  mkdir -p $pkgdir/usr/share/licenses/beastiebox/
  mkdir -p $pkgdir/opt/beastiebox/bin

  cd $srcdir/build/
  export PREFIX=$pkgdir/usr
  bmake STATIC=1
  install -m755 $srcdir/build/beastiebin/beastiebox $pkgdir/opt/beastiebox/bin/

  msg "setting up symlinks to beastiebox functions"
}

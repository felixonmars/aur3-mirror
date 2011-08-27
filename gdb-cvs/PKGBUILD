# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gdb-cvs
pkgver=20101019
pkgrel=1
pkgdesc="The GNU Debugger"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL')
depends=('expat' 'ncurses' 'python2')
makedepends=('cvs')
provides=('gdb')
conflicts=('gdb')
backup=('etc/gdb/gdbinit')
options=('!libtool')
install=gdb.install
source=()
md5sums=()

_cvsroot=":pserver:anoncvs@sourceware.org:/cvs/src"
_cvsmod="gdb"

build() {
  cd "$srcdir"
  msg "Connecting to the CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd src
    cvs -z3 update -d
    cd "$srcdir"
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir"/$_cvsmod-build ]; then
    rm -rf "$srcdir"/$_cvsmod-build
  fi

  cp -r "$srcdir"/src "$srcdir"/$_cvsmod-build
  cd "$srcdir"/$_cvsmod-build

  ./configure --prefix=/usr --disable-nls --disable-werror \
              --with-system-readline \
              --with-system-gdbinit=/etc/gdb/gdbinit 
  make
}

package() {
  cd "$srcdir"/$_cvsmod-build
  make DESTDIR="$pkgdir/" install

  # install "custom" system gdbinit
  install -dm755 $pkgdir/etc/gdb
  touch $pkgdir/etc/gdb/gdbinit

  # resolve conflicts with binutils
  rm -f ${pkgdir}/usr/include/{bfd,dis-asm,symcat,ansidecl,bfdlink}.h
  rm -f ${pkgdir}/usr/lib/{libiberty,libbfd,libopcodes}.a
  rm -f ${pkgdir}/usr/share/info/{bfd.info,configure.info,standards.info}
}

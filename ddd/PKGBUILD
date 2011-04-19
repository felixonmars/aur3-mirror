# Maintainer: Drforbin(Merlyn Cousins) Drforbin <drforbin6@gmail.com>
# Fixed Disassembly syntax patch applied
pkgname=ddd-syntaxfix
pkgver=3.3.12
pkgrel=3
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger..."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL3' 'LGPL3')
depends=('gcc-libs' 'ncurses' 'lesstif' 'libxaw' 'elfutils' 'libxext')
provides=('ddd')
optdepends=('gdb: to use the Gnu debugger' 'jdk: to use the Java debugger' 'pydb: to use the Python debugger' 'perl: to use the Perl debugger')
install=ddd.install
changelog=ChangeLog
source=(http://ftp.gnu.org/gnu/ddd/ddd-${pkgver}.tar.gz ddd-3.3.12-gcc44.patch pac-gdb-disassembler-bug.patch)
md5sums=('c50396db7bac3862a6d2555b3b22c34e'
         '41dc59d8cf502569bab1b1a4a222a1c6'
         'd0195704ba44000797982bba178eef59')


build() {
  cd "${srcdir}/ddd-${pkgver}"


  patch -p1 < ../pac-gdb-disassembler-bug.patch
  patch -p1 < ../ddd-3.3.12-gcc44.patch

  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/ddd-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 icons/ddd.xpm "${pkgdir}/usr/share/pixmaps/ddd.xpm"
}

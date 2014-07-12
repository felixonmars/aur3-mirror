# Maintainer: Jonathan Scott Tinkham <sctincman@gmail.com>
# Adapted from arm-none-eabi-gdb by Anatol Pomozov <anatol.pomozov@gmail.com>

_target=epiphany-elf
pkgname=$_target-gdb
_pkgname=epiphany-gdb
pkgver=7.6
pkgrel=1
pkgdesc='The GNU Debugger for the Adapteva Epiphany target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python2)
makedepends=(texinfo)
optdepends=('openocd: for debugging JTAG targets'
            'stlink: for debugging over STLINK')
options=(!emptydirs)
source=(https://github.com/adapteva/${_pkgname}/archive/${_pkgname}-${pkgver}.zip)
md5sums=('d2098c1a643d0195f76bfe80d918be37')

prepare() {
    cd $srcdir
    mv ${_pkgname}-${_pkgname}-${pkgver} gdb-$pkgver
}

build() {
  cd gdb-$pkgver

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  ./configure --target=$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-system-readline \
              --disable-nls \
              --with-python=/usr/bin/python2 \
              --with-system-gdbinit=/etc/gdb/gdbinit \
	      --disable-werror --disable-gdbtk
  make
}

package() {
  cd gdb-$pkgver

  make DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb' package
  rm -r "$pkgdir"/usr/share/info
  # TOTHINK: we remove python module used for debugging. It means arm-*-gdb alone will not be able to debug and 'gdb' package
  # should be installed. File a bug upstream - ask a separate python module folder for cross tools.
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/include/gdb
  #rm "$pkgdir"/usr/share/man/man1/gdb*
  #rm -r "$pkgdir"/usr/share/man/man5
}


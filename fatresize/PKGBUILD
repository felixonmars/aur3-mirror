# Maintainer: speps <speps at aur dot archlinux dot org>

_parver=2.4
pkgname=fatresize
pkgver=1.0.2
pkgrel=2
pkgdesc="The FAT16/FAT32 non-destructive resizer."
arch=(i686 x86_64)
url="https://sourceforge.net/projects/fatresize/"
license=('GPL')
depends=('device-mapper')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        "http://ftp.gnu.org/gnu/parted/parted-$_parver.tar.xz"
        "gnulib-gets.patch")
md5sums=('3bfac57c0801d33ad39e740841e6441e'
         'b6cc55fd6e04b37b1745bc2e10d1a888'
         '8eddedcf6b26d9f9c5a49f55d84ff142')

_build_parted() {
  cd "$srcdir/parted-$_parver"

  if [ ! -d lib$pkgname ]; then

    # rename libparted to libfatresize
    # for including in fatresize
    msg "Renaming libparted to libfatresize ..."
    sed -i "s/parted/$pkgname/gI" `grep -irl parted .`
    for _line in `find . -depth -name "*parted*"`; do 
      mv $_line `echo $_line | sed "s/\(.*\)parted/\1$pkgname/"`
    done

  fi

  if [ ! -f lib$pkgname/.libs/lib$pkgname.so ]; then

    # patching gnulib for gets()
    patch -p1 -i "$srcdir/gnulib-gets.patch"

    msg "Generating configure script ..."
    aclocal -I m4
    autoconf
    automake --add-missing
    ./configure --prefix=/usr \
                --enable-static=no \
                --disable-rpath

    # build libparted 2.4 as a shared
    # lib for using it with fatresize
    cd lib && make
    cd ../lib$pkgname && make
    cp .libs/lib$pkgname.so.0.0.2 "$srcdir/$pkgname-$pkgver/lib$pkgname.so"
    cp -a ../include "$srcdir/$pkgname-$pkgver"
  fi
}

build() {
  _build_parted
  cd "$srcdir/$pkgname-$pkgver"

  # do not look for parted
  sed -e "s|parted/parted.h||" \
      -e "/dnl libparted/,+5d" \
      -i configure.ac

  # fix deprecated API and use libfatresize
  sed -e "/PED_ASSERT/s/, return[^)]*//" \
      -e "s/ped_free/free/" \
      -e "s/parted/$pkgname/g" \
      -i $pkgname.c

  aclocal -I m4
  autoconf
  automake --add-missing

  ./configure --prefix=/usr \
              --sbindir=/usr/bin
  make CFLAGS="-L. -l$pkgname -Iinclude"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # lib
  install -Dm755 lib$pkgname.so "$pkgdir/usr/lib/lib$pkgname.so.0.0.2"
  ln -s lib$pkgname.so.0.0.2 "$pkgdir/usr/lib/lib$pkgname.so"
  ln -s lib$pkgname.so.0.0.2 "$pkgdir/usr/lib/lib$pkgname.so.0"
}

# vim:set ts=2 sw=2 et:

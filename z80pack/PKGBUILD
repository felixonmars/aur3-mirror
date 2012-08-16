# Maintainer:  Michiel Broek <mbse at mbse eu>
pkgname=z80pack
pkgver=1.17
pkgrel=1
pkgdesc="A Z80 simulator and assembler"
arch=('i686' 'x86_64')
url="http://www.autometer.de/unix4fun/z80pack/index.html"
license=('GPL')
depends=()
source=(http://www.autometer.de/unix4fun/z80pack/ftp/$pkgname-$pkgver.tgz cpm2 cpm3 mpm)
md5sums=('c48633ef2050b8cc761e7cf3ea5fb18a'
         'be0b0227006b81c8dd1312e258a5d843'
	 '0a3efc0f97991920b80791b8682ad681'
	 'c734b664091d02306de054e8e148bca0')

package() {
  cd $srcdir/$pkgname-$pkgver
  # Expand the path during build, else the build fails.
  PATH=$PATH:.:$pkgdir/usr/bin
  mkdir -p $pkgdir/usr/bin

  # This is very messy, first build a Z80 assambler
  cd z80asm
  make CFLAGS="${CFLAGS} -minline-all-stringops -c -Wall"
  cp z80asm $pkgdir/usr/bin

  # Next build the simulator and CP/M
  cd $srcdir/$pkgname-$pkgver/cpmsim/srcsim
  echo "  ******"
  echo "  If the makepkg command fails, just run it again and don\'t use \`-c\'"
  echo "  ******"
  make CFLAGS="${CFLAGS} -minline-all-stringops -c -Wall" LFLAGS="-s"
  make clean
  cd $srcdir/$pkgname-$pkgver/cpmsim/srccpm2
  # Don't optimize the tools
  make
  make clean

  # Install binaries
  cd $srcdir/$pkgname-$pkgver/cpmsim
  cp cpmsim $pkgdir/usr/bin
  cp $pkgdir/../cpm* $pkgdir/../mpm $pkgdir/usr/bin
  chmod 755 $pkgdir/usr/bin/*

  # Install auxilary tools
  cd $srcdir/$pkgname-$pkgver/cpmsim/srctools
  make
  mkdir -p $pkgdir/usr/share/z80pack/bin
  cp send receive format bin2hex $pkgdir/usr/share/z80pack/bin
  chmod 755 $pkgdir/usr/share/z80pack/bin/*
  strip $pkgdir/usr/share/z80pack/bin/*

  # Install floppy and harddisks
  mkdir -p $pkgdir/usr/share/z80pack/disks
  cp $srcdir/$pkgname-$pkgver/cpmsim/disks/library/*.dsk $pkgdir/usr/share/z80pack/disks

  # Install the docs without the pdf file.
  mkdir -p $pkgdir/usr/share/doc/$pkgname-$pkgver
  cp $srcdir/$pkgname-$pkgver/doc/* $pkgdir/usr/share/doc/$pkgname-$pkgver
  rm -f $pkgdir/usr/share/doc/$pkgname-$pkgver/*.pdf
}


# Maintainer: Alec Ari <neotheuser@ymail.com>

pkgname=emc2
pkgver=2.4.5
pkgrel=1
pkgdesc="EMC2 is software that runs on Linux, on most standard PCs, that can interpret G-code and run a CNC machine."
#Remove 64-bit support for now since RTAI doesn't work
arch=('i686')
license=('GPL2')
url="http://linuxcnc.org/"
depends=('rtai-kernel' 'rtai-userspace' 'bc' 'bwidget' 'tcl' 'tk' 'xorg-server')
install=$pkgname.install
source=('http://downloads.sourceforge.net/project/emc/emc2/2.4.x/emc2_2.4.5/emc2_2.4.5.tar.gz' 'Makefile' 'Submakefile' 'jepler-modsilent.patch')
md5sums=('564d59ee179bc2e3f52cf1eb91889798'
         '223467f9c6845fdc58ccac8b080964a0'
         '32fbcfb62dfed15c675188f4303858a2'
         'a9cdee6103bc8ec12562f513dfebc716')

build () {
  cd $srcdir/$pkgname-$pkgver/src/hal/drivers
  #"Patch" it :)
  sed -i 's/pci_find_device/pci_get_device/g' *.c
  cd $srcdir/$pkgname-$pkgver/src
  #This Makefile line fixes a seg fault due to changed CFLAGS
  cp -PR $srcdir/Makefile $srcdir/$pkgname-$pkgver/src/Makefile
  #This fixes build for updated Python libraries
  cp -PR $srcdir/Submakefile $srcdir/$pkgname-$pkgver/src/hal/drivers/Submakefile
  #Another Python fix
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 < $srcdir/jepler-modsilent.patch
  cd $srcdir/$pkgname-$pkgver/src
  ./configure --prefix=/usr --with-python=/usr/bin/python2.7 || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1
  #Fix lsmod
  sed -i 's/sbin/bin/g' $pkgdir/etc/init.d/realtime
  #Stop hiding it from GNOME
  cp -PR $srcdir/$pkgname-$pkgver/share/applications $pkgdir/usr/share/
  mkdir -p $pkgdir/etc/xdg
  cp -PR $srcdir/$pkgname-$pkgver/share/menus $pkgdir/etc/xdg/
}

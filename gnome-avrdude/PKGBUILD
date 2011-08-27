# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=gnome-avrdude
pkgver=0.1
pkgrel=3
pkgdesc="GUI for the command-line Atmel AVR microcontroller programming software "avrdude""
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnome-avrdude/"
license=('GPL')
depends=('libgnomeui')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz
        avrdude-5.5.usbtiny.64bit.patch)
md5sums=('c32ffa91290c72eb25fc2cf232b2c36b'
         '57770093c1389d8745efb7f19e6ce95b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  if [ $CARCH = 'x86_64' ] ; then
    patch -Np1 -i ${srcdir}/avrdude-5.5.usbtiny.64bit.patch
  fi
  ./configure --mandir=/usr/share/man --prefix=/usr --sysconfdir=/etc
  sed -e 's|doc/|share/doc/|' -i Makefile
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}


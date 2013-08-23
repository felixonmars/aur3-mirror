# Maintainer: Félix Saparelli <AUR@passcod.name>
pkgname=linemode-git
pkgver=5.4.1
pkgrel=5
pkgdesc="Character based Web browser developed for use on terminals"
arch=('i386' 'x86_64')
url="http://first-website.web.cern.ch/"
license=('W3C')
makedepends=('git' 'perl')
depends=('glibc' 'expat')
source=('git://github.com/w3c/libwww.git' 'libwww.patch' 'expat-2.1.0.tar.gz')
sha512sums=('SKIP' '1b07aa64746c2af2f8da6bf6a4bf7826afec9b9ae6ba5c017e4b64169ca15683be98560161769f6586094d257c44c432b1b69fbd24c76547025ffb7cd7ae8333' '0785ab62579df361b833c06cb33ba5ef026adfc72769a29adc0f273e7b91e35199bc20d7f36853c32745ad25ab90719f95d0cb74269435e7de865109b28215c1')

build() {
  cd libwww
  root=$(pwd) 
  git apply ../libwww.patch

  cd modules
  cp -rf $root/../expat .
  cd expat
  ./buildconf.sh
  ./configure --prefix=/usr

  cd $root
  perl config/winConfigure.pl
  aclocal
  autoheader
  automake --add-missing --foreign
  autoconf
  ./configure --prefix=/usr
  rm libtool
  ln -s $(which libtool)
  make |tee # This might error, but we don't mind

  cd PICS-client
  make

  cd ../LineMode
  make
}

package() {
  cd libwww
  make DESTDIR="${pkgdir}" install |tee

  cd PICS-client
  make DESTDIR="${pkgdir}" install

  cd ../LineMode
  make DESTDIR="${pkgdir}" install

  rm ${pkgdir}/usr/lib/lib{www,md5,pics}*.la
  rm ${pkgdir}/usr/lib/libexpat*
  rm ${pkgdir}/usr/include/expat*
  rm -r ${pkgdir}/usr/lib/pkgconfig
  rm ${pkgdir}/usr/bin/xmlwf
  rm -r ${pkgdir}/usr/share/man/*
}

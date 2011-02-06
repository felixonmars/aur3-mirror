# Contributor: Spooky Hunter <spookyh@hotmail.com>

pkgname=httsquash
pkgver=0.6a
pkgrel=1
pkgdesc="http server scanner"
arch=('i686' 'x86_64')
url="http://complemento.sourceforge.net/"
license=('GPL2')
depends=('glibc')
source=(http://xoomer.alice.it/spookyh/httsquash_new.tar.gz)
md5sums=('e0a4a770e4d28e9b253174e05168f4d7')

build() {
  cd ${srcdir}/${pkgname}
  make || return 1
#  make DESTDIR=$pkgdir/ install

   # copying files
   # install -d ${startdir}/pkg/usr/share/{database,payloads}
   mkdir -p ${startdir}/pkg/usr/share/
   cp -r database/ ${startdir}/pkg/usr/share/
   cp -r payloads/ ${startdir}/pkg/usr/share/
   mkdir -p ${startdir}/pkg/usr/bin
   cp httsquash ${startdir}/pkg/usr/bin/
}


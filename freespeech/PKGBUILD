pkgname=(freespeech)
pkgver=1.0m
pkgrel=1
pkgdesc="English Text-To-Phoneme converter"
arch=(i686 x86_64)
url="http://poretsky.homelinux.net/packages/"
license=('GPL')
depends=()
source=('http://poretsky.homelinux.net/packages/ubuntu/pool/karmic/free/freespeech_1.0m.orig.tar.gz'
'http://poretsky.homelinux.net/packages/ubuntu/pool/karmic/free/freespeech_1.0m-3.diff.gz')
md5sums=('a8cbdc6693f9e0dff44cbdbd03ab4d83'
         '850032409873ea20ea44eb22e816f073')

build(){

  cd ${srcdir}/$pkgname-${pkgver}.orig/

  gunzip -c ${srcdir}/../freespeech_1.0m-3.diff.gz |  patch -p1 
#  cd src

#  sed -i s#ndbm.h#gdbm/ndbm.h#g space.c || return 1
#  sed -i s#ndbm.h#gdbm/ndbm.h#g transcribe.c || return 1
#  sed -i -e 's#LIBS = -lm -lgdbm#LIBS = -lm -lgdbm_compat#g' Makefile || return 1

  make
}

package(){
  cd ${srcdir}/$pkgname-${pkgver}.orig/
  make DESTDIR="$pkgdir" install
}
